const std = @import("std");

var allocator: std.mem.Allocator = undefined;
const writer = std.io.getStdOut().writer();

const hash = std.hash.Fnv1a_32.hash;

// common defines - TODO make command line option
// - IMGUI_USE_WCHAR32
// - IMGUI_USE_BGRA_PACKED_COLOR
// - IMGUI_DISABLE_OBSOLETE_KEYIO
// - IMGUI_DISABLE_OBSOLETE_FUNCTIONS

const defines = [_][]const u8{
    "IMGUI_DISABLE_OBSOLETE_KEYIO",
    "IMGUI_DISABLE_OBSOLETE_FUNCTIONS",
};
const type_aliases = [_][2][]const u8{
    .{ "va_list", "c.va_list" },
    .{ "size_t", "usize" },

    // maybe make a system for templates?
    .{ "ImVector_char", "Vector(u8)" },
    .{ "ImVector_float", "Vector(f32)" },
    .{ "ImVector_ImDrawChannel", "Vector(DrawChannel)" },
    .{ "ImVector_ImDrawCmd", "Vector(DrawCmd)" },
    .{ "ImVector_ImDrawIdx", "Vector(DrawIdx)" },
    .{ "ImVector_ImDrawListPtr", "Vector(*DrawList)" },
    .{ "ImVector_ImDrawVert", "Vector(DrawVert)" },
    .{ "ImVector_ImFontAtlasCustomRect", "Vector(FontAtlasCustomRect)" },
    .{ "ImVector_ImFontConfig", "Vector(FontConfig)" },
    .{ "ImVector_ImFontGlyph", "Vector(FontGlyph)" },
    .{ "ImVector_ImFontPtr", "Vector(*Font)" },
    .{ "ImVector_ImGuiStorage_ImGuiStoragePair", "Vector(Storage_ImGuiStoragePair)" },
    .{ "ImVector_ImGuiTextFilter_ImGuiTextRange", "Vector(TextFilter_ImGuiTextRange)" },
    .{ "ImVector_ImTextureID", "Vector(TextureID)" },
    .{ "ImVector_ImU32", "Vector(U32)" },
    .{ "ImVector_ImVec2", "Vector(Vec2)" },
    .{ "ImVector_ImVec4", "Vector(Vec4)" },
    .{ "ImVector_ImWchar", "Vector(Wchar)" },
};
const bounds_aliases = [_][2][]const u8{
    .{ "(IM_UNICODE_CODEPOINT_MAX +1)/4096/8", "(UNICODE_CODEPOINT_MAX+1)/4096/8" },
    .{ "IM_DRAWLIST_TEX_LINES_WIDTH_MAX+1", "DRAWLIST_TEX_LINES_WIDTH_MAX+1" },
};
const namespaces = [_][]const u8{
    "IMGUI",
    "IM",
    "ImGui",
    "Im",
};
const is_many_item_field = [_][2][]const u8{
    .{ "TableSortSpecs", "Specs" },
    .{ "DrawList", "_VtxWritePtr" },
    .{ "DrawList", "_IdxWritePtr" },
    .{ "FontConfig", "GlyphRanges" },
    .{ "FontAtlas", "TexPixelsAlpha8" },
    .{ "FontAtlas", "TexPixelsRGBA32" },
};

var defines_set: std.StringHashMapUnmanaged(void) = .{};
var type_aliases_map: std.StringHashMapUnmanaged([]const u8) = .{};
var bounds_aliases_map: std.StringHashMapUnmanaged([]const u8) = .{};
var is_many_item_field_set: std.StringHashMapUnmanaged(std.StringHashMapUnmanaged(void)) = .{};
var known_enums: std.StringHashMapUnmanaged(void) = .{};
var known_enum_element_values: std.AutoHashMapUnmanaged(i64, []const u8) = .{};
var skip_enum_element_names: std.StringHashMapUnmanaged(void) = .{};

fn write(str: []const u8) void {
    writer.writeAll(str) catch unreachable;
}

fn print(comptime format: []const u8, args: anytype) void {
    std.fmt.format(writer, format, args) catch unreachable;
}

fn trimPrefixOpt(name: []const u8, prefix: []const u8) ?[]const u8 {
    return if (std.mem.startsWith(u8, name, prefix))
        name[prefix.len..]
    else
        null;
}

fn trimPrefix(name: []const u8, prefix: []const u8) []const u8 {
    return if (std.mem.startsWith(u8, name, prefix))
        name[prefix.len..]
    else
        name;
}

fn trimNamespace(name: []const u8) []const u8 {
    for (namespaces) |prefix| {
        if (std.mem.startsWith(u8, name, prefix)) {
            return name[prefix.len..];
        }
    }

    return name;
}

fn trimLeadingUnderscore(name: []const u8) []const u8 {
    return if (name.len > 2 and name[0] == '_' and std.ascii.isAlphanumeric(name[1])) name[1..name.len] else name;
}

fn trimTrailingUnderscore(name: []const u8) []const u8 {
    return if (name.len > 1 and name[name.len - 1] == '_') name[0 .. name.len - 1] else name;
}

fn evaluateConditional(x: std.json.Value) bool {
    const condition = x.object.get("condition").?.string;
    const expression = x.object.get("expression").?.string;
    return switch (hash(condition)) {
        hash("ifdef") => defines_set.contains(expression),
        hash("ifndef") => !defines_set.contains(expression),
        else => false,
    };
}

fn evaluateConditionals(x: std.json.Value) bool {
    for (x.array.items) |item| {
        if (!evaluateConditional(item))
            return false;
    }

    return true;
}

fn keepElement(x: std.json.Value) bool {
    if (x.object.get("conditionals")) |conditionals| {
        return evaluateConditionals(conditionals);
    }

    return true;
}

fn emitDefine(x: std.json.Value) void {
    if (!keepElement(x)) return;
    const full_name = x.object.get("name").?.string;
    const name = trimLeadingUnderscore(trimNamespace(full_name));
    if (x.object.get("content")) |content| {
        print("pub const {s} = {s};\n", .{ name, content.string });
    }
}

fn emitDefines(x: std.json.Value) void {
    for (x.array.items) |item| emitDefine(item);
}

fn emitDuplicateEnumElement(x: std.json.Value, enum_full_name: []const u8) void {
    if (!keepElement(x)) return;
    const full_name = x.object.get("name").?.string;
    if (x.object.get("value")) |value| {
        if (known_enum_element_values.get(value.integer)) |other_full_name| {
            const name = trimLeadingUnderscore(trimPrefix(full_name, enum_full_name));
            const enum_name = trimTrailingUnderscore(trimNamespace(enum_full_name));
            const other_name = trimLeadingUnderscore(trimPrefix(other_full_name, enum_full_name));
            print("    const {s} = {s}.{s};\n", .{ name, enum_name, other_name });
            skip_enum_element_names.put(allocator, full_name, {}) catch @panic("OutOfMemory");
        }
        known_enum_element_values.put(allocator, value.integer, full_name) catch @panic("OutOfMemory");
    }
}

fn emitDuplicateEnumElements(x: std.json.Value, enum_name: []const u8) void {
    for (x.array.items) |item| emitDuplicateEnumElement(item, enum_name);
}

fn emitEnumElement(x: std.json.Value, enum_name: []const u8) void {
    if (!keepElement(x)) return;
    const full_name = x.object.get("name").?.string;
    if (skip_enum_element_names.contains(full_name)) return;
    const name = trimLeadingUnderscore(trimPrefix(full_name, enum_name));
    if (x.object.get("value")) |value| {
        print("    {s} = {},\n", .{ name, value.integer });
    } else {
        print("    {s},\n", .{name});
    }
}

fn emitEnumElements(x: std.json.Value, enum_name: []const u8) void {
    for (x.array.items) |item| emitEnumElement(item, enum_name);
}

fn emitEnum(x: std.json.Value) void {
    if (!keepElement(x)) return;
    const full_name = x.object.get("name").?.string;
    const name = trimTrailingUnderscore(trimNamespace(full_name));
    print("pub const {s} = enum(c_int) {{\n", .{name});
    emitDuplicateEnumElements(x.object.get("elements").?, full_name);
    emitEnumElements(x.object.get("elements").?, full_name);
    write("};\n");

    known_enums.put(allocator, name, {}) catch unreachable;
    known_enum_element_values.clearRetainingCapacity();
    skip_enum_element_names.clearRetainingCapacity();
}

fn emitEnums(x: std.json.Value) void {
    for (x.array.items) |item| emitEnum(item);
}

fn emitStorageClass(x: std.json.Value) void {
    write(switch (hash(x.string)) {
        hash("const") => "const ",
        else => "",
    });
}

fn emitStorageClasses(x: std.json.Value) void {
    for (x.array.items) |item| emitStorageClass(item);
}

fn emitBuiltinType(x: std.json.Value) void {
    const builtin_type = x.object.get("builtin_type").?.string;
    write(switch (hash(builtin_type)) {
        hash("void") => "void",
        hash("char") => "c_char",
        hash("unsigned_char") => "c_char", // ???
        hash("short") => "c_short",
        hash("unsigned_short") => "c_ushort",
        hash("int") => "c_int",
        hash("unsigned_int") => "c_uint",
        hash("long") => "c_long",
        hash("unsigned_long") => "c_ulong",
        hash("long_long") => "c_longlong",
        hash("unsigned_long_long") => "c_ulonglong",
        hash("float") => "f32",
        hash("double") => "f64",
        hash("long_double") => "c_longdouble",
        hash("bool") => "bool",
        else => std.debug.panic("unknown builtin_type {s}", .{builtin_type}),
    });
}

fn emitUserType(x: std.json.Value) void {
    const full_name = x.object.get("name").?.string;
    if (type_aliases_map.get(full_name)) |alias| {
        write(alias);
    } else {
        const name = trimNamespace(full_name);
        write(name);
    }
}

fn isNullable(x: std.json.Value) bool {
    if (x.object.get("is_nullable")) |is_nullable| {
        return is_nullable.bool;
    }

    return true;
}

fn emitPointerType(x: std.json.Value, is_many_item: bool) void {
    if (isNullable(x))
        write("?");

    const inner_type = x.object.get("inner_type").?;
    if (is_many_item) {
        write("[*]");
        emitTypeDesc(inner_type, false);
    } else {
        const inner_type_kind = inner_type.object.get("kind").?.string;
        switch (hash(inner_type_kind)) {
            hash("Builtin") => {
                const builtin_type = inner_type.object.get("builtin_type").?.string;
                switch (hash(builtin_type)) {
                    hash("void") => {
                        write("*anyopaque");
                        return;
                    },
                    hash("char") => {
                        write("[*:0]const u8");
                        return;
                    },
                    else => {},
                }
            },
            else => {},
        }

        write("*");
        emitTypeDesc(inner_type, false);
    }
}

fn emitFunctionParameters(x: std.json.Value) void {
    for (x.array.items, 0..) |item, i| {
        if (i > 0) write(", ");
        emitTypeDesc(item, false);
    }
}

fn emitFunctionType(x: std.json.Value) void {
    write("const fn (");
    emitFunctionParameters(x.object.get("parameters").?);
    write(") callconv(.C) ");
    emitTypeDesc(x.object.get("return_type").?, false);
}

fn emitArrayType(x: std.json.Value) void {
    write("[");
    if (x.object.get("bounds")) |bounds| {
        if (bounds_aliases_map.get(bounds.string)) |alias| {
            write(alias);
        } else {
            if (trimPrefixOpt(bounds.string, "ImGui")) |name| {
                if (std.mem.indexOfScalar(u8, name, '_')) |i| {
                    const enum_name = name[0..i];
                    const element_name = name[i + 1 .. name.len];
                    print("@intFromEnum({s}.{s})", .{ enum_name, element_name });
                } else {
                    write(bounds.string);
                }
            } else {
                write(bounds.string);
            }
        }
    } else {
        write("*");
    }
    write("]");
    emitTypeDesc(x.object.get("inner_type").?, false);
}

fn emitTypeDesc(x: std.json.Value, is_many_item: bool) void {
    if (x.object.get("storage_classes")) |storage_classes| {
        emitStorageClasses(storage_classes);
    }

    const kind = x.object.get("kind").?.string;
    switch (hash(kind)) {
        hash("Builtin") => emitBuiltinType(x),
        hash("User") => emitUserType(x),
        hash("Pointer") => emitPointerType(x, is_many_item),
        hash("Type") => emitTypeDesc(x.object.get("inner_type").?, false),
        hash("Function") => emitFunctionType(x),
        hash("Array") => emitArrayType(x),
        else => std.debug.panic("unknown type kind {s}", .{kind}),
    }
}

fn emitType(x: std.json.Value, is_many_item: bool) void {
    const description = x.object.get("description").?;
    emitTypeDesc(description, is_many_item);
}

fn emitTypedef(x: std.json.Value) void {
    if (!keepElement(x)) return;
    const full_name = x.object.get("name").?.string;
    const name = trimNamespace(full_name);
    if (!known_enums.contains(name)) {
        print("pub const {s} = ", .{name});
        emitType(x.object.get("type").?, false);
        write(";\n");
    }
}

fn emitTypedefs(x: std.json.Value) void {
    for (x.array.items) |item| emitTypedef(item);
}

fn isManyItem(struct_name: []const u8, field_name: []const u8) bool {
    if (is_many_item_field_set.get(struct_name)) |struct_field_set|
        return struct_field_set.contains(field_name);
    return false;
}

fn emitStructField(x: std.json.Value, struct_name: []const u8) void {
    if (!keepElement(x)) return;
    const full_name = x.object.get("name").?.string;
    const name = full_name;
    const is_many_item = isManyItem(struct_name, name);
    print("    {s}: ", .{name});
    emitType(x.object.get("type").?, is_many_item);
    write(",\n");
}

fn emitStructFields(x: std.json.Value, struct_name: []const u8) void {
    for (x.array.items) |item| emitStructField(item, struct_name);
}

fn emitStruct(x: std.json.Value) void {
    if (!keepElement(x)) return;
    const full_name = x.object.get("name").?.string;
    if (type_aliases_map.contains(full_name)) return;
    const name = trimNamespace(full_name);
    print("pub const {s} = extern struct {{\n", .{name});
    emitStructFields(x.object.get("fields").?, name);
    write("};\n");
}

fn emitStructs(x: std.json.Value) void {
    write("pub fn Vector(comptime T: type) type {\n");
    write("    return extern struct {\n");
    write("        Size: c_int,\n");
    write("        Capacity: c_int,\n");
    write("        Data: [*]T,\n");
    write("    };\n");
    write("}\n");

    for (x.array.items) |item| emitStruct(item);
}

fn emitFunctionArgument(x: std.json.Value) void {
    if (x.object.get("is_varargs").?.bool) {
        write("...");
    } else {
        const full_name = x.object.get("name").?.string;
        const name = full_name;
        print("{s}: ", .{name});
        if (x.object.get("type")) |_| {
            emitType(x.object.get("type").?, false);
        } else {
            std.debug.print("no type {s}\n", .{full_name});
        }
    }
}

fn emitFunctionArguments(x: std.json.Value) void {
    for (x.array.items, 0..) |item, i| {
        if (i > 0) write(", ");
        emitFunctionArgument(item);
    }
}

fn emitExternFunction(x: std.json.Value) void {
    if (!keepElement(x)) return;
    const full_name = x.object.get("name").?.string;

    print("extern fn {s}(", .{full_name});
    emitFunctionArguments(x.object.get("arguments").?);
    write(") ");
    emitType(x.object.get("return_type").?, false);
    write(";\n");
}

fn emitPubFunction(x: std.json.Value) void {
    if (!keepElement(x)) return;
    const full_name = x.object.get("name").?.string;

    const name = trimLeadingUnderscore(trimNamespace(full_name));
    print("pub const {s} = {s};\n", .{ name, full_name });
}

fn emitFunctions(x: std.json.Value) void {
    for (x.array.items) |item| emitExternFunction(item);
    for (x.array.items) |item| emitPubFunction(item);
}

fn emit(x: std.json.Value) void {
    write("const std = @import(\"std\");\n");
    write("const c = @cImport({\n");
    write("    @cInclude(\"stdarg.h\");\n");
    write("});\n");
    emitDefines(x.object.get("defines").?);
    emitEnums(x.object.get("enums").?);
    emitTypedefs(x.object.get("typedefs").?);
    emitStructs(x.object.get("structs").?);
    emitFunctions(x.object.get("functions").?);
    write("test {\n");
    write("    std.testing.refAllDeclsRecursive(@This());\n");
    write("}\n");
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    allocator = gpa.allocator();

    for (defines) |entry| try defines_set.put(allocator, entry, {});
    for (type_aliases) |entry| try type_aliases_map.put(allocator, entry[0], entry[1]);
    for (bounds_aliases) |entry| try bounds_aliases_map.put(allocator, entry[0], entry[1]);
    for (is_many_item_field) |entry| {
        var struct_entry = try is_many_item_field_set.getOrPut(allocator, entry[0]);
        if (!struct_entry.found_existing)
            struct_entry.value_ptr.* = .{};
        try struct_entry.value_ptr.*.put(allocator, entry[1], {});
    }

    defer defines_set.deinit(allocator);
    defer type_aliases_map.deinit(allocator);
    defer bounds_aliases_map.deinit(allocator);
    defer {
        var it = is_many_item_field_set.iterator();
        while (it.next()) |entry| {
            entry.value_ptr.*.deinit(allocator);
        }
        is_many_item_field_set.deinit(allocator);
    }
    defer known_enums.deinit(allocator);
    defer known_enum_element_values.deinit(allocator);
    defer skip_enum_element_names.deinit(allocator);

    var file = try std.fs.cwd().openFile("cimgui.json", .{});
    defer file.close();

    const file_data = try file.readToEndAlloc(allocator, std.math.maxInt(usize));
    defer allocator.free(file_data);

    var valueTree = try std.json.parseFromSlice(std.json.Value, allocator, file_data, .{});
    defer valueTree.deinit();

    emit(valueTree.value);
}
