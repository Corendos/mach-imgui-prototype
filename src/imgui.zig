const std = @import("std");
const c = @cImport({
    @cInclude("stdarg.h");
});
pub const IMGUI_VERSION = "1.90 WIP";
pub const IMGUI_VERSION_NUM = 18995;
const IM_DRAWLIST_TEX_LINES_WIDTH_MAX = 63;
const IM_UNICODE_CODEPOINT_MAX = 0xFFFF;
pub const DrawCallback_ResetRenderState: *DrawCallback = @ptrFromInt(~0);
pub const WindowFlags = enum(c_int) {
    None = 0,
    NoTitleBar = 1,
    NoResize = 2,
    NoMove = 4,
    NoScrollbar = 8,
    NoScrollWithMouse = 16,
    NoCollapse = 32,
    AlwaysAutoResize = 64,
    NoBackground = 128,
    NoSavedSettings = 256,
    NoMouseInputs = 512,
    MenuBar = 1024,
    HorizontalScrollbar = 2048,
    NoFocusOnAppearing = 4096,
    NoBringToFrontOnFocus = 8192,
    AlwaysVerticalScrollbar = 16384,
    AlwaysHorizontalScrollbar = 32768,
    AlwaysUseWindowPadding = 65536,
    NoNavInputs = 262144,
    NoNavFocus = 524288,
    UnsavedDocument = 1048576,
    NoNav = 786432,
    NoDecoration = 43,
    NoInputs = 786944,
    NavFlattened = 8388608,
    ChildWindow = 16777216,
    Tooltip = 33554432,
    Popup = 67108864,
    Modal = 134217728,
    ChildMenu = 268435456,
};
pub const InputTextFlags = enum(c_int) {
    None = 0,
    CharsDecimal = 1,
    CharsHexadecimal = 2,
    CharsUppercase = 4,
    CharsNoBlank = 8,
    AutoSelectAll = 16,
    EnterReturnsTrue = 32,
    CallbackCompletion = 64,
    CallbackHistory = 128,
    CallbackAlways = 256,
    CallbackCharFilter = 512,
    AllowTabInput = 1024,
    CtrlEnterForNewLine = 2048,
    NoHorizontalScroll = 4096,
    AlwaysOverwrite = 8192,
    ReadOnly = 16384,
    Password = 32768,
    NoUndoRedo = 65536,
    CharsScientific = 131072,
    CallbackResize = 262144,
    CallbackEdit = 524288,
    EscapeClearsAll = 1048576,
};
pub const TreeNodeFlags = enum(c_int) {
    None = 0,
    Selected = 1,
    Framed = 2,
    AllowOverlap = 4,
    NoTreePushOnOpen = 8,
    NoAutoOpenOnLog = 16,
    DefaultOpen = 32,
    OpenOnDoubleClick = 64,
    OpenOnArrow = 128,
    Leaf = 256,
    Bullet = 512,
    FramePadding = 1024,
    SpanAvailWidth = 2048,
    SpanFullWidth = 4096,
    SpanAllColumns = 8192,
    NavLeftJumpsBackHere = 16384,
    CollapsingHeader = 26,
    AllowItemOverlap = 4,
};
pub const PopupFlags = enum(c_int) {
    None = 0,
    MouseButtonLeft = 0,
    MouseButtonRight = 1,
    MouseButtonMiddle = 2,
    MouseButtonMask_ = 31,
    MouseButtonDefault_ = 1,
    NoOpenOverExistingPopup = 32,
    NoOpenOverItems = 64,
    AnyPopupId = 128,
    AnyPopupLevel = 256,
    AnyPopup = 384,
};
pub const SelectableFlags = enum(c_int) {
    None = 0,
    DontClosePopups = 1,
    SpanAllColumns = 2,
    AllowDoubleClick = 4,
    Disabled = 8,
    AllowOverlap = 16,
    AllowItemOverlap = 16,
};
pub const ComboFlags = enum(c_int) {
    None = 0,
    PopupAlignLeft = 1,
    HeightSmall = 2,
    HeightRegular = 4,
    HeightLarge = 8,
    HeightLargest = 16,
    NoArrowButton = 32,
    NoPreview = 64,
    WidthFitPreview = 128,
    HeightMask_ = 30,
};
pub const TabBarFlags = enum(c_int) {
    None = 0,
    Reorderable = 1,
    AutoSelectNewTabs = 2,
    TabListPopupButton = 4,
    NoCloseWithMiddleMouseButton = 8,
    NoTabListScrollingButtons = 16,
    NoTooltip = 32,
    FittingPolicyResizeDown = 64,
    FittingPolicyScroll = 128,
    FittingPolicyMask_ = 192,
    FittingPolicyDefault_ = 64,
};
pub const TabItemFlags = enum(c_int) {
    None = 0,
    UnsavedDocument = 1,
    SetSelected = 2,
    NoCloseWithMiddleMouseButton = 4,
    NoPushId = 8,
    NoTooltip = 16,
    NoReorder = 32,
    Leading = 64,
    Trailing = 128,
};
pub const TableFlags = enum(c_int) {
    None = 0,
    Resizable = 1,
    Reorderable = 2,
    Hideable = 4,
    Sortable = 8,
    NoSavedSettings = 16,
    ContextMenuInBody = 32,
    RowBg = 64,
    BordersInnerH = 128,
    BordersOuterH = 256,
    BordersInnerV = 512,
    BordersOuterV = 1024,
    BordersH = 384,
    BordersV = 1536,
    BordersInner = 640,
    BordersOuter = 1280,
    Borders = 1920,
    NoBordersInBody = 2048,
    NoBordersInBodyUntilResize = 4096,
    SizingFixedFit = 8192,
    SizingFixedSame = 16384,
    SizingStretchProp = 24576,
    SizingStretchSame = 32768,
    NoHostExtendX = 65536,
    NoHostExtendY = 131072,
    NoKeepColumnsVisible = 262144,
    PreciseWidths = 524288,
    NoClip = 1048576,
    PadOuterX = 2097152,
    NoPadOuterX = 4194304,
    NoPadInnerX = 8388608,
    ScrollX = 16777216,
    ScrollY = 33554432,
    SortMulti = 67108864,
    SortTristate = 134217728,
    HighlightHoveredColumn = 268435456,
    SizingMask_ = 57344,
};
pub const TableColumnFlags = enum(c_int) {
    None = 0,
    Disabled = 1,
    DefaultHide = 2,
    DefaultSort = 4,
    WidthStretch = 8,
    WidthFixed = 16,
    NoResize = 32,
    NoReorder = 64,
    NoHide = 128,
    NoClip = 256,
    NoSort = 512,
    NoSortAscending = 1024,
    NoSortDescending = 2048,
    NoHeaderLabel = 4096,
    NoHeaderWidth = 8192,
    PreferSortAscending = 16384,
    PreferSortDescending = 32768,
    IndentEnable = 65536,
    IndentDisable = 131072,
    AngledHeader = 262144,
    IsEnabled = 16777216,
    IsVisible = 33554432,
    IsSorted = 67108864,
    IsHovered = 134217728,
    WidthMask_ = 24,
    IndentMask_ = 196608,
    StatusMask_ = 251658240,
    NoDirectResize_ = 1073741824,
};
pub const TableRowFlags = enum(c_int) {
    None = 0,
    Headers = 1,
};
pub const TableBgTarget = enum(c_int) {
    None = 0,
    RowBg0 = 1,
    RowBg1 = 2,
    CellBg = 3,
};
pub const FocusedFlags = enum(c_int) {
    None = 0,
    ChildWindows = 1,
    RootWindow = 2,
    AnyWindow = 4,
    NoPopupHierarchy = 8,
    RootAndChildWindows = 3,
};
pub const HoveredFlags = enum(c_int) {
    None = 0,
    ChildWindows = 1,
    RootWindow = 2,
    AnyWindow = 4,
    NoPopupHierarchy = 8,
    AllowWhenBlockedByPopup = 32,
    AllowWhenBlockedByActiveItem = 128,
    AllowWhenOverlappedByItem = 256,
    AllowWhenOverlappedByWindow = 512,
    AllowWhenDisabled = 1024,
    NoNavOverride = 2048,
    AllowWhenOverlapped = 768,
    RectOnly = 928,
    RootAndChildWindows = 3,
    ForTooltip = 4096,
    Stationary = 8192,
    DelayNone = 16384,
    DelayShort = 32768,
    DelayNormal = 65536,
    NoSharedDelay = 131072,
};
pub const DragDropFlags = enum(c_int) {
    None = 0,
    SourceNoPreviewTooltip = 1,
    SourceNoDisableHover = 2,
    SourceNoHoldToOpenOthers = 4,
    SourceAllowNullID = 8,
    SourceExtern = 16,
    SourceAutoExpirePayload = 32,
    AcceptBeforeDelivery = 1024,
    AcceptNoDrawDefaultRect = 2048,
    AcceptNoPreviewTooltip = 4096,
    AcceptPeekOnly = 3072,
};
pub const DataType = enum(c_int) {
    S8 = 0,
    U8 = 1,
    S16 = 2,
    U16 = 3,
    S32 = 4,
    U32 = 5,
    S64 = 6,
    U64 = 7,
    Float = 8,
    Double = 9,
    COUNT = 10,
};
pub const Dir = enum(c_int) {
    None = -1,
    Left = 0,
    Right = 1,
    Up = 2,
    Down = 3,
    COUNT = 4,
};
pub const SortDirection = enum(c_int) {
    None = 0,
    Ascending = 1,
    Descending = 2,
};
pub const Key = enum(c_int) {
    _None = 0,
    _Tab = 512,
    _LeftArrow = 513,
    _RightArrow = 514,
    _UpArrow = 515,
    _DownArrow = 516,
    _PageUp = 517,
    _PageDown = 518,
    _Home = 519,
    _End = 520,
    _Insert = 521,
    _Delete = 522,
    _Backspace = 523,
    _Space = 524,
    _Enter = 525,
    _Escape = 526,
    _LeftCtrl = 527,
    _LeftShift = 528,
    _LeftAlt = 529,
    _LeftSuper = 530,
    _RightCtrl = 531,
    _RightShift = 532,
    _RightAlt = 533,
    _RightSuper = 534,
    _Menu = 535,
    _0 = 536,
    _1 = 537,
    _2 = 538,
    _3 = 539,
    _4 = 540,
    _5 = 541,
    _6 = 542,
    _7 = 543,
    _8 = 544,
    _9 = 545,
    _A = 546,
    _B = 547,
    _C = 548,
    _D = 549,
    _E = 550,
    _F = 551,
    _G = 552,
    _H = 553,
    _I = 554,
    _J = 555,
    _K = 556,
    _L = 557,
    _M = 558,
    _N = 559,
    _O = 560,
    _P = 561,
    _Q = 562,
    _R = 563,
    _S = 564,
    _T = 565,
    _U = 566,
    _V = 567,
    _W = 568,
    _X = 569,
    _Y = 570,
    _Z = 571,
    _F1 = 572,
    _F2 = 573,
    _F3 = 574,
    _F4 = 575,
    _F5 = 576,
    _F6 = 577,
    _F7 = 578,
    _F8 = 579,
    _F9 = 580,
    _F10 = 581,
    _F11 = 582,
    _F12 = 583,
    _F13 = 584,
    _F14 = 585,
    _F15 = 586,
    _F16 = 587,
    _F17 = 588,
    _F18 = 589,
    _F19 = 590,
    _F20 = 591,
    _F21 = 592,
    _F22 = 593,
    _F23 = 594,
    _F24 = 595,
    _Apostrophe = 596,
    _Comma = 597,
    _Minus = 598,
    _Period = 599,
    _Slash = 600,
    _Semicolon = 601,
    _Equal = 602,
    _LeftBracket = 603,
    _Backslash = 604,
    _RightBracket = 605,
    _GraveAccent = 606,
    _CapsLock = 607,
    _ScrollLock = 608,
    _NumLock = 609,
    _PrintScreen = 610,
    _Pause = 611,
    _Keypad0 = 612,
    _Keypad1 = 613,
    _Keypad2 = 614,
    _Keypad3 = 615,
    _Keypad4 = 616,
    _Keypad5 = 617,
    _Keypad6 = 618,
    _Keypad7 = 619,
    _Keypad8 = 620,
    _Keypad9 = 621,
    _KeypadDecimal = 622,
    _KeypadDivide = 623,
    _KeypadMultiply = 624,
    _KeypadSubtract = 625,
    _KeypadAdd = 626,
    _KeypadEnter = 627,
    _KeypadEqual = 628,
    _AppBack = 629,
    _AppForward = 630,
    _GamepadStart = 631,
    _GamepadBack = 632,
    _GamepadFaceLeft = 633,
    _GamepadFaceRight = 634,
    _GamepadFaceUp = 635,
    _GamepadFaceDown = 636,
    _GamepadDpadLeft = 637,
    _GamepadDpadRight = 638,
    _GamepadDpadUp = 639,
    _GamepadDpadDown = 640,
    _GamepadL1 = 641,
    _GamepadR1 = 642,
    _GamepadL2 = 643,
    _GamepadR2 = 644,
    _GamepadL3 = 645,
    _GamepadR3 = 646,
    _GamepadLStickLeft = 647,
    _GamepadLStickRight = 648,
    _GamepadLStickUp = 649,
    _GamepadLStickDown = 650,
    _GamepadRStickLeft = 651,
    _GamepadRStickRight = 652,
    _GamepadRStickUp = 653,
    _GamepadRStickDown = 654,
    _MouseLeft = 655,
    _MouseRight = 656,
    _MouseMiddle = 657,
    _MouseX1 = 658,
    _MouseX2 = 659,
    _MouseWheelX = 660,
    _MouseWheelY = 661,
    _ReservedForModCtrl = 662,
    _ReservedForModShift = 663,
    _ReservedForModAlt = 664,
    _ReservedForModSuper = 665,
    _COUNT = 666,
    //ImGuiMod_None = 0,
    ImGuiMod_Ctrl = 4096,
    ImGuiMod_Shift = 8192,
    ImGuiMod_Alt = 16384,
    ImGuiMod_Super = 32768,
    ImGuiMod_Shortcut = 2048,
    ImGuiMod_Mask_ = 63488,
    // _NamedKey_BEGIN = 512,
    // _NamedKey_END = 666,
    // _NamedKey_COUNT = 154,
    _KeysData_SIZE = 154,
    // _KeysData_OFFSET = 512,
    // _KeysData_SIZE = 666,
    // _KeysData_OFFSET = 0,
    // _ModCtrl = 4096,
    // _ModShift = 8192,
    // _ModAlt = 16384,
    // _ModSuper = 32768,
    // _KeyPadEnter = 627,
};
pub const NavInput = enum(c_int) {
    _Activate = 0,
    _Cancel = 1,
    _Input = 2,
    _Menu = 3,
    _DpadLeft = 4,
    _DpadRight = 5,
    _DpadUp = 6,
    _DpadDown = 7,
    _LStickLeft = 8,
    _LStickRight = 9,
    _LStickUp = 10,
    _LStickDown = 11,
    _FocusPrev = 12,
    _FocusNext = 13,
    _TweakSlow = 14,
    _TweakFast = 15,
    _COUNT = 16,
};
pub const ConfigFlags = enum(c_int) {
    None = 0,
    NavEnableKeyboard = 1,
    NavEnableGamepad = 2,
    NavEnableSetMousePos = 4,
    NavNoCaptureKeyboard = 8,
    NoMouse = 16,
    NoMouseCursorChange = 32,
    IsSRGB = 1048576,
    IsTouchScreen = 2097152,
};
pub const BackendFlags = enum(c_int) {
    None = 0,
    HasGamepad = 1,
    HasMouseCursors = 2,
    HasSetMousePos = 4,
    RendererHasVtxOffset = 8,
};
pub const Col = enum(c_int) {
    Text = 0,
    TextDisabled = 1,
    WindowBg = 2,
    ChildBg = 3,
    PopupBg = 4,
    Border = 5,
    BorderShadow = 6,
    FrameBg = 7,
    FrameBgHovered = 8,
    FrameBgActive = 9,
    TitleBg = 10,
    TitleBgActive = 11,
    TitleBgCollapsed = 12,
    MenuBarBg = 13,
    ScrollbarBg = 14,
    ScrollbarGrab = 15,
    ScrollbarGrabHovered = 16,
    ScrollbarGrabActive = 17,
    CheckMark = 18,
    SliderGrab = 19,
    SliderGrabActive = 20,
    Button = 21,
    ButtonHovered = 22,
    ButtonActive = 23,
    Header = 24,
    HeaderHovered = 25,
    HeaderActive = 26,
    Separator = 27,
    SeparatorHovered = 28,
    SeparatorActive = 29,
    ResizeGrip = 30,
    ResizeGripHovered = 31,
    ResizeGripActive = 32,
    Tab = 33,
    TabHovered = 34,
    TabActive = 35,
    TabUnfocused = 36,
    TabUnfocusedActive = 37,
    PlotLines = 38,
    PlotLinesHovered = 39,
    PlotHistogram = 40,
    PlotHistogramHovered = 41,
    TableHeaderBg = 42,
    TableBorderStrong = 43,
    TableBorderLight = 44,
    TableRowBg = 45,
    TableRowBgAlt = 46,
    TextSelectedBg = 47,
    DragDropTarget = 48,
    NavHighlight = 49,
    NavWindowingHighlight = 50,
    NavWindowingDimBg = 51,
    ModalWindowDimBg = 52,
    COUNT = 53,
};
pub const StyleVar = enum(c_int) {
    Alpha = 0,
    DisabledAlpha = 1,
    WindowPadding = 2,
    WindowRounding = 3,
    WindowBorderSize = 4,
    WindowMinSize = 5,
    WindowTitleAlign = 6,
    ChildRounding = 7,
    ChildBorderSize = 8,
    PopupRounding = 9,
    PopupBorderSize = 10,
    FramePadding = 11,
    FrameRounding = 12,
    FrameBorderSize = 13,
    ItemSpacing = 14,
    ItemInnerSpacing = 15,
    IndentSpacing = 16,
    CellPadding = 17,
    ScrollbarSize = 18,
    ScrollbarRounding = 19,
    GrabMinSize = 20,
    GrabRounding = 21,
    TabRounding = 22,
    TabBarBorderSize = 23,
    ButtonTextAlign = 24,
    SelectableTextAlign = 25,
    SeparatorTextBorderSize = 26,
    SeparatorTextAlign = 27,
    SeparatorTextPadding = 28,
    COUNT = 29,
};
pub const ButtonFlags = enum(c_int) {
    None = 0,
    MouseButtonLeft = 1,
    MouseButtonRight = 2,
    MouseButtonMiddle = 4,
    MouseButtonMask_ = 7,
    MouseButtonDefault_ = 1,
};
pub const ColorEditFlags = enum(c_int) {
    None = 0,
    NoAlpha = 2,
    NoPicker = 4,
    NoOptions = 8,
    NoSmallPreview = 16,
    NoInputs = 32,
    NoTooltip = 64,
    NoLabel = 128,
    NoSidePreview = 256,
    NoDragDrop = 512,
    NoBorder = 1024,
    AlphaBar = 65536,
    AlphaPreview = 131072,
    AlphaPreviewHalf = 262144,
    HDR = 524288,
    DisplayRGB = 1048576,
    DisplayHSV = 2097152,
    DisplayHex = 4194304,
    Uint8 = 8388608,
    Float = 16777216,
    PickerHueBar = 33554432,
    PickerHueWheel = 67108864,
    InputRGB = 134217728,
    InputHSV = 268435456,
    DefaultOptions_ = 177209344,
    DisplayMask_ = 7340032,
    DataTypeMask_ = 25165824,
    PickerMask_ = 100663296,
    InputMask_ = 402653184,
};
pub const SliderFlags = enum(c_int) {
    None = 0,
    AlwaysClamp = 16,
    Logarithmic = 32,
    NoRoundToFormat = 64,
    NoInput = 128,
    InvalidMask_ = 1879048207,
};
pub const MouseButton = enum(c_int) {
    Left = 0,
    Right = 1,
    Middle = 2,
    COUNT = 5,
};
pub const MouseCursor = enum(c_int) {
    None = -1,
    Arrow = 0,
    TextInput = 1,
    ResizeAll = 2,
    ResizeNS = 3,
    ResizeEW = 4,
    ResizeNESW = 5,
    ResizeNWSE = 6,
    Hand = 7,
    NotAllowed = 8,
    COUNT = 9,
};
pub const MouseSource = enum(c_int) {
    _Mouse = 0,
    _TouchScreen = 1,
    _Pen = 2,
    _COUNT = 3,
};
pub const Cond = enum(c_int) {
    None = 0,
    Always = 1,
    Once = 2,
    FirstUseEver = 4,
    Appearing = 8,
};
pub const DrawFlags = enum(c_int) {
    None = 0,
    Closed = 1,
    RoundCornersTopLeft = 16,
    RoundCornersTopRight = 32,
    RoundCornersBottomLeft = 64,
    RoundCornersBottomRight = 128,
    RoundCornersNone = 256,
    RoundCornersTop = 48,
    RoundCornersBottom = 192,
    RoundCornersLeft = 80,
    RoundCornersRight = 160,
    RoundCornersAll = 240,
    RoundCornersDefault_ = 240,
    RoundCornersMask_ = 496,
};
pub const DrawListFlags = enum(c_int) {
    None = 0,
    AntiAliasedLines = 1,
    AntiAliasedLinesUseTex = 2,
    AntiAliasedFill = 4,
    AllowVtxOffset = 8,
};
pub const FontAtlasFlags = enum(c_int) {
    None = 0,
    NoPowerOfTwoHeight = 1,
    NoMouseCursors = 2,
    NoBakedLines = 4,
};
pub const ViewportFlags = enum(c_int) {
    None = 0,
    IsPlatformWindow = 1,
    IsPlatformMonitor = 2,
    OwnedByApp = 4,
};
pub const ModFlags = enum(c_int) {
    None = 0,
    Ctrl = 4096,
    Shift = 8192,
    Alt = 16384,
    Super = 32768,
};
pub const KeyChord = c_int;
pub const TextureID = ?*anyopaque;
pub const DrawIdx = c_ushort;
pub const ID = c_uint;
pub const S8 = c_char;
pub const U8 = c_char;
pub const S16 = c_short;
pub const U16 = c_ushort;
pub const S32 = c_int;
pub const U32 = c_uint;
pub const S64 = c_longlong;
pub const U64 = c_ulonglong;
pub const Wchar32 = c_uint;
pub const Wchar16 = c_ushort;
pub const InputTextCallback = ?*const fn (?*InputTextCallbackData) callconv(.C) c_int;
pub const SizeCallback = ?*const fn (?*SizeCallbackData) callconv(.C) void;
pub const MemAllocFunc = ?*const fn (usize, ?*anyopaque) callconv(.C) ?*anyopaque;
pub const MemFreeFunc = ?*const fn (?*anyopaque, ?*anyopaque) callconv(.C) void;
pub const DrawCallback = ?*const fn (?*const DrawList, ?*const DrawCmd) callconv(.C) void;
pub const Wchar = Wchar16;
pub const DrawListSharedData = extern struct {};
pub const FontBuilderIO = extern struct {};
pub const Context = extern struct {};
pub const Vec2 = extern struct {
    x: f32,
    y: f32,
};
pub const Vec4 = extern struct {
    x: f32,
    y: f32,
    z: f32,
    w: f32,
};
pub const Vector_ImWchar = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*]Wchar,
};
pub const Vector_ImGuiTextFilter_ImGuiTextRange = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*]TextFilter_ImGuiTextRange,
};
pub const Vector_char = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*]u8,
};
pub const Vector_ImGuiStorage_ImGuiStoragePair = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*]Storage_ImGuiStoragePair,
};
pub const Vector_ImDrawCmd = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*]DrawCmd,
};
pub const Vector_ImDrawIdx = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*]DrawIdx,
};
pub const Vector_ImDrawChannel = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*]DrawChannel,
};
pub const Vector_ImDrawVert = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*]DrawVert,
};
pub const Vector_ImVec4 = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*]Vec4,
};
pub const Vector_ImTextureID = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*]TextureID,
};
pub const Vector_ImVec2 = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*]Vec2,
};
pub const Vector_ImDrawListPtr = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*]*DrawList,
};
pub const Vector_ImU32 = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*]*U32,
};
pub const Vector_ImFontPtr = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*]*Font,
};
pub const Vector_ImFontAtlasCustomRect = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*]*FontAtlasCustomRect,
};
pub const Vector_ImFontConfig = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*]*FontConfig,
};
pub const Vector_float = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*]*f32,
};
pub const Vector_ImFontGlyph = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*]*FontGlyph,
};
pub const Style = extern struct {
    Alpha: f32,
    DisabledAlpha: f32,
    WindowPadding: Vec2,
    WindowRounding: f32,
    WindowBorderSize: f32,
    WindowMinSize: Vec2,
    WindowTitleAlign: Vec2,
    WindowMenuButtonPosition: Dir,
    ChildRounding: f32,
    ChildBorderSize: f32,
    PopupRounding: f32,
    PopupBorderSize: f32,
    FramePadding: Vec2,
    FrameRounding: f32,
    FrameBorderSize: f32,
    ItemSpacing: Vec2,
    ItemInnerSpacing: Vec2,
    CellPadding: Vec2,
    TouchExtraPadding: Vec2,
    IndentSpacing: f32,
    ColumnsMinSpacing: f32,
    ScrollbarSize: f32,
    ScrollbarRounding: f32,
    GrabMinSize: f32,
    GrabRounding: f32,
    LogSliderDeadzone: f32,
    TabRounding: f32,
    TabBorderSize: f32,
    TabMinWidthForCloseButton: f32,
    TabBarBorderSize: f32,
    TableAngledHeadersAngle: f32,
    ColorButtonPosition: Dir,
    ButtonTextAlign: Vec2,
    SelectableTextAlign: Vec2,
    SeparatorTextBorderSize: f32,
    SeparatorTextAlign: Vec2,
    SeparatorTextPadding: Vec2,
    DisplayWindowPadding: Vec2,
    DisplaySafeAreaPadding: Vec2,
    MouseCursorScale: f32,
    AntiAliasedLines: bool,
    AntiAliasedLinesUseTex: bool,
    AntiAliasedFill: bool,
    CurveTessellationTol: f32,
    CircleTessellationMaxError: f32,
    Colors: [Col.COUNT]Vec4,
    HoverStationaryDelay: f32,
    HoverDelayShort: f32,
    HoverDelayNormal: f32,
    HoverFlagsForTooltipMouse: HoveredFlags,
    HoverFlagsForTooltipNav: HoveredFlags,
};
pub const KeyData = extern struct {
    Down: bool,
    DownDuration: f32,
    DownDurationPrev: f32,
    AnalogValue: f32,
};
pub const IO = extern struct {
    ConfigFlags: ConfigFlags,
    BackendFlags: BackendFlags,
    DisplaySize: Vec2,
    DeltaTime: f32,
    IniSavingRate: f32,
    IniFilename: ?[*:0]const u8,
    LogFilename: ?[*:0]const u8,
    UserData: ?*anyopaque,
    Fonts: ?*FontAtlas,
    FontGlobalScale: f32,
    FontAllowUserScaling: bool,
    FontDefault: ?*Font,
    DisplayFramebufferScale: Vec2,
    MouseDrawCursor: bool,
    ConfigMacOSXBehaviors: bool,
    ConfigInputTrickleEventQueue: bool,
    ConfigInputTextCursorBlink: bool,
    ConfigInputTextEnterKeepActive: bool,
    ConfigDragClickToInputText: bool,
    ConfigWindowsResizeFromEdges: bool,
    ConfigWindowsMoveFromTitleBarOnly: bool,
    ConfigMemoryCompactTimer: f32,
    MouseDoubleClickTime: f32,
    MouseDoubleClickMaxDist: f32,
    MouseDragThreshold: f32,
    KeyRepeatDelay: f32,
    KeyRepeatRate: f32,
    ConfigDebugBeginReturnValueOnce: bool,
    ConfigDebugBeginReturnValueLoop: bool,
    ConfigDebugIgnoreFocusLoss: bool,
    ConfigDebugIniSettings: bool,
    BackendPlatformName: ?[*:0]const u8,
    BackendRendererName: ?[*:0]const u8,
    BackendPlatformUserData: ?*anyopaque,
    BackendRendererUserData: ?*anyopaque,
    BackendLanguageUserData: ?*anyopaque,
    GetClipboardTextFn: ?*const fn (?*anyopaque) callconv(.C) ?[*:0]const u8,
    SetClipboardTextFn: ?*const fn (?*anyopaque, ?[*:0]const u8) callconv(.C) void,
    ClipboardUserData: ?*anyopaque,
    SetPlatformImeDataFn: ?*const fn (?*Viewport, ?*PlatformImeData) callconv(.C) void,
    PlatformLocaleDecimalPoint: Wchar,
    WantCaptureMouse: bool,
    WantCaptureKeyboard: bool,
    WantTextInput: bool,
    WantSetMousePos: bool,
    WantSaveIniSettings: bool,
    NavActive: bool,
    NavVisible: bool,
    Framerate: f32,
    MetricsRenderVertices: c_int,
    MetricsRenderIndices: c_int,
    MetricsRenderWindows: c_int,
    MetricsActiveWindows: c_int,
    MouseDelta: Vec2,
    KeyMap: [@intFromEnum(Key._COUNT)]c_int,
    KeysDown: [@intFromEnum(Key._COUNT)]bool,
    NavInputs: [@intFromEnum(NavInput._COUNT)]f32,
    ImeWindowHandle: ?*anyopaque,
    Ctx: ?*Context,
    MousePos: Vec2,
    MouseDown: [5]bool,
    MouseWheel: f32,
    MouseWheelH: f32,
    MouseSource: MouseSource,
    KeyCtrl: bool,
    KeyShift: bool,
    KeyAlt: bool,
    KeySuper: bool,
    KeyMods: KeyChord,
    KeysData: [@intFromEnum(Key._KeysData_SIZE)]KeyData,
    WantCaptureMouseUnlessPopupClose: bool,
    MousePosPrev: Vec2,
    MouseClickedPos: [5]Vec2,
    MouseClickedTime: [5]f64,
    MouseClicked: [5]bool,
    MouseDoubleClicked: [5]bool,
    MouseClickedCount: [5]U16,
    MouseClickedLastCount: [5]U16,
    MouseReleased: [5]bool,
    MouseDownOwned: [5]bool,
    MouseDownOwnedUnlessPopupClose: [5]bool,
    MouseWheelRequestAxisSwap: bool,
    MouseDownDuration: [5]f32,
    MouseDownDurationPrev: [5]f32,
    MouseDragMaxDistanceSqr: [5]f32,
    PenPressure: f32,
    AppFocusLost: bool,
    AppAcceptingEvents: bool,
    BackendUsingLegacyKeyArrays: S8,
    BackendUsingLegacyNavInputArray: bool,
    InputQueueSurrogate: Wchar16,
    InputQueueCharacters: Vector_ImWchar,
};
pub const InputTextCallbackData = extern struct {
    Ctx: ?*Context,
    EventFlag: InputTextFlags,
    Flags: InputTextFlags,
    UserData: ?*anyopaque,
    EventChar: Wchar,
    EventKey: Key,
    Buf: ?[*:0]const u8,
    BufTextLen: c_int,
    BufSize: c_int,
    BufDirty: bool,
    CursorPos: c_int,
    SelectionStart: c_int,
    SelectionEnd: c_int,
};
pub const SizeCallbackData = extern struct {
    UserData: ?*anyopaque,
    Pos: Vec2,
    CurrentSize: Vec2,
    DesiredSize: Vec2,
};
pub const Payload = extern struct {
    Data: ?*anyopaque,
    DataSize: c_int,
    SourceId: ID,
    SourceParentId: ID,
    DataFrameCount: c_int,
    DataType: [32 + 1]c_char,
    Preview: bool,
    Delivery: bool,
};
pub const TableColumnSortSpecs = extern struct {
    ColumnUserID: ID,
    ColumnIndex: S16,
    SortOrder: S16,
    SortDirection: SortDirection,
};
pub const TableSortSpecs = extern struct {
    Specs: ?*const TableColumnSortSpecs,
    SpecsCount: c_int,
    SpecsDirty: bool,
};
pub const TextFilter_ImGuiTextRange = extern struct {
    b: ?[*:0]const u8,
    e: ?[*:0]const u8,
};
pub const TextFilter = extern struct {
    InputBuf: [256]c_char,
    Filters: Vector_ImGuiTextFilter_ImGuiTextRange,
    CountGrep: c_int,
};
pub const TextBuffer = extern struct {
    Buf: Vector_char,
};
pub const Storage_ImGuiStoragePair = extern struct {
    key: ID,
    __anonymous_type0: __anonymous_type0,
};
pub const __anonymous_type0 = extern struct {
    val_i: c_int,
    val_f: f32,
    val_p: ?*anyopaque,
};
pub const Storage = extern struct {
    Data: Vector_ImGuiStorage_ImGuiStoragePair,
};
pub const ListClipper = extern struct {
    Ctx: ?*Context,
    DisplayStart: c_int,
    DisplayEnd: c_int,
    ItemsCount: c_int,
    ItemsHeight: f32,
    StartPosY: f32,
    TempData: ?*anyopaque,
};
pub const Color = extern struct {
    Value: Vec4,
};
pub const DrawCmd = extern struct {
    ClipRect: Vec4,
    TextureId: TextureID,
    VtxOffset: c_uint,
    IdxOffset: c_uint,
    ElemCount: c_uint,
    UserCallback: DrawCallback,
    UserCallbackData: ?*anyopaque,
};
pub const DrawVert = extern struct {
    pos: Vec2,
    uv: Vec2,
    col: U32,
};
pub const DrawCmdHeader = extern struct {
    ClipRect: Vec4,
    TextureId: TextureID,
    VtxOffset: c_uint,
};
pub const DrawChannel = extern struct {
    _CmdBuffer: Vector_ImDrawCmd,
    _IdxBuffer: Vector_ImDrawIdx,
};
pub const DrawListSplitter = extern struct {
    _Current: c_int,
    _Count: c_int,
    _Channels: Vector_ImDrawChannel,
};
pub const DrawList = extern struct {
    CmdBuffer: Vector_ImDrawCmd,
    IdxBuffer: Vector_ImDrawIdx,
    VtxBuffer: Vector_ImDrawVert,
    Flags: DrawListFlags,
    _VtxCurrentIdx: c_uint,
    _Data: ?*DrawListSharedData,
    _OwnerName: ?[*:0]const u8,
    _VtxWritePtr: ?*DrawVert,
    _IdxWritePtr: ?*DrawIdx,
    _ClipRectStack: Vector_ImVec4,
    _TextureIdStack: Vector_ImTextureID,
    _Path: Vector_ImVec2,
    _CmdHeader: DrawCmdHeader,
    _Splitter: DrawListSplitter,
    _FringeScale: f32,
};
pub const DrawData = extern struct {
    Valid: bool,
    CmdListsCount: c_int,
    TotalIdxCount: c_int,
    TotalVtxCount: c_int,
    CmdLists: Vector_ImDrawListPtr,
    DisplayPos: Vec2,
    DisplaySize: Vec2,
    FramebufferScale: Vec2,
    OwnerViewport: ?*Viewport,
};
pub const FontConfig = extern struct {
    FontData: ?*anyopaque,
    FontDataSize: c_int,
    FontDataOwnedByAtlas: bool,
    FontNo: c_int,
    SizePixels: f32,
    OversampleH: c_int,
    OversampleV: c_int,
    PixelSnapH: bool,
    GlyphExtraSpacing: Vec2,
    GlyphOffset: Vec2,
    GlyphRanges: ?*const Wchar,
    GlyphMinAdvanceX: f32,
    GlyphMaxAdvanceX: f32,
    MergeMode: bool,
    FontBuilderFlags: c_uint,
    RasterizerMultiply: f32,
    EllipsisChar: Wchar,
    Name: [40]c_char,
    DstFont: ?*Font,
};
pub const FontGlyph = extern struct {
    Colored: c_uint,
    Visible: c_uint,
    Codepoint: c_uint,
    AdvanceX: f32,
    X0: f32,
    Y0: f32,
    X1: f32,
    Y1: f32,
    U0: f32,
    V0: f32,
    U1: f32,
    V1: f32,
};
pub const FontGlyphRangesBuilder = extern struct {
    UsedChars: Vector_ImU32,
};
pub const FontAtlasCustomRect = extern struct {
    Width: c_ushort,
    Height: c_ushort,
    X: c_ushort,
    Y: c_ushort,
    GlyphID: c_uint,
    GlyphAdvanceX: f32,
    GlyphOffset: Vec2,
    Font: ?*Font,
};
pub const FontAtlas = extern struct {
    Flags: FontAtlasFlags,
    TexID: TextureID,
    TexDesiredWidth: c_int,
    TexGlyphPadding: c_int,
    Locked: bool,
    UserData: ?*anyopaque,
    TexReady: bool,
    TexPixelsUseColors: bool,
    TexPixelsAlpha8: ?*c_char,
    TexPixelsRGBA32: ?*c_uint,
    TexWidth: c_int,
    TexHeight: c_int,
    TexUvScale: Vec2,
    TexUvWhitePixel: Vec2,
    Fonts: Vector_ImFontPtr,
    CustomRects: Vector_ImFontAtlasCustomRect,
    ConfigData: Vector_ImFontConfig,
    TexUvLines: [IM_DRAWLIST_TEX_LINES_WIDTH_MAX + 1]Vec4,
    FontBuilderIO: ?*const FontBuilderIO,
    FontBuilderFlags: c_uint,
    PackIdMouseCursors: c_int,
    PackIdLines: c_int,
};
pub const Font = extern struct {
    IndexAdvanceX: Vector_float,
    FallbackAdvanceX: f32,
    FontSize: f32,
    IndexLookup: Vector_ImWchar,
    Glyphs: Vector_ImFontGlyph,
    FallbackGlyph: ?*const FontGlyph,
    ContainerAtlas: ?*FontAtlas,
    ConfigData: ?*const FontConfig,
    ConfigDataCount: c_short,
    FallbackChar: Wchar,
    EllipsisChar: Wchar,
    EllipsisCharCount: c_short,
    EllipsisWidth: f32,
    EllipsisCharStep: f32,
    DirtyLookupTables: bool,
    Scale: f32,
    Ascent: f32,
    Descent: f32,
    MetricsTotalSurface: c_int,
    Used4kPagesMap: [(IM_UNICODE_CODEPOINT_MAX + 1) / 4096 / 8]U8,
};
pub const Viewport = extern struct {
    Flags: ViewportFlags,
    Pos: Vec2,
    Size: Vec2,
    WorkPos: Vec2,
    WorkSize: Vec2,
    PlatformHandleRaw: ?*anyopaque,
};
pub const PlatformImeData = extern struct {
    WantVisible: bool,
    InputPos: Vec2,
    InputLineHeight: f32,
};
extern fn ImGui_CreateContext(shared_font_atlas: ?*FontAtlas) ?*Context;
extern fn ImGui_DestroyContext(ctx: ?*Context) void;
extern fn ImGui_GetCurrentContext() ?*Context;
extern fn ImGui_SetCurrentContext(ctx: ?*Context) void;
extern fn ImGui_GetIO() *IO;
extern fn ImGui_GetStyle() *Style;
extern fn ImGui_NewFrame() void;
extern fn ImGui_EndFrame() void;
extern fn ImGui_Render() void;
extern fn ImGui_GetDrawData() ?*DrawData;
extern fn ImGui_ShowDemoWindow(p_open: ?*bool) void;
extern fn ImGui_ShowMetricsWindow(p_open: ?*bool) void;
extern fn ImGui_ShowDebugLogWindow(p_open: ?*bool) void;
extern fn ImGui_ShowIDStackToolWindow() void;
extern fn ImGui_ShowIDStackToolWindowEx(p_open: ?*bool) void;
extern fn ImGui_ShowAboutWindow(p_open: ?*bool) void;
extern fn ImGui_ShowStyleEditor(ref: ?*Style) void;
extern fn ImGui_ShowStyleSelector(label: ?[*:0]const u8) bool;
extern fn ImGui_ShowFontSelector(label: ?[*:0]const u8) void;
extern fn ImGui_ShowUserGuide() void;
extern fn ImGui_GetVersion() ?[*:0]const u8;
extern fn ImGui_StyleColorsDark(dst: ?*Style) void;
extern fn ImGui_StyleColorsLight(dst: ?*Style) void;
extern fn ImGui_StyleColorsClassic(dst: ?*Style) void;
extern fn ImGui_Begin(name: ?[*:0]const u8, p_open: ?*bool, flags: WindowFlags) bool;
extern fn ImGui_End() void;
extern fn ImGui_BeginChild(str_id: ?[*:0]const u8, size: Vec2, border: bool, flags: WindowFlags) bool;
extern fn ImGui_BeginChildID(id: ID, size: Vec2, border: bool, flags: WindowFlags) bool;
extern fn ImGui_EndChild() void;
extern fn ImGui_IsWindowAppearing() bool;
extern fn ImGui_IsWindowCollapsed() bool;
extern fn ImGui_IsWindowFocused(flags: FocusedFlags) bool;
extern fn ImGui_IsWindowHovered(flags: HoveredFlags) bool;
extern fn ImGui_GetWindowDrawList() ?*DrawList;
extern fn ImGui_GetWindowPos() Vec2;
extern fn ImGui_GetWindowSize() Vec2;
extern fn ImGui_GetWindowWidth() f32;
extern fn ImGui_GetWindowHeight() f32;
extern fn ImGui_SetNextWindowPos(pos: Vec2, cond: Cond) void;
extern fn ImGui_SetNextWindowPosEx(pos: Vec2, cond: Cond, pivot: Vec2) void;
extern fn ImGui_SetNextWindowSize(size: Vec2, cond: Cond) void;
extern fn ImGui_SetNextWindowSizeConstraints(size_min: Vec2, size_max: Vec2, custom_callback: SizeCallback, custom_callback_data: ?*anyopaque) void;
extern fn ImGui_SetNextWindowContentSize(size: Vec2) void;
extern fn ImGui_SetNextWindowCollapsed(collapsed: bool, cond: Cond) void;
extern fn ImGui_SetNextWindowFocus() void;
extern fn ImGui_SetNextWindowScroll(scroll: Vec2) void;
extern fn ImGui_SetNextWindowBgAlpha(alpha: f32) void;
extern fn ImGui_SetWindowPos(pos: Vec2, cond: Cond) void;
extern fn ImGui_SetWindowSize(size: Vec2, cond: Cond) void;
extern fn ImGui_SetWindowCollapsed(collapsed: bool, cond: Cond) void;
extern fn ImGui_SetWindowFocus() void;
extern fn ImGui_SetWindowFontScale(scale: f32) void;
extern fn ImGui_SetWindowPosStr(name: ?[*:0]const u8, pos: Vec2, cond: Cond) void;
extern fn ImGui_SetWindowSizeStr(name: ?[*:0]const u8, size: Vec2, cond: Cond) void;
extern fn ImGui_SetWindowCollapsedStr(name: ?[*:0]const u8, collapsed: bool, cond: Cond) void;
extern fn ImGui_SetWindowFocusStr(name: ?[*:0]const u8) void;
extern fn ImGui_GetContentRegionAvail() Vec2;
extern fn ImGui_GetContentRegionMax() Vec2;
extern fn ImGui_GetWindowContentRegionMin() Vec2;
extern fn ImGui_GetWindowContentRegionMax() Vec2;
extern fn ImGui_GetScrollX() f32;
extern fn ImGui_GetScrollY() f32;
extern fn ImGui_SetScrollX(scroll_x: f32) void;
extern fn ImGui_SetScrollY(scroll_y: f32) void;
extern fn ImGui_GetScrollMaxX() f32;
extern fn ImGui_GetScrollMaxY() f32;
extern fn ImGui_SetScrollHereX(center_x_ratio: f32) void;
extern fn ImGui_SetScrollHereY(center_y_ratio: f32) void;
extern fn ImGui_SetScrollFromPosX(local_x: f32, center_x_ratio: f32) void;
extern fn ImGui_SetScrollFromPosY(local_y: f32, center_y_ratio: f32) void;
extern fn ImGui_PushFont(font: ?*Font) void;
extern fn ImGui_PopFont() void;
extern fn ImGui_PushStyleColor(idx: Col, col: U32) void;
extern fn ImGui_PushStyleColorImVec4(idx: Col, col: Vec4) void;
extern fn ImGui_PopStyleColor() void;
extern fn ImGui_PopStyleColorEx(count: c_int) void;
extern fn ImGui_PushStyleVar(idx: StyleVar, val: f32) void;
extern fn ImGui_PushStyleVarImVec2(idx: StyleVar, val: Vec2) void;
extern fn ImGui_PopStyleVar() void;
extern fn ImGui_PopStyleVarEx(count: c_int) void;
extern fn ImGui_PushTabStop(tab_stop: bool) void;
extern fn ImGui_PopTabStop() void;
extern fn ImGui_PushButtonRepeat(repeat: bool) void;
extern fn ImGui_PopButtonRepeat() void;
extern fn ImGui_PushItemWidth(item_width: f32) void;
extern fn ImGui_PopItemWidth() void;
extern fn ImGui_SetNextItemWidth(item_width: f32) void;
extern fn ImGui_CalcItemWidth() f32;
extern fn ImGui_PushTextWrapPos(wrap_local_pos_x: f32) void;
extern fn ImGui_PopTextWrapPos() void;
extern fn ImGui_GetFont() ?*Font;
extern fn ImGui_GetFontSize() f32;
extern fn ImGui_GetFontTexUvWhitePixel() Vec2;
extern fn ImGui_GetColorU32(idx: Col) U32;
extern fn ImGui_GetColorU32Ex(idx: Col, alpha_mul: f32) U32;
extern fn ImGui_GetColorU32ImVec4(col: Vec4) U32;
extern fn ImGui_GetColorU32ImU32(col: U32) U32;
extern fn ImGui_GetStyleColorVec4(idx: Col) *const Vec4;
extern fn ImGui_GetCursorScreenPos() Vec2;
extern fn ImGui_SetCursorScreenPos(pos: Vec2) void;
extern fn ImGui_GetCursorPos() Vec2;
extern fn ImGui_GetCursorPosX() f32;
extern fn ImGui_GetCursorPosY() f32;
extern fn ImGui_SetCursorPos(local_pos: Vec2) void;
extern fn ImGui_SetCursorPosX(local_x: f32) void;
extern fn ImGui_SetCursorPosY(local_y: f32) void;
extern fn ImGui_GetCursorStartPos() Vec2;
extern fn ImGui_Separator() void;
extern fn ImGui_SameLine() void;
extern fn ImGui_SameLineEx(offset_from_start_x: f32, spacing: f32) void;
extern fn ImGui_NewLine() void;
extern fn ImGui_Spacing() void;
extern fn ImGui_Dummy(size: Vec2) void;
extern fn ImGui_Indent() void;
extern fn ImGui_IndentEx(indent_w: f32) void;
extern fn ImGui_Unindent() void;
extern fn ImGui_UnindentEx(indent_w: f32) void;
extern fn ImGui_BeginGroup() void;
extern fn ImGui_EndGroup() void;
extern fn ImGui_AlignTextToFramePadding() void;
extern fn ImGui_GetTextLineHeight() f32;
extern fn ImGui_GetTextLineHeightWithSpacing() f32;
extern fn ImGui_GetFrameHeight() f32;
extern fn ImGui_GetFrameHeightWithSpacing() f32;
extern fn ImGui_PushID(str_id: ?[*:0]const u8) void;
extern fn ImGui_PushIDStr(str_id_begin: ?[*:0]const u8, str_id_end: ?[*:0]const u8) void;
extern fn ImGui_PushIDPtr(ptr_id: ?*anyopaque) void;
extern fn ImGui_PushIDInt(int_id: c_int) void;
extern fn ImGui_PopID() void;
extern fn ImGui_GetID(str_id: ?[*:0]const u8) ID;
extern fn ImGui_GetIDStr(str_id_begin: ?[*:0]const u8, str_id_end: ?[*:0]const u8) ID;
extern fn ImGui_GetIDPtr(ptr_id: ?*anyopaque) ID;
extern fn ImGui_TextUnformatted(text: ?[*:0]const u8) void;
extern fn ImGui_TextUnformattedEx(text: ?[*:0]const u8, text_end: ?[*:0]const u8) void;
extern fn ImGui_Text(fmt: ?[*:0]const u8, ...) void;
extern fn ImGui_TextV(fmt: ?[*:0]const u8, args: c.va_list) void;
extern fn ImGui_TextColored(col: Vec4, fmt: ?[*:0]const u8, ...) void;
extern fn ImGui_TextColoredUnformatted(col: Vec4, text: ?[*:0]const u8) void;
extern fn ImGui_TextColoredV(col: Vec4, fmt: ?[*:0]const u8, args: c.va_list) void;
extern fn ImGui_TextDisabled(fmt: ?[*:0]const u8, ...) void;
extern fn ImGui_TextDisabledUnformatted(text: ?[*:0]const u8) void;
extern fn ImGui_TextDisabledV(fmt: ?[*:0]const u8, args: c.va_list) void;
extern fn ImGui_TextWrapped(fmt: ?[*:0]const u8, ...) void;
extern fn ImGui_TextWrappedUnformatted(text: ?[*:0]const u8) void;
extern fn ImGui_TextWrappedV(fmt: ?[*:0]const u8, args: c.va_list) void;
extern fn ImGui_LabelText(label: ?[*:0]const u8, fmt: ?[*:0]const u8, ...) void;
extern fn ImGui_LabelTextUnformatted(label: ?[*:0]const u8, text: ?[*:0]const u8) void;
extern fn ImGui_LabelTextV(label: ?[*:0]const u8, fmt: ?[*:0]const u8, args: c.va_list) void;
extern fn ImGui_BulletText(fmt: ?[*:0]const u8, ...) void;
extern fn ImGui_BulletTextUnformatted(text: ?[*:0]const u8) void;
extern fn ImGui_BulletTextV(fmt: ?[*:0]const u8, args: c.va_list) void;
extern fn ImGui_SeparatorText(label: ?[*:0]const u8) void;
extern fn ImGui_Button(label: ?[*:0]const u8) bool;
extern fn ImGui_ButtonEx(label: ?[*:0]const u8, size: Vec2) bool;
extern fn ImGui_SmallButton(label: ?[*:0]const u8) bool;
extern fn ImGui_InvisibleButton(str_id: ?[*:0]const u8, size: Vec2, flags: ButtonFlags) bool;
extern fn ImGui_ArrowButton(str_id: ?[*:0]const u8, dir: Dir) bool;
extern fn ImGui_Checkbox(label: ?[*:0]const u8, v: ?*bool) bool;
extern fn ImGui_CheckboxFlagsIntPtr(label: ?[*:0]const u8, flags: ?*c_int, flags_value: c_int) bool;
extern fn ImGui_CheckboxFlagsUintPtr(label: ?[*:0]const u8, flags: ?*c_uint, flags_value: c_uint) bool;
extern fn ImGui_RadioButton(label: ?[*:0]const u8, active: bool) bool;
extern fn ImGui_RadioButtonIntPtr(label: ?[*:0]const u8, v: ?*c_int, v_button: c_int) bool;
extern fn ImGui_ProgressBar(fraction: f32, size_arg: Vec2, overlay: ?[*:0]const u8) void;
extern fn ImGui_Bullet() void;
extern fn ImGui_Image(user_texture_id: TextureID, size: Vec2) void;
extern fn ImGui_ImageEx(user_texture_id: TextureID, size: Vec2, uv0: Vec2, uv1: Vec2, tint_col: Vec4, border_col: Vec4) void;
extern fn ImGui_ImageButton(str_id: ?[*:0]const u8, user_texture_id: TextureID, image_size: Vec2) bool;
extern fn ImGui_ImageButtonEx(str_id: ?[*:0]const u8, user_texture_id: TextureID, image_size: Vec2, uv0: Vec2, uv1: Vec2, bg_col: Vec4, tint_col: Vec4) bool;
extern fn ImGui_BeginCombo(label: ?[*:0]const u8, preview_value: ?[*:0]const u8, flags: ComboFlags) bool;
extern fn ImGui_EndCombo() void;
extern fn ImGui_ComboChar(label: ?[*:0]const u8, current_item: ?*c_int, items: [*]const ?[*:0]const u8, items_count: c_int) bool;
extern fn ImGui_ComboCharEx(label: ?[*:0]const u8, current_item: ?*c_int, items: [*]const ?[*:0]const u8, items_count: c_int, popup_max_height_in_items: c_int) bool;
extern fn ImGui_Combo(label: ?[*:0]const u8, current_item: ?*c_int, items_separated_by_zeros: ?[*:0]const u8) bool;
extern fn ImGui_ComboEx(label: ?[*:0]const u8, current_item: ?*c_int, items_separated_by_zeros: ?[*:0]const u8, popup_max_height_in_items: c_int) bool;
extern fn ImGui_ComboCallback(label: ?[*:0]const u8, current_item: ?*c_int, getter: ?*const fn (?*anyopaque, c_int) callconv(.C) ?[*:0]const u8, user_data: ?*anyopaque, items_count: c_int) bool;
extern fn ImGui_ComboCallbackEx(label: ?[*:0]const u8, current_item: ?*c_int, getter: ?*const fn (?*anyopaque, c_int) callconv(.C) ?[*:0]const u8, user_data: ?*anyopaque, items_count: c_int, popup_max_height_in_items: c_int) bool;
extern fn ImGui_DragFloat(label: ?[*:0]const u8, v: ?*f32) bool;
extern fn ImGui_DragFloatEx(label: ?[*:0]const u8, v: ?*f32, v_speed: f32, v_min: f32, v_max: f32, format: ?[*:0]const u8, flags: SliderFlags) bool;
extern fn ImGui_DragFloat2(label: ?[*:0]const u8, v: [2]f32) bool;
extern fn ImGui_DragFloat2Ex(label: ?[*:0]const u8, v: [2]f32, v_speed: f32, v_min: f32, v_max: f32, format: ?[*:0]const u8, flags: SliderFlags) bool;
extern fn ImGui_DragFloat3(label: ?[*:0]const u8, v: [3]f32) bool;
extern fn ImGui_DragFloat3Ex(label: ?[*:0]const u8, v: [3]f32, v_speed: f32, v_min: f32, v_max: f32, format: ?[*:0]const u8, flags: SliderFlags) bool;
extern fn ImGui_DragFloat4(label: ?[*:0]const u8, v: [4]f32) bool;
extern fn ImGui_DragFloat4Ex(label: ?[*:0]const u8, v: [4]f32, v_speed: f32, v_min: f32, v_max: f32, format: ?[*:0]const u8, flags: SliderFlags) bool;
extern fn ImGui_DragFloatRange2(label: ?[*:0]const u8, v_current_min: ?*f32, v_current_max: ?*f32) bool;
extern fn ImGui_DragFloatRange2Ex(label: ?[*:0]const u8, v_current_min: ?*f32, v_current_max: ?*f32, v_speed: f32, v_min: f32, v_max: f32, format: ?[*:0]const u8, format_max: ?[*:0]const u8, flags: SliderFlags) bool;
extern fn ImGui_DragInt(label: ?[*:0]const u8, v: ?*c_int) bool;
extern fn ImGui_DragIntEx(label: ?[*:0]const u8, v: ?*c_int, v_speed: f32, v_min: c_int, v_max: c_int, format: ?[*:0]const u8, flags: SliderFlags) bool;
extern fn ImGui_DragInt2(label: ?[*:0]const u8, v: [2]c_int) bool;
extern fn ImGui_DragInt2Ex(label: ?[*:0]const u8, v: [2]c_int, v_speed: f32, v_min: c_int, v_max: c_int, format: ?[*:0]const u8, flags: SliderFlags) bool;
extern fn ImGui_DragInt3(label: ?[*:0]const u8, v: [3]c_int) bool;
extern fn ImGui_DragInt3Ex(label: ?[*:0]const u8, v: [3]c_int, v_speed: f32, v_min: c_int, v_max: c_int, format: ?[*:0]const u8, flags: SliderFlags) bool;
extern fn ImGui_DragInt4(label: ?[*:0]const u8, v: [4]c_int) bool;
extern fn ImGui_DragInt4Ex(label: ?[*:0]const u8, v: [4]c_int, v_speed: f32, v_min: c_int, v_max: c_int, format: ?[*:0]const u8, flags: SliderFlags) bool;
extern fn ImGui_DragIntRange2(label: ?[*:0]const u8, v_current_min: ?*c_int, v_current_max: ?*c_int) bool;
extern fn ImGui_DragIntRange2Ex(label: ?[*:0]const u8, v_current_min: ?*c_int, v_current_max: ?*c_int, v_speed: f32, v_min: c_int, v_max: c_int, format: ?[*:0]const u8, format_max: ?[*:0]const u8, flags: SliderFlags) bool;
extern fn ImGui_DragScalar(label: ?[*:0]const u8, data_type: DataType, p_data: ?*anyopaque) bool;
extern fn ImGui_DragScalarEx(label: ?[*:0]const u8, data_type: DataType, p_data: ?*anyopaque, v_speed: f32, p_min: ?*anyopaque, p_max: ?*anyopaque, format: ?[*:0]const u8, flags: SliderFlags) bool;
extern fn ImGui_DragScalarN(label: ?[*:0]const u8, data_type: DataType, p_data: ?*anyopaque, components: c_int) bool;
extern fn ImGui_DragScalarNEx(label: ?[*:0]const u8, data_type: DataType, p_data: ?*anyopaque, components: c_int, v_speed: f32, p_min: ?*anyopaque, p_max: ?*anyopaque, format: ?[*:0]const u8, flags: SliderFlags) bool;
extern fn ImGui_SliderFloat(label: ?[*:0]const u8, v: ?*f32, v_min: f32, v_max: f32) bool;
extern fn ImGui_SliderFloatEx(label: ?[*:0]const u8, v: ?*f32, v_min: f32, v_max: f32, format: ?[*:0]const u8, flags: SliderFlags) bool;
extern fn ImGui_SliderFloat2(label: ?[*:0]const u8, v: [2]f32, v_min: f32, v_max: f32) bool;
extern fn ImGui_SliderFloat2Ex(label: ?[*:0]const u8, v: [2]f32, v_min: f32, v_max: f32, format: ?[*:0]const u8, flags: SliderFlags) bool;
extern fn ImGui_SliderFloat3(label: ?[*:0]const u8, v: [3]f32, v_min: f32, v_max: f32) bool;
extern fn ImGui_SliderFloat3Ex(label: ?[*:0]const u8, v: [3]f32, v_min: f32, v_max: f32, format: ?[*:0]const u8, flags: SliderFlags) bool;
extern fn ImGui_SliderFloat4(label: ?[*:0]const u8, v: [4]f32, v_min: f32, v_max: f32) bool;
extern fn ImGui_SliderFloat4Ex(label: ?[*:0]const u8, v: [4]f32, v_min: f32, v_max: f32, format: ?[*:0]const u8, flags: SliderFlags) bool;
extern fn ImGui_SliderAngle(label: ?[*:0]const u8, v_rad: ?*f32) bool;
extern fn ImGui_SliderAngleEx(label: ?[*:0]const u8, v_rad: ?*f32, v_degrees_min: f32, v_degrees_max: f32, format: ?[*:0]const u8, flags: SliderFlags) bool;
extern fn ImGui_SliderInt(label: ?[*:0]const u8, v: ?*c_int, v_min: c_int, v_max: c_int) bool;
extern fn ImGui_SliderIntEx(label: ?[*:0]const u8, v: ?*c_int, v_min: c_int, v_max: c_int, format: ?[*:0]const u8, flags: SliderFlags) bool;
extern fn ImGui_SliderInt2(label: ?[*:0]const u8, v: [2]c_int, v_min: c_int, v_max: c_int) bool;
extern fn ImGui_SliderInt2Ex(label: ?[*:0]const u8, v: [2]c_int, v_min: c_int, v_max: c_int, format: ?[*:0]const u8, flags: SliderFlags) bool;
extern fn ImGui_SliderInt3(label: ?[*:0]const u8, v: [3]c_int, v_min: c_int, v_max: c_int) bool;
extern fn ImGui_SliderInt3Ex(label: ?[*:0]const u8, v: [3]c_int, v_min: c_int, v_max: c_int, format: ?[*:0]const u8, flags: SliderFlags) bool;
extern fn ImGui_SliderInt4(label: ?[*:0]const u8, v: [4]c_int, v_min: c_int, v_max: c_int) bool;
extern fn ImGui_SliderInt4Ex(label: ?[*:0]const u8, v: [4]c_int, v_min: c_int, v_max: c_int, format: ?[*:0]const u8, flags: SliderFlags) bool;
extern fn ImGui_SliderScalar(label: ?[*:0]const u8, data_type: DataType, p_data: ?*anyopaque, p_min: ?*anyopaque, p_max: ?*anyopaque) bool;
extern fn ImGui_SliderScalarEx(label: ?[*:0]const u8, data_type: DataType, p_data: ?*anyopaque, p_min: ?*anyopaque, p_max: ?*anyopaque, format: ?[*:0]const u8, flags: SliderFlags) bool;
extern fn ImGui_SliderScalarN(label: ?[*:0]const u8, data_type: DataType, p_data: ?*anyopaque, components: c_int, p_min: ?*anyopaque, p_max: ?*anyopaque) bool;
extern fn ImGui_SliderScalarNEx(label: ?[*:0]const u8, data_type: DataType, p_data: ?*anyopaque, components: c_int, p_min: ?*anyopaque, p_max: ?*anyopaque, format: ?[*:0]const u8, flags: SliderFlags) bool;
extern fn ImGui_VSliderFloat(label: ?[*:0]const u8, size: Vec2, v: ?*f32, v_min: f32, v_max: f32) bool;
extern fn ImGui_VSliderFloatEx(label: ?[*:0]const u8, size: Vec2, v: ?*f32, v_min: f32, v_max: f32, format: ?[*:0]const u8, flags: SliderFlags) bool;
extern fn ImGui_VSliderInt(label: ?[*:0]const u8, size: Vec2, v: ?*c_int, v_min: c_int, v_max: c_int) bool;
extern fn ImGui_VSliderIntEx(label: ?[*:0]const u8, size: Vec2, v: ?*c_int, v_min: c_int, v_max: c_int, format: ?[*:0]const u8, flags: SliderFlags) bool;
extern fn ImGui_VSliderScalar(label: ?[*:0]const u8, size: Vec2, data_type: DataType, p_data: ?*anyopaque, p_min: ?*anyopaque, p_max: ?*anyopaque) bool;
extern fn ImGui_VSliderScalarEx(label: ?[*:0]const u8, size: Vec2, data_type: DataType, p_data: ?*anyopaque, p_min: ?*anyopaque, p_max: ?*anyopaque, format: ?[*:0]const u8, flags: SliderFlags) bool;
extern fn ImGui_InputText(label: ?[*:0]const u8, buf: ?[*:0]const u8, buf_size: usize, flags: InputTextFlags) bool;
extern fn ImGui_InputTextEx(label: ?[*:0]const u8, buf: ?[*:0]const u8, buf_size: usize, flags: InputTextFlags, callback: InputTextCallback, user_data: ?*anyopaque) bool;
extern fn ImGui_InputTextMultiline(label: ?[*:0]const u8, buf: ?[*:0]const u8, buf_size: usize) bool;
extern fn ImGui_InputTextMultilineEx(label: ?[*:0]const u8, buf: ?[*:0]const u8, buf_size: usize, size: Vec2, flags: InputTextFlags, callback: InputTextCallback, user_data: ?*anyopaque) bool;
extern fn ImGui_InputTextWithHint(label: ?[*:0]const u8, hint: ?[*:0]const u8, buf: ?[*:0]const u8, buf_size: usize, flags: InputTextFlags) bool;
extern fn ImGui_InputTextWithHintEx(label: ?[*:0]const u8, hint: ?[*:0]const u8, buf: ?[*:0]const u8, buf_size: usize, flags: InputTextFlags, callback: InputTextCallback, user_data: ?*anyopaque) bool;
extern fn ImGui_InputFloat(label: ?[*:0]const u8, v: ?*f32) bool;
extern fn ImGui_InputFloatEx(label: ?[*:0]const u8, v: ?*f32, step: f32, step_fast: f32, format: ?[*:0]const u8, flags: InputTextFlags) bool;
extern fn ImGui_InputFloat2(label: ?[*:0]const u8, v: [2]f32) bool;
extern fn ImGui_InputFloat2Ex(label: ?[*:0]const u8, v: [2]f32, format: ?[*:0]const u8, flags: InputTextFlags) bool;
extern fn ImGui_InputFloat3(label: ?[*:0]const u8, v: [3]f32) bool;
extern fn ImGui_InputFloat3Ex(label: ?[*:0]const u8, v: [3]f32, format: ?[*:0]const u8, flags: InputTextFlags) bool;
extern fn ImGui_InputFloat4(label: ?[*:0]const u8, v: [4]f32) bool;
extern fn ImGui_InputFloat4Ex(label: ?[*:0]const u8, v: [4]f32, format: ?[*:0]const u8, flags: InputTextFlags) bool;
extern fn ImGui_InputInt(label: ?[*:0]const u8, v: ?*c_int) bool;
extern fn ImGui_InputIntEx(label: ?[*:0]const u8, v: ?*c_int, step: c_int, step_fast: c_int, flags: InputTextFlags) bool;
extern fn ImGui_InputInt2(label: ?[*:0]const u8, v: [2]c_int, flags: InputTextFlags) bool;
extern fn ImGui_InputInt3(label: ?[*:0]const u8, v: [3]c_int, flags: InputTextFlags) bool;
extern fn ImGui_InputInt4(label: ?[*:0]const u8, v: [4]c_int, flags: InputTextFlags) bool;
extern fn ImGui_InputDouble(label: ?[*:0]const u8, v: ?*f64) bool;
extern fn ImGui_InputDoubleEx(label: ?[*:0]const u8, v: ?*f64, step: f64, step_fast: f64, format: ?[*:0]const u8, flags: InputTextFlags) bool;
extern fn ImGui_InputScalar(label: ?[*:0]const u8, data_type: DataType, p_data: ?*anyopaque) bool;
extern fn ImGui_InputScalarEx(label: ?[*:0]const u8, data_type: DataType, p_data: ?*anyopaque, p_step: ?*anyopaque, p_step_fast: ?*anyopaque, format: ?[*:0]const u8, flags: InputTextFlags) bool;
extern fn ImGui_InputScalarN(label: ?[*:0]const u8, data_type: DataType, p_data: ?*anyopaque, components: c_int) bool;
extern fn ImGui_InputScalarNEx(label: ?[*:0]const u8, data_type: DataType, p_data: ?*anyopaque, components: c_int, p_step: ?*anyopaque, p_step_fast: ?*anyopaque, format: ?[*:0]const u8, flags: InputTextFlags) bool;
extern fn ImGui_ColorEdit3(label: ?[*:0]const u8, col: [3]f32, flags: ColorEditFlags) bool;
extern fn ImGui_ColorEdit4(label: ?[*:0]const u8, col: [4]f32, flags: ColorEditFlags) bool;
extern fn ImGui_ColorPicker3(label: ?[*:0]const u8, col: [3]f32, flags: ColorEditFlags) bool;
extern fn ImGui_ColorPicker4(label: ?[*:0]const u8, col: [4]f32, flags: ColorEditFlags, ref_col: ?*const f32) bool;
extern fn ImGui_ColorButton(desc_id: ?[*:0]const u8, col: Vec4, flags: ColorEditFlags) bool;
extern fn ImGui_ColorButtonEx(desc_id: ?[*:0]const u8, col: Vec4, flags: ColorEditFlags, size: Vec2) bool;
extern fn ImGui_SetColorEditOptions(flags: ColorEditFlags) void;
extern fn ImGui_TreeNode(label: ?[*:0]const u8) bool;
extern fn ImGui_TreeNodeStr(str_id: ?[*:0]const u8, fmt: ?[*:0]const u8, ...) bool;
extern fn ImGui_TreeNodeStrUnformatted(str_id: ?[*:0]const u8, text: ?[*:0]const u8) bool;
extern fn ImGui_TreeNodePtr(ptr_id: ?*anyopaque, fmt: ?[*:0]const u8, ...) bool;
extern fn ImGui_TreeNodePtrUnformatted(ptr_id: ?*anyopaque, text: ?[*:0]const u8) bool;
extern fn ImGui_TreeNodeV(str_id: ?[*:0]const u8, fmt: ?[*:0]const u8, args: c.va_list) bool;
extern fn ImGui_TreeNodeVPtr(ptr_id: ?*anyopaque, fmt: ?[*:0]const u8, args: c.va_list) bool;
extern fn ImGui_TreeNodeEx(label: ?[*:0]const u8, flags: TreeNodeFlags) bool;
extern fn ImGui_TreeNodeExStr(str_id: ?[*:0]const u8, flags: TreeNodeFlags, fmt: ?[*:0]const u8, ...) bool;
extern fn ImGui_TreeNodeExStrUnformatted(str_id: ?[*:0]const u8, flags: TreeNodeFlags, text: ?[*:0]const u8) bool;
extern fn ImGui_TreeNodeExPtr(ptr_id: ?*anyopaque, flags: TreeNodeFlags, fmt: ?[*:0]const u8, ...) bool;
extern fn ImGui_TreeNodeExPtrUnformatted(ptr_id: ?*anyopaque, flags: TreeNodeFlags, text: ?[*:0]const u8) bool;
extern fn ImGui_TreeNodeExV(str_id: ?[*:0]const u8, flags: TreeNodeFlags, fmt: ?[*:0]const u8, args: c.va_list) bool;
extern fn ImGui_TreeNodeExVPtr(ptr_id: ?*anyopaque, flags: TreeNodeFlags, fmt: ?[*:0]const u8, args: c.va_list) bool;
extern fn ImGui_TreePush(str_id: ?[*:0]const u8) void;
extern fn ImGui_TreePushPtr(ptr_id: ?*anyopaque) void;
extern fn ImGui_TreePop() void;
extern fn ImGui_GetTreeNodeToLabelSpacing() f32;
extern fn ImGui_CollapsingHeader(label: ?[*:0]const u8, flags: TreeNodeFlags) bool;
extern fn ImGui_CollapsingHeaderBoolPtr(label: ?[*:0]const u8, p_visible: ?*bool, flags: TreeNodeFlags) bool;
extern fn ImGui_SetNextItemOpen(is_open: bool, cond: Cond) void;
extern fn ImGui_Selectable(label: ?[*:0]const u8) bool;
extern fn ImGui_SelectableEx(label: ?[*:0]const u8, selected: bool, flags: SelectableFlags, size: Vec2) bool;
extern fn ImGui_SelectableBoolPtr(label: ?[*:0]const u8, p_selected: ?*bool, flags: SelectableFlags) bool;
extern fn ImGui_SelectableBoolPtrEx(label: ?[*:0]const u8, p_selected: ?*bool, flags: SelectableFlags, size: Vec2) bool;
extern fn ImGui_BeginListBox(label: ?[*:0]const u8, size: Vec2) bool;
extern fn ImGui_EndListBox() void;
extern fn ImGui_ListBox(label: ?[*:0]const u8, current_item: ?*c_int, items: [*]const ?[*:0]const u8, items_count: c_int, height_in_items: c_int) bool;
extern fn ImGui_ListBoxCallback(label: ?[*:0]const u8, current_item: ?*c_int, getter: ?*const fn (?*anyopaque, c_int) callconv(.C) ?[*:0]const u8, user_data: ?*anyopaque, items_count: c_int) bool;
extern fn ImGui_ListBoxCallbackEx(label: ?[*:0]const u8, current_item: ?*c_int, getter: ?*const fn (?*anyopaque, c_int) callconv(.C) ?[*:0]const u8, user_data: ?*anyopaque, items_count: c_int, height_in_items: c_int) bool;
extern fn ImGui_PlotLines(label: ?[*:0]const u8, values: ?*const f32, values_count: c_int) void;
extern fn ImGui_PlotLinesEx(label: ?[*:0]const u8, values: ?*const f32, values_count: c_int, values_offset: c_int, overlay_text: ?[*:0]const u8, scale_min: f32, scale_max: f32, graph_size: Vec2, stride: c_int) void;
extern fn ImGui_PlotLinesCallback(label: ?[*:0]const u8, values_getter: ?*const fn (?*anyopaque, c_int) callconv(.C) f32, data: ?*anyopaque, values_count: c_int) void;
extern fn ImGui_PlotLinesCallbackEx(label: ?[*:0]const u8, values_getter: ?*const fn (?*anyopaque, c_int) callconv(.C) f32, data: ?*anyopaque, values_count: c_int, values_offset: c_int, overlay_text: ?[*:0]const u8, scale_min: f32, scale_max: f32, graph_size: Vec2) void;
extern fn ImGui_PlotHistogram(label: ?[*:0]const u8, values: ?*const f32, values_count: c_int) void;
extern fn ImGui_PlotHistogramEx(label: ?[*:0]const u8, values: ?*const f32, values_count: c_int, values_offset: c_int, overlay_text: ?[*:0]const u8, scale_min: f32, scale_max: f32, graph_size: Vec2, stride: c_int) void;
extern fn ImGui_PlotHistogramCallback(label: ?[*:0]const u8, values_getter: ?*const fn (?*anyopaque, c_int) callconv(.C) f32, data: ?*anyopaque, values_count: c_int) void;
extern fn ImGui_PlotHistogramCallbackEx(label: ?[*:0]const u8, values_getter: ?*const fn (?*anyopaque, c_int) callconv(.C) f32, data: ?*anyopaque, values_count: c_int, values_offset: c_int, overlay_text: ?[*:0]const u8, scale_min: f32, scale_max: f32, graph_size: Vec2) void;
extern fn ImGui_BeginMenuBar() bool;
extern fn ImGui_EndMenuBar() void;
extern fn ImGui_BeginMainMenuBar() bool;
extern fn ImGui_EndMainMenuBar() void;
extern fn ImGui_BeginMenu(label: ?[*:0]const u8) bool;
extern fn ImGui_BeginMenuEx(label: ?[*:0]const u8, enabled: bool) bool;
extern fn ImGui_EndMenu() void;
extern fn ImGui_MenuItem(label: ?[*:0]const u8) bool;
extern fn ImGui_MenuItemEx(label: ?[*:0]const u8, shortcut: ?[*:0]const u8, selected: bool, enabled: bool) bool;
extern fn ImGui_MenuItemBoolPtr(label: ?[*:0]const u8, shortcut: ?[*:0]const u8, p_selected: ?*bool, enabled: bool) bool;
extern fn ImGui_BeginTooltip() bool;
extern fn ImGui_EndTooltip() void;
extern fn ImGui_SetTooltip(fmt: ?[*:0]const u8, ...) void;
extern fn ImGui_SetTooltipUnformatted(text: ?[*:0]const u8) void;
extern fn ImGui_SetTooltipV(fmt: ?[*:0]const u8, args: c.va_list) void;
extern fn ImGui_BeginItemTooltip() bool;
extern fn ImGui_SetItemTooltip(fmt: ?[*:0]const u8, ...) void;
extern fn ImGui_SetItemTooltipUnformatted(text: ?[*:0]const u8) void;
extern fn ImGui_SetItemTooltipV(fmt: ?[*:0]const u8, args: c.va_list) void;
extern fn ImGui_BeginPopup(str_id: ?[*:0]const u8, flags: WindowFlags) bool;
extern fn ImGui_BeginPopupModal(name: ?[*:0]const u8, p_open: ?*bool, flags: WindowFlags) bool;
extern fn ImGui_EndPopup() void;
extern fn ImGui_OpenPopup(str_id: ?[*:0]const u8, popup_flags: PopupFlags) void;
extern fn ImGui_OpenPopupID(id: ID, popup_flags: PopupFlags) void;
extern fn ImGui_OpenPopupOnItemClick(str_id: ?[*:0]const u8, popup_flags: PopupFlags) void;
extern fn ImGui_CloseCurrentPopup() void;
extern fn ImGui_BeginPopupContextItem() bool;
extern fn ImGui_BeginPopupContextItemEx(str_id: ?[*:0]const u8, popup_flags: PopupFlags) bool;
extern fn ImGui_BeginPopupContextWindow() bool;
extern fn ImGui_BeginPopupContextWindowEx(str_id: ?[*:0]const u8, popup_flags: PopupFlags) bool;
extern fn ImGui_BeginPopupContextVoid() bool;
extern fn ImGui_BeginPopupContextVoidEx(str_id: ?[*:0]const u8, popup_flags: PopupFlags) bool;
extern fn ImGui_IsPopupOpen(str_id: ?[*:0]const u8, flags: PopupFlags) bool;
extern fn ImGui_BeginTable(str_id: ?[*:0]const u8, column: c_int, flags: TableFlags) bool;
extern fn ImGui_BeginTableEx(str_id: ?[*:0]const u8, column: c_int, flags: TableFlags, outer_size: Vec2, inner_width: f32) bool;
extern fn ImGui_EndTable() void;
extern fn ImGui_TableNextRow() void;
extern fn ImGui_TableNextRowEx(row_flags: TableRowFlags, min_row_height: f32) void;
extern fn ImGui_TableNextColumn() bool;
extern fn ImGui_TableSetColumnIndex(column_n: c_int) bool;
extern fn ImGui_TableSetupColumn(label: ?[*:0]const u8, flags: TableColumnFlags) void;
extern fn ImGui_TableSetupColumnEx(label: ?[*:0]const u8, flags: TableColumnFlags, init_width_or_weight: f32, user_id: ID) void;
extern fn ImGui_TableSetupScrollFreeze(cols: c_int, rows: c_int) void;
extern fn ImGui_TableHeader(label: ?[*:0]const u8) void;
extern fn ImGui_TableHeadersRow() void;
extern fn ImGui_TableAngledHeadersRow() void;
extern fn ImGui_TableGetSortSpecs() ?*TableSortSpecs;
extern fn ImGui_TableGetColumnCount() c_int;
extern fn ImGui_TableGetColumnIndex() c_int;
extern fn ImGui_TableGetRowIndex() c_int;
extern fn ImGui_TableGetColumnName(column_n: c_int) ?[*:0]const u8;
extern fn ImGui_TableGetColumnFlags(column_n: c_int) TableColumnFlags;
extern fn ImGui_TableSetColumnEnabled(column_n: c_int, v: bool) void;
extern fn ImGui_TableSetBgColor(target: TableBgTarget, color: U32, column_n: c_int) void;
extern fn ImGui_Columns() void;
extern fn ImGui_ColumnsEx(count: c_int, id: ?[*:0]const u8, border: bool) void;
extern fn ImGui_NextColumn() void;
extern fn ImGui_GetColumnIndex() c_int;
extern fn ImGui_GetColumnWidth(column_index: c_int) f32;
extern fn ImGui_SetColumnWidth(column_index: c_int, width: f32) void;
extern fn ImGui_GetColumnOffset(column_index: c_int) f32;
extern fn ImGui_SetColumnOffset(column_index: c_int, offset_x: f32) void;
extern fn ImGui_GetColumnsCount() c_int;
extern fn ImGui_BeginTabBar(str_id: ?[*:0]const u8, flags: TabBarFlags) bool;
extern fn ImGui_EndTabBar() void;
extern fn ImGui_BeginTabItem(label: ?[*:0]const u8, p_open: ?*bool, flags: TabItemFlags) bool;
extern fn ImGui_EndTabItem() void;
extern fn ImGui_TabItemButton(label: ?[*:0]const u8, flags: TabItemFlags) bool;
extern fn ImGui_SetTabItemClosed(tab_or_docked_window_label: ?[*:0]const u8) void;
extern fn ImGui_LogToTTY(auto_open_depth: c_int) void;
extern fn ImGui_LogToFile(auto_open_depth: c_int, filename: ?[*:0]const u8) void;
extern fn ImGui_LogToClipboard(auto_open_depth: c_int) void;
extern fn ImGui_LogFinish() void;
extern fn ImGui_LogButtons() void;
extern fn ImGui_LogText(fmt: ?[*:0]const u8, ...) void;
extern fn ImGui_LogTextUnformatted(text: ?[*:0]const u8) void;
extern fn ImGui_LogTextV(fmt: ?[*:0]const u8, args: c.va_list) void;
extern fn ImGui_BeginDragDropSource(flags: DragDropFlags) bool;
extern fn ImGui_SetDragDropPayload(type: ?[*:0]const u8, data: ?*anyopaque, sz: usize, cond: Cond) bool;
extern fn ImGui_EndDragDropSource() void;
extern fn ImGui_BeginDragDropTarget() bool;
extern fn ImGui_AcceptDragDropPayload(type: ?[*:0]const u8, flags: DragDropFlags) ?*const Payload;
extern fn ImGui_EndDragDropTarget() void;
extern fn ImGui_GetDragDropPayload() ?*const Payload;
extern fn ImGui_BeginDisabled(disabled: bool) void;
extern fn ImGui_EndDisabled() void;
extern fn ImGui_PushClipRect(clip_rect_min: Vec2, clip_rect_max: Vec2, intersect_with_current_clip_rect: bool) void;
extern fn ImGui_PopClipRect() void;
extern fn ImGui_SetItemDefaultFocus() void;
extern fn ImGui_SetKeyboardFocusHere() void;
extern fn ImGui_SetKeyboardFocusHereEx(offset: c_int) void;
extern fn ImGui_SetNextItemAllowOverlap() void;
extern fn ImGui_IsItemHovered(flags: HoveredFlags) bool;
extern fn ImGui_IsItemActive() bool;
extern fn ImGui_IsItemFocused() bool;
extern fn ImGui_IsItemClicked() bool;
extern fn ImGui_IsItemClickedEx(mouse_button: MouseButton) bool;
extern fn ImGui_IsItemVisible() bool;
extern fn ImGui_IsItemEdited() bool;
extern fn ImGui_IsItemActivated() bool;
extern fn ImGui_IsItemDeactivated() bool;
extern fn ImGui_IsItemDeactivatedAfterEdit() bool;
extern fn ImGui_IsItemToggledOpen() bool;
extern fn ImGui_IsAnyItemHovered() bool;
extern fn ImGui_IsAnyItemActive() bool;
extern fn ImGui_IsAnyItemFocused() bool;
extern fn ImGui_GetItemID() ID;
extern fn ImGui_GetItemRectMin() Vec2;
extern fn ImGui_GetItemRectMax() Vec2;
extern fn ImGui_GetItemRectSize() Vec2;
extern fn ImGui_GetMainViewport() ?*Viewport;
extern fn ImGui_GetBackgroundDrawList() ?*DrawList;
extern fn ImGui_GetForegroundDrawList() ?*DrawList;
extern fn ImGui_IsRectVisibleBySize(size: Vec2) bool;
extern fn ImGui_IsRectVisible(rect_min: Vec2, rect_max: Vec2) bool;
extern fn ImGui_GetTime() f64;
extern fn ImGui_GetFrameCount() c_int;
extern fn ImGui_GetDrawListSharedData() ?*DrawListSharedData;
extern fn ImGui_GetStyleColorName(idx: Col) ?[*:0]const u8;
extern fn ImGui_SetStateStorage(storage: ?*Storage) void;
extern fn ImGui_GetStateStorage() ?*Storage;
extern fn ImGui_BeginChildFrame(id: ID, size: Vec2, flags: WindowFlags) bool;
extern fn ImGui_EndChildFrame() void;
extern fn ImGui_CalcTextSize(text: ?[*:0]const u8) Vec2;
extern fn ImGui_CalcTextSizeEx(text: ?[*:0]const u8, text_end: ?[*:0]const u8, hide_text_after_double_hash: bool, wrap_width: f32) Vec2;
extern fn ImGui_ColorConvertU32ToFloat4(in: U32) Vec4;
extern fn ImGui_ColorConvertFloat4ToU32(in: Vec4) U32;
extern fn ImGui_ColorConvertRGBtoHSV(r: f32, g: f32, b: f32, out_h: *f32, out_s: *f32, out_v: *f32) void;
extern fn ImGui_ColorConvertHSVtoRGB(h: f32, s: f32, v: f32, out_r: *f32, out_g: *f32, out_b: *f32) void;
extern fn ImGui_IsKeyDown(key: Key) bool;
extern fn ImGui_IsKeyPressed(key: Key) bool;
extern fn ImGui_IsKeyPressedEx(key: Key, repeat: bool) bool;
extern fn ImGui_IsKeyReleased(key: Key) bool;
extern fn ImGui_GetKeyPressedAmount(key: Key, repeat_delay: f32, rate: f32) c_int;
extern fn ImGui_GetKeyName(key: Key) ?[*:0]const u8;
extern fn ImGui_SetNextFrameWantCaptureKeyboard(want_capture_keyboard: bool) void;
extern fn ImGui_IsMouseDown(button: MouseButton) bool;
extern fn ImGui_IsMouseClicked(button: MouseButton) bool;
extern fn ImGui_IsMouseClickedEx(button: MouseButton, repeat: bool) bool;
extern fn ImGui_IsMouseReleased(button: MouseButton) bool;
extern fn ImGui_IsMouseDoubleClicked(button: MouseButton) bool;
extern fn ImGui_GetMouseClickedCount(button: MouseButton) c_int;
extern fn ImGui_IsMouseHoveringRect(r_min: Vec2, r_max: Vec2) bool;
extern fn ImGui_IsMouseHoveringRectEx(r_min: Vec2, r_max: Vec2, clip: bool) bool;
extern fn ImGui_IsMousePosValid(mouse_pos: ?*const Vec2) bool;
extern fn ImGui_IsAnyMouseDown() bool;
extern fn ImGui_GetMousePos() Vec2;
extern fn ImGui_GetMousePosOnOpeningCurrentPopup() Vec2;
extern fn ImGui_IsMouseDragging(button: MouseButton, lock_threshold: f32) bool;
extern fn ImGui_GetMouseDragDelta(button: MouseButton, lock_threshold: f32) Vec2;
extern fn ImGui_ResetMouseDragDelta() void;
extern fn ImGui_ResetMouseDragDeltaEx(button: MouseButton) void;
extern fn ImGui_GetMouseCursor() MouseCursor;
extern fn ImGui_SetMouseCursor(cursor_type: MouseCursor) void;
extern fn ImGui_SetNextFrameWantCaptureMouse(want_capture_mouse: bool) void;
extern fn ImGui_GetClipboardText() ?[*:0]const u8;
extern fn ImGui_SetClipboardText(text: ?[*:0]const u8) void;
extern fn ImGui_LoadIniSettingsFromDisk(ini_filename: ?[*:0]const u8) void;
extern fn ImGui_LoadIniSettingsFromMemory(ini_data: ?[*:0]const u8, ini_size: usize) void;
extern fn ImGui_SaveIniSettingsToDisk(ini_filename: ?[*:0]const u8) void;
extern fn ImGui_SaveIniSettingsToMemory(out_ini_size: ?*usize) ?[*:0]const u8;
extern fn ImGui_DebugTextEncoding(text: ?[*:0]const u8) void;
extern fn ImGui_DebugCheckVersionAndDataLayout(version_str: ?[*:0]const u8, sz_io: usize, sz_style: usize, sz_vec2: usize, sz_vec4: usize, sz_drawvert: usize, sz_drawidx: usize) bool;
extern fn ImGui_SetAllocatorFunctions(alloc_func: MemAllocFunc, free_func: MemFreeFunc, user_data: ?*anyopaque) void;
extern fn ImGui_GetAllocatorFunctions(p_alloc_func: ?*MemAllocFunc, p_free_func: ?*MemFreeFunc, p_user_data: ?*?*anyopaque) void;
extern fn ImGui_MemAlloc(size: usize) ?*anyopaque;
extern fn ImGui_MemFree(ptr: ?*anyopaque) void;
extern fn ImVector_Construct(vector: ?*anyopaque) void;
extern fn ImVector_Destruct(vector: ?*anyopaque) void;
extern fn ImGuiStyle_ScaleAllSizes(self: *Style, scale_factor: f32) void;
extern fn ImGuiIO_AddKeyEvent(self: *IO, key: Key, down: bool) void;
extern fn ImGuiIO_AddKeyAnalogEvent(self: *IO, key: Key, down: bool, v: f32) void;
extern fn ImGuiIO_AddMousePosEvent(self: *IO, x: f32, y: f32) void;
extern fn ImGuiIO_AddMouseButtonEvent(self: *IO, button: c_int, down: bool) void;
extern fn ImGuiIO_AddMouseWheelEvent(self: *IO, wheel_x: f32, wheel_y: f32) void;
extern fn ImGuiIO_AddMouseSourceEvent(self: *IO, source: MouseSource) void;
extern fn ImGuiIO_AddFocusEvent(self: *IO, focused: bool) void;
extern fn ImGuiIO_AddInputCharacter(self: *IO, c: c_uint) void;
extern fn ImGuiIO_AddInputCharacterUTF16(self: *IO, c: Wchar16) void;
extern fn ImGuiIO_AddInputCharactersUTF8(self: *IO, str: ?[*:0]const u8) void;
extern fn ImGuiIO_SetKeyEventNativeData(self: *IO, key: Key, native_keycode: c_int, native_scancode: c_int) void;
extern fn ImGuiIO_SetKeyEventNativeDataEx(self: *IO, key: Key, native_keycode: c_int, native_scancode: c_int, native_legacy_index: c_int) void;
extern fn ImGuiIO_SetAppAcceptingEvents(self: *IO, accepting_events: bool) void;
extern fn ImGuiIO_ClearEventsQueue(self: *IO) void;
extern fn ImGuiIO_ClearInputKeys(self: *IO) void;
extern fn ImGuiIO_ClearInputCharacters(self: *IO) void;
extern fn ImGuiInputTextCallbackData_DeleteChars(self: *InputTextCallbackData, pos: c_int, bytes_count: c_int) void;
extern fn ImGuiInputTextCallbackData_InsertChars(self: *InputTextCallbackData, pos: c_int, text: ?[*:0]const u8, text_end: ?[*:0]const u8) void;
extern fn ImGuiInputTextCallbackData_SelectAll(self: *InputTextCallbackData) void;
extern fn ImGuiInputTextCallbackData_ClearSelection(self: *InputTextCallbackData) void;
extern fn ImGuiInputTextCallbackData_HasSelection(self: *const InputTextCallbackData) bool;
extern fn ImGuiPayload_Clear(self: *Payload) void;
extern fn ImGuiPayload_IsDataType(self: *const Payload, type: ?[*:0]const u8) bool;
extern fn ImGuiPayload_IsPreview(self: *const Payload) bool;
extern fn ImGuiPayload_IsDelivery(self: *const Payload) bool;
extern fn ImGuiTextFilter_ImGuiTextRange_empty(self: *const TextFilter_ImGuiTextRange) bool;
extern fn ImGuiTextFilter_ImGuiTextRange_split(self: *const TextFilter_ImGuiTextRange, separator: c_char, out: ?*Vector_ImGuiTextFilter_ImGuiTextRange) void;
extern fn ImGuiTextFilter_Draw(self: *TextFilter, label: ?[*:0]const u8, width: f32) bool;
extern fn ImGuiTextFilter_PassFilter(self: *const TextFilter, text: ?[*:0]const u8, text_end: ?[*:0]const u8) bool;
extern fn ImGuiTextFilter_Build(self: *TextFilter) void;
extern fn ImGuiTextFilter_Clear(self: *TextFilter) void;
extern fn ImGuiTextFilter_IsActive(self: *const TextFilter) bool;
extern fn ImGuiTextBuffer_begin(self: *const TextBuffer) ?[*:0]const u8;
extern fn ImGuiTextBuffer_end(self: *const TextBuffer) ?[*:0]const u8;
extern fn ImGuiTextBuffer_size(self: *const TextBuffer) c_int;
extern fn ImGuiTextBuffer_empty(self: *const TextBuffer) bool;
extern fn ImGuiTextBuffer_clear(self: *TextBuffer) void;
extern fn ImGuiTextBuffer_reserve(self: *TextBuffer, capacity: c_int) void;
extern fn ImGuiTextBuffer_c_str(self: *const TextBuffer) ?[*:0]const u8;
extern fn ImGuiTextBuffer_append(self: *TextBuffer, str: ?[*:0]const u8, str_end: ?[*:0]const u8) void;
extern fn ImGuiTextBuffer_appendf(self: *TextBuffer, fmt: ?[*:0]const u8, ...) void;
extern fn ImGuiTextBuffer_appendfv(self: *TextBuffer, fmt: ?[*:0]const u8, args: c.va_list) void;
extern fn ImGuiStorage_Clear(self: *Storage) void;
extern fn ImGuiStorage_GetInt(self: *const Storage, key: ID, default_val: c_int) c_int;
extern fn ImGuiStorage_SetInt(self: *Storage, key: ID, val: c_int) void;
extern fn ImGuiStorage_GetBool(self: *const Storage, key: ID, default_val: bool) bool;
extern fn ImGuiStorage_SetBool(self: *Storage, key: ID, val: bool) void;
extern fn ImGuiStorage_GetFloat(self: *const Storage, key: ID, default_val: f32) f32;
extern fn ImGuiStorage_SetFloat(self: *Storage, key: ID, val: f32) void;
extern fn ImGuiStorage_GetVoidPtr(self: *const Storage, key: ID) ?*anyopaque;
extern fn ImGuiStorage_SetVoidPtr(self: *Storage, key: ID, val: ?*anyopaque) void;
extern fn ImGuiStorage_GetIntRef(self: *Storage, key: ID, default_val: c_int) ?*c_int;
extern fn ImGuiStorage_GetBoolRef(self: *Storage, key: ID, default_val: bool) ?*bool;
extern fn ImGuiStorage_GetFloatRef(self: *Storage, key: ID, default_val: f32) ?*f32;
extern fn ImGuiStorage_GetVoidPtrRef(self: *Storage, key: ID, default_val: ?*anyopaque) ?*?*anyopaque;
extern fn ImGuiStorage_SetAllInt(self: *Storage, val: c_int) void;
extern fn ImGuiStorage_BuildSortByKey(self: *Storage) void;
extern fn ImGuiListClipper_Begin(self: *ListClipper, items_count: c_int, items_height: f32) void;
extern fn ImGuiListClipper_End(self: *ListClipper) void;
extern fn ImGuiListClipper_Step(self: *ListClipper) bool;
extern fn ImGuiListClipper_IncludeItemByIndex(self: *ListClipper, item_index: c_int) void;
extern fn ImGuiListClipper_IncludeItemsByIndex(self: *ListClipper, item_begin: c_int, item_end: c_int) void;
extern fn ImGuiListClipper_IncludeRangeByIndices(self: *ListClipper, item_begin: c_int, item_end: c_int) void;
extern fn ImGuiListClipper_ForceDisplayRangeByIndices(self: *ListClipper, item_begin: c_int, item_end: c_int) void;
extern fn ImColor_SetHSV(self: *Color, h: f32, s: f32, v: f32, a: f32) void;
extern fn ImColor_HSV(self: *Color, h: f32, s: f32, v: f32, a: f32) Color;
extern fn ImDrawCmd_GetTexID(self: *const DrawCmd) TextureID;
extern fn ImDrawListSplitter_Clear(self: *DrawListSplitter) void;
extern fn ImDrawListSplitter_ClearFreeMemory(self: *DrawListSplitter) void;
extern fn ImDrawListSplitter_Split(self: *DrawListSplitter, draw_list: ?*DrawList, count: c_int) void;
extern fn ImDrawListSplitter_Merge(self: *DrawListSplitter, draw_list: ?*DrawList) void;
extern fn ImDrawListSplitter_SetCurrentChannel(self: *DrawListSplitter, draw_list: ?*DrawList, channel_idx: c_int) void;
extern fn ImDrawList_PushClipRect(self: *DrawList, clip_rect_min: Vec2, clip_rect_max: Vec2, intersect_with_current_clip_rect: bool) void;
extern fn ImDrawList_PushClipRectFullScreen(self: *DrawList) void;
extern fn ImDrawList_PopClipRect(self: *DrawList) void;
extern fn ImDrawList_PushTextureID(self: *DrawList, texture_id: TextureID) void;
extern fn ImDrawList_PopTextureID(self: *DrawList) void;
extern fn ImDrawList_GetClipRectMin(self: *const DrawList) Vec2;
extern fn ImDrawList_GetClipRectMax(self: *const DrawList) Vec2;
extern fn ImDrawList_AddLine(self: *DrawList, p1: Vec2, p2: Vec2, col: U32) void;
extern fn ImDrawList_AddLineEx(self: *DrawList, p1: Vec2, p2: Vec2, col: U32, thickness: f32) void;
extern fn ImDrawList_AddRect(self: *DrawList, p_min: Vec2, p_max: Vec2, col: U32) void;
extern fn ImDrawList_AddRectEx(self: *DrawList, p_min: Vec2, p_max: Vec2, col: U32, rounding: f32, flags: DrawFlags, thickness: f32) void;
extern fn ImDrawList_AddRectFilled(self: *DrawList, p_min: Vec2, p_max: Vec2, col: U32) void;
extern fn ImDrawList_AddRectFilledEx(self: *DrawList, p_min: Vec2, p_max: Vec2, col: U32, rounding: f32, flags: DrawFlags) void;
extern fn ImDrawList_AddRectFilledMultiColor(self: *DrawList, p_min: Vec2, p_max: Vec2, col_upr_left: U32, col_upr_right: U32, col_bot_right: U32, col_bot_left: U32) void;
extern fn ImDrawList_AddQuad(self: *DrawList, p1: Vec2, p2: Vec2, p3: Vec2, p4: Vec2, col: U32) void;
extern fn ImDrawList_AddQuadEx(self: *DrawList, p1: Vec2, p2: Vec2, p3: Vec2, p4: Vec2, col: U32, thickness: f32) void;
extern fn ImDrawList_AddQuadFilled(self: *DrawList, p1: Vec2, p2: Vec2, p3: Vec2, p4: Vec2, col: U32) void;
extern fn ImDrawList_AddTriangle(self: *DrawList, p1: Vec2, p2: Vec2, p3: Vec2, col: U32) void;
extern fn ImDrawList_AddTriangleEx(self: *DrawList, p1: Vec2, p2: Vec2, p3: Vec2, col: U32, thickness: f32) void;
extern fn ImDrawList_AddTriangleFilled(self: *DrawList, p1: Vec2, p2: Vec2, p3: Vec2, col: U32) void;
extern fn ImDrawList_AddCircle(self: *DrawList, center: Vec2, radius: f32, col: U32) void;
extern fn ImDrawList_AddCircleEx(self: *DrawList, center: Vec2, radius: f32, col: U32, num_segments: c_int, thickness: f32) void;
extern fn ImDrawList_AddCircleFilled(self: *DrawList, center: Vec2, radius: f32, col: U32, num_segments: c_int) void;
extern fn ImDrawList_AddNgon(self: *DrawList, center: Vec2, radius: f32, col: U32, num_segments: c_int) void;
extern fn ImDrawList_AddNgonEx(self: *DrawList, center: Vec2, radius: f32, col: U32, num_segments: c_int, thickness: f32) void;
extern fn ImDrawList_AddNgonFilled(self: *DrawList, center: Vec2, radius: f32, col: U32, num_segments: c_int) void;
extern fn ImDrawList_AddEllipse(self: *DrawList, center: Vec2, radius_x: f32, radius_y: f32, col: U32) void;
extern fn ImDrawList_AddEllipseEx(self: *DrawList, center: Vec2, radius_x: f32, radius_y: f32, col: U32, rot: f32, num_segments: c_int, thickness: f32) void;
extern fn ImDrawList_AddEllipseFilled(self: *DrawList, center: Vec2, radius_x: f32, radius_y: f32, col: U32) void;
extern fn ImDrawList_AddEllipseFilledEx(self: *DrawList, center: Vec2, radius_x: f32, radius_y: f32, col: U32, rot: f32, num_segments: c_int) void;
extern fn ImDrawList_AddText(self: *DrawList, pos: Vec2, col: U32, text_begin: ?[*:0]const u8) void;
extern fn ImDrawList_AddTextEx(self: *DrawList, pos: Vec2, col: U32, text_begin: ?[*:0]const u8, text_end: ?[*:0]const u8) void;
extern fn ImDrawList_AddTextImFontPtr(self: *DrawList, font: ?*const Font, font_size: f32, pos: Vec2, col: U32, text_begin: ?[*:0]const u8) void;
extern fn ImDrawList_AddTextImFontPtrEx(self: *DrawList, font: ?*const Font, font_size: f32, pos: Vec2, col: U32, text_begin: ?[*:0]const u8, text_end: ?[*:0]const u8, wrap_width: f32, cpu_fine_clip_rect: ?*const Vec4) void;
extern fn ImDrawList_AddPolyline(self: *DrawList, points: ?*const Vec2, num_points: c_int, col: U32, flags: DrawFlags, thickness: f32) void;
extern fn ImDrawList_AddConvexPolyFilled(self: *DrawList, points: ?*const Vec2, num_points: c_int, col: U32) void;
extern fn ImDrawList_AddBezierCubic(self: *DrawList, p1: Vec2, p2: Vec2, p3: Vec2, p4: Vec2, col: U32, thickness: f32, num_segments: c_int) void;
extern fn ImDrawList_AddBezierQuadratic(self: *DrawList, p1: Vec2, p2: Vec2, p3: Vec2, col: U32, thickness: f32, num_segments: c_int) void;
extern fn ImDrawList_AddImage(self: *DrawList, user_texture_id: TextureID, p_min: Vec2, p_max: Vec2) void;
extern fn ImDrawList_AddImageEx(self: *DrawList, user_texture_id: TextureID, p_min: Vec2, p_max: Vec2, uv_min: Vec2, uv_max: Vec2, col: U32) void;
extern fn ImDrawList_AddImageQuad(self: *DrawList, user_texture_id: TextureID, p1: Vec2, p2: Vec2, p3: Vec2, p4: Vec2) void;
extern fn ImDrawList_AddImageQuadEx(self: *DrawList, user_texture_id: TextureID, p1: Vec2, p2: Vec2, p3: Vec2, p4: Vec2, uv1: Vec2, uv2: Vec2, uv3: Vec2, uv4: Vec2, col: U32) void;
extern fn ImDrawList_AddImageRounded(self: *DrawList, user_texture_id: TextureID, p_min: Vec2, p_max: Vec2, uv_min: Vec2, uv_max: Vec2, col: U32, rounding: f32, flags: DrawFlags) void;
extern fn ImDrawList_PathClear(self: *DrawList) void;
extern fn ImDrawList_PathLineTo(self: *DrawList, pos: Vec2) void;
extern fn ImDrawList_PathLineToMergeDuplicate(self: *DrawList, pos: Vec2) void;
extern fn ImDrawList_PathFillConvex(self: *DrawList, col: U32) void;
extern fn ImDrawList_PathStroke(self: *DrawList, col: U32, flags: DrawFlags, thickness: f32) void;
extern fn ImDrawList_PathArcTo(self: *DrawList, center: Vec2, radius: f32, a_min: f32, a_max: f32, num_segments: c_int) void;
extern fn ImDrawList_PathArcToFast(self: *DrawList, center: Vec2, radius: f32, a_min_of_12: c_int, a_max_of_12: c_int) void;
extern fn ImDrawList_PathEllipticalArcTo(self: *DrawList, center: Vec2, radius_x: f32, radius_y: f32, rot: f32, a_min: f32, a_max: f32) void;
extern fn ImDrawList_PathEllipticalArcToEx(self: *DrawList, center: Vec2, radius_x: f32, radius_y: f32, rot: f32, a_min: f32, a_max: f32, num_segments: c_int) void;
extern fn ImDrawList_PathBezierCubicCurveTo(self: *DrawList, p2: Vec2, p3: Vec2, p4: Vec2, num_segments: c_int) void;
extern fn ImDrawList_PathBezierQuadraticCurveTo(self: *DrawList, p2: Vec2, p3: Vec2, num_segments: c_int) void;
extern fn ImDrawList_PathRect(self: *DrawList, rect_min: Vec2, rect_max: Vec2, rounding: f32, flags: DrawFlags) void;
extern fn ImDrawList_AddCallback(self: *DrawList, callback: DrawCallback, callback_data: ?*anyopaque) void;
extern fn ImDrawList_AddDrawCmd(self: *DrawList) void;
extern fn ImDrawList_CloneOutput(self: *const DrawList) ?*DrawList;
extern fn ImDrawList_ChannelsSplit(self: *DrawList, count: c_int) void;
extern fn ImDrawList_ChannelsMerge(self: *DrawList) void;
extern fn ImDrawList_ChannelsSetCurrent(self: *DrawList, n: c_int) void;
extern fn ImDrawList_PrimReserve(self: *DrawList, idx_count: c_int, vtx_count: c_int) void;
extern fn ImDrawList_PrimUnreserve(self: *DrawList, idx_count: c_int, vtx_count: c_int) void;
extern fn ImDrawList_PrimRect(self: *DrawList, a: Vec2, b: Vec2, col: U32) void;
extern fn ImDrawList_PrimRectUV(self: *DrawList, a: Vec2, b: Vec2, uv_a: Vec2, uv_b: Vec2, col: U32) void;
extern fn ImDrawList_PrimQuadUV(self: *DrawList, a: Vec2, b: Vec2, c: Vec2, d: Vec2, uv_a: Vec2, uv_b: Vec2, uv_c: Vec2, uv_d: Vec2, col: U32) void;
extern fn ImDrawList_PrimWriteVtx(self: *DrawList, pos: Vec2, uv: Vec2, col: U32) void;
extern fn ImDrawList_PrimWriteIdx(self: *DrawList, idx: DrawIdx) void;
extern fn ImDrawList_PrimVtx(self: *DrawList, pos: Vec2, uv: Vec2, col: U32) void;
extern fn ImDrawList__ResetForNewFrame(self: *DrawList) void;
extern fn ImDrawList__ClearFreeMemory(self: *DrawList) void;
extern fn ImDrawList__PopUnusedDrawCmd(self: *DrawList) void;
extern fn ImDrawList__TryMergeDrawCmds(self: *DrawList) void;
extern fn ImDrawList__OnChangedClipRect(self: *DrawList) void;
extern fn ImDrawList__OnChangedTextureID(self: *DrawList) void;
extern fn ImDrawList__OnChangedVtxOffset(self: *DrawList) void;
extern fn ImDrawList__CalcCircleAutoSegmentCount(self: *const DrawList, radius: f32) c_int;
extern fn ImDrawList__PathArcToFastEx(self: *DrawList, center: Vec2, radius: f32, a_min_sample: c_int, a_max_sample: c_int, a_step: c_int) void;
extern fn ImDrawList__PathArcToN(self: *DrawList, center: Vec2, radius: f32, a_min: f32, a_max: f32, num_segments: c_int) void;
extern fn ImDrawData_Clear(self: *DrawData) void;
extern fn ImDrawData_AddDrawList(self: *DrawData, draw_list: ?*DrawList) void;
extern fn ImDrawData_DeIndexAllBuffers(self: *DrawData) void;
extern fn ImDrawData_ScaleClipRects(self: *DrawData, fb_scale: Vec2) void;
extern fn ImFontGlyphRangesBuilder_Clear(self: *FontGlyphRangesBuilder) void;
extern fn ImFontGlyphRangesBuilder_GetBit(self: *const FontGlyphRangesBuilder, n: usize) bool;
extern fn ImFontGlyphRangesBuilder_SetBit(self: *FontGlyphRangesBuilder, n: usize) void;
extern fn ImFontGlyphRangesBuilder_AddChar(self: *FontGlyphRangesBuilder, c: Wchar) void;
extern fn ImFontGlyphRangesBuilder_AddText(self: *FontGlyphRangesBuilder, text: ?[*:0]const u8, text_end: ?[*:0]const u8) void;
extern fn ImFontGlyphRangesBuilder_AddRanges(self: *FontGlyphRangesBuilder, ranges: ?*const Wchar) void;
extern fn ImFontGlyphRangesBuilder_BuildRanges(self: *FontGlyphRangesBuilder, out_ranges: ?*Vector_ImWchar) void;
extern fn ImFontAtlasCustomRect_IsPacked(self: *const FontAtlasCustomRect) bool;
extern fn ImFontAtlas_AddFont(self: *FontAtlas, font_cfg: ?*const FontConfig) ?*Font;
extern fn ImFontAtlas_AddFontDefault(self: *FontAtlas, font_cfg: ?*const FontConfig) ?*Font;
extern fn ImFontAtlas_AddFontFromFileTTF(self: *FontAtlas, filename: ?[*:0]const u8, size_pixels: f32, font_cfg: ?*const FontConfig, glyph_ranges: ?*const Wchar) ?*Font;
extern fn ImFontAtlas_AddFontFromMemoryTTF(self: *FontAtlas, font_data: ?*anyopaque, font_data_size: c_int, size_pixels: f32, font_cfg: ?*const FontConfig, glyph_ranges: ?*const Wchar) ?*Font;
extern fn ImFontAtlas_AddFontFromMemoryCompressedTTF(self: *FontAtlas, compressed_font_data: ?*anyopaque, compressed_font_data_size: c_int, size_pixels: f32, font_cfg: ?*const FontConfig, glyph_ranges: ?*const Wchar) ?*Font;
extern fn ImFontAtlas_AddFontFromMemoryCompressedBase85TTF(self: *FontAtlas, compressed_font_data_base85: ?[*:0]const u8, size_pixels: f32, font_cfg: ?*const FontConfig, glyph_ranges: ?*const Wchar) ?*Font;
extern fn ImFontAtlas_ClearInputData(self: *FontAtlas) void;
extern fn ImFontAtlas_ClearTexData(self: *FontAtlas) void;
extern fn ImFontAtlas_ClearFonts(self: *FontAtlas) void;
extern fn ImFontAtlas_Clear(self: *FontAtlas) void;
extern fn ImFontAtlas_Build(self: *FontAtlas) bool;
extern fn ImFontAtlas_GetTexDataAsAlpha8(self: *FontAtlas, out_pixels: ?*?*c_char, out_width: ?*c_int, out_height: ?*c_int, out_bytes_per_pixel: ?*c_int) void;
extern fn ImFontAtlas_GetTexDataAsRGBA32(self: *FontAtlas, out_pixels: ?*?*c_char, out_width: ?*c_int, out_height: ?*c_int, out_bytes_per_pixel: ?*c_int) void;
extern fn ImFontAtlas_IsBuilt(self: *const FontAtlas) bool;
extern fn ImFontAtlas_SetTexID(self: *FontAtlas, id: TextureID) void;
extern fn ImFontAtlas_GetGlyphRangesDefault(self: *FontAtlas) ?*const Wchar;
extern fn ImFontAtlas_GetGlyphRangesGreek(self: *FontAtlas) ?*const Wchar;
extern fn ImFontAtlas_GetGlyphRangesKorean(self: *FontAtlas) ?*const Wchar;
extern fn ImFontAtlas_GetGlyphRangesJapanese(self: *FontAtlas) ?*const Wchar;
extern fn ImFontAtlas_GetGlyphRangesChineseFull(self: *FontAtlas) ?*const Wchar;
extern fn ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon(self: *FontAtlas) ?*const Wchar;
extern fn ImFontAtlas_GetGlyphRangesCyrillic(self: *FontAtlas) ?*const Wchar;
extern fn ImFontAtlas_GetGlyphRangesThai(self: *FontAtlas) ?*const Wchar;
extern fn ImFontAtlas_GetGlyphRangesVietnamese(self: *FontAtlas) ?*const Wchar;
extern fn ImFontAtlas_AddCustomRectRegular(self: *FontAtlas, width: c_int, height: c_int) c_int;
extern fn ImFontAtlas_AddCustomRectFontGlyph(self: *FontAtlas, font: ?*Font, id: Wchar, width: c_int, height: c_int, advance_x: f32, offset: Vec2) c_int;
extern fn ImFontAtlas_GetCustomRectByIndex(self: *FontAtlas, index: c_int) ?*FontAtlasCustomRect;
extern fn ImFontAtlas_CalcCustomRectUV(self: *const FontAtlas, rect: ?*const FontAtlasCustomRect, out_uv_min: ?*Vec2, out_uv_max: ?*Vec2) void;
extern fn ImFontAtlas_GetMouseCursorTexData(self: *FontAtlas, cursor: MouseCursor, out_offset: ?*Vec2, out_size: ?*Vec2, out_uv_border: [2]Vec2, out_uv_fill: [2]Vec2) bool;
extern fn ImFont_FindGlyph(self: *const Font, c: Wchar) ?*const FontGlyph;
extern fn ImFont_FindGlyphNoFallback(self: *const Font, c: Wchar) ?*const FontGlyph;
extern fn ImFont_GetCharAdvance(self: *const Font, c: Wchar) f32;
extern fn ImFont_IsLoaded(self: *const Font) bool;
extern fn ImFont_GetDebugName(self: *const Font) ?[*:0]const u8;
extern fn ImFont_CalcTextSizeA(self: *const Font, size: f32, max_width: f32, wrap_width: f32, text_begin: ?[*:0]const u8) Vec2;
extern fn ImFont_CalcTextSizeAEx(self: *const Font, size: f32, max_width: f32, wrap_width: f32, text_begin: ?[*:0]const u8, text_end: ?[*:0]const u8, remaining: ?*?[*:0]const u8) Vec2;
extern fn ImFont_CalcWordWrapPositionA(self: *const Font, scale: f32, text: ?[*:0]const u8, text_end: ?[*:0]const u8, wrap_width: f32) ?[*:0]const u8;
extern fn ImFont_RenderChar(self: *const Font, draw_list: ?*DrawList, size: f32, pos: Vec2, col: U32, c: Wchar) void;
extern fn ImFont_RenderText(self: *const Font, draw_list: ?*DrawList, size: f32, pos: Vec2, col: U32, clip_rect: Vec4, text_begin: ?[*:0]const u8, text_end: ?[*:0]const u8, wrap_width: f32, cpu_fine_clip: bool) void;
extern fn ImFont_BuildLookupTable(self: *Font) void;
extern fn ImFont_ClearOutputData(self: *Font) void;
extern fn ImFont_GrowIndex(self: *Font, new_size: c_int) void;
extern fn ImFont_AddGlyph(self: *Font, src_cfg: ?*const FontConfig, c: Wchar, x0: f32, y0: f32, x1: f32, y1: f32, u0: f32, v0: f32, u1: f32, v1: f32, advance_x: f32) void;
extern fn ImFont_AddRemapChar(self: *Font, dst: Wchar, src: Wchar, overwrite_dst: bool) void;
extern fn ImFont_SetGlyphVisible(self: *Font, c: Wchar, visible: bool) void;
extern fn ImFont_IsGlyphRangeUnused(self: *Font, c_begin: c_uint, c_last: c_uint) bool;
extern fn ImGuiViewport_GetCenter(self: *const Viewport) Vec2;
extern fn ImGuiViewport_GetWorkCenter(self: *const Viewport) Vec2;
extern fn ImGui_ShowStackToolWindow(p_open: ?*bool) void;
extern fn ImGui_ListBoxObsolete(label: ?[*:0]const u8, current_item: ?*c_int, old_callback: ?*const fn (?*anyopaque, c_int, ?*?[*:0]const u8) callconv(.C) bool, user_data: ?*anyopaque, items_count: c_int) bool;
extern fn ImGui_ListBoxObsoleteEx(label: ?[*:0]const u8, current_item: ?*c_int, old_callback: ?*const fn (?*anyopaque, c_int, ?*?[*:0]const u8) callconv(.C) bool, user_data: ?*anyopaque, items_count: c_int, height_in_items: c_int) bool;
extern fn ImGui_ComboObsolete(label: ?[*:0]const u8, current_item: ?*c_int, old_callback: ?*const fn (?*anyopaque, c_int, ?*?[*:0]const u8) callconv(.C) bool, user_data: ?*anyopaque, items_count: c_int) bool;
extern fn ImGui_ComboObsoleteEx(label: ?[*:0]const u8, current_item: ?*c_int, old_callback: ?*const fn (?*anyopaque, c_int, ?*?[*:0]const u8) callconv(.C) bool, user_data: ?*anyopaque, items_count: c_int, popup_max_height_in_items: c_int) bool;
extern fn ImGui_SetItemAllowOverlap() void;
extern fn ImGui_PushAllowKeyboardFocus(tab_stop: bool) void;
extern fn ImGui_PopAllowKeyboardFocus() void;
extern fn ImGui_ImageButtonImTextureID(user_texture_id: TextureID, size: Vec2, uv0: Vec2, uv1: Vec2, frame_padding: c_int, bg_col: Vec4, tint_col: Vec4) bool;
extern fn ImGui_CaptureKeyboardFromApp(want_capture_keyboard: bool) void;
extern fn ImGui_CaptureMouseFromApp(want_capture_mouse: bool) void;
extern fn ImGui_CalcListClipping(items_count: c_int, items_height: f32, out_items_display_start: ?*c_int, out_items_display_end: ?*c_int) void;
pub const CreateContext = ImGui_CreateContext;
pub const DestroyContext = ImGui_DestroyContext;
pub const GetCurrentContext = ImGui_GetCurrentContext;
pub const SetCurrentContext = ImGui_SetCurrentContext;
pub const GetIO = ImGui_GetIO;
pub const GetStyle = ImGui_GetStyle;
pub const NewFrame = ImGui_NewFrame;
pub const EndFrame = ImGui_EndFrame;
pub const Render = ImGui_Render;
pub const GetDrawData = ImGui_GetDrawData;
pub const ShowDemoWindow = ImGui_ShowDemoWindow;
pub const ShowMetricsWindow = ImGui_ShowMetricsWindow;
pub const ShowDebugLogWindow = ImGui_ShowDebugLogWindow;
pub const ShowIDStackToolWindow = ImGui_ShowIDStackToolWindow;
pub const ShowIDStackToolWindowEx = ImGui_ShowIDStackToolWindowEx;
pub const ShowAboutWindow = ImGui_ShowAboutWindow;
pub const ShowStyleEditor = ImGui_ShowStyleEditor;
pub const ShowStyleSelector = ImGui_ShowStyleSelector;
pub const ShowFontSelector = ImGui_ShowFontSelector;
pub const ShowUserGuide = ImGui_ShowUserGuide;
pub const GetVersion = ImGui_GetVersion;
pub const StyleColorsDark = ImGui_StyleColorsDark;
pub const StyleColorsLight = ImGui_StyleColorsLight;
pub const StyleColorsClassic = ImGui_StyleColorsClassic;
pub const Begin = ImGui_Begin;
pub const End = ImGui_End;
pub const BeginChild = ImGui_BeginChild;
pub const BeginChildID = ImGui_BeginChildID;
pub const EndChild = ImGui_EndChild;
pub const IsWindowAppearing = ImGui_IsWindowAppearing;
pub const IsWindowCollapsed = ImGui_IsWindowCollapsed;
pub const IsWindowFocused = ImGui_IsWindowFocused;
pub const IsWindowHovered = ImGui_IsWindowHovered;
pub const GetWindowDrawList = ImGui_GetWindowDrawList;
pub const GetWindowPos = ImGui_GetWindowPos;
pub const GetWindowSize = ImGui_GetWindowSize;
pub const GetWindowWidth = ImGui_GetWindowWidth;
pub const GetWindowHeight = ImGui_GetWindowHeight;
pub const SetNextWindowPos = ImGui_SetNextWindowPos;
pub const SetNextWindowPosEx = ImGui_SetNextWindowPosEx;
pub const SetNextWindowSize = ImGui_SetNextWindowSize;
pub const SetNextWindowSizeConstraints = ImGui_SetNextWindowSizeConstraints;
pub const SetNextWindowContentSize = ImGui_SetNextWindowContentSize;
pub const SetNextWindowCollapsed = ImGui_SetNextWindowCollapsed;
pub const SetNextWindowFocus = ImGui_SetNextWindowFocus;
pub const SetNextWindowScroll = ImGui_SetNextWindowScroll;
pub const SetNextWindowBgAlpha = ImGui_SetNextWindowBgAlpha;
pub const SetWindowPos = ImGui_SetWindowPos;
pub const SetWindowSize = ImGui_SetWindowSize;
pub const SetWindowCollapsed = ImGui_SetWindowCollapsed;
pub const SetWindowFocus = ImGui_SetWindowFocus;
pub const SetWindowFontScale = ImGui_SetWindowFontScale;
pub const SetWindowPosStr = ImGui_SetWindowPosStr;
pub const SetWindowSizeStr = ImGui_SetWindowSizeStr;
pub const SetWindowCollapsedStr = ImGui_SetWindowCollapsedStr;
pub const SetWindowFocusStr = ImGui_SetWindowFocusStr;
pub const GetContentRegionAvail = ImGui_GetContentRegionAvail;
pub const GetContentRegionMax = ImGui_GetContentRegionMax;
pub const GetWindowContentRegionMin = ImGui_GetWindowContentRegionMin;
pub const GetWindowContentRegionMax = ImGui_GetWindowContentRegionMax;
pub const GetScrollX = ImGui_GetScrollX;
pub const GetScrollY = ImGui_GetScrollY;
pub const SetScrollX = ImGui_SetScrollX;
pub const SetScrollY = ImGui_SetScrollY;
pub const GetScrollMaxX = ImGui_GetScrollMaxX;
pub const GetScrollMaxY = ImGui_GetScrollMaxY;
pub const SetScrollHereX = ImGui_SetScrollHereX;
pub const SetScrollHereY = ImGui_SetScrollHereY;
pub const SetScrollFromPosX = ImGui_SetScrollFromPosX;
pub const SetScrollFromPosY = ImGui_SetScrollFromPosY;
pub const PushFont = ImGui_PushFont;
pub const PopFont = ImGui_PopFont;
pub const PushStyleColor = ImGui_PushStyleColor;
pub const PushStyleColorImVec4 = ImGui_PushStyleColorImVec4;
pub const PopStyleColor = ImGui_PopStyleColor;
pub const PopStyleColorEx = ImGui_PopStyleColorEx;
pub const PushStyleVar = ImGui_PushStyleVar;
pub const PushStyleVarImVec2 = ImGui_PushStyleVarImVec2;
pub const PopStyleVar = ImGui_PopStyleVar;
pub const PopStyleVarEx = ImGui_PopStyleVarEx;
pub const PushTabStop = ImGui_PushTabStop;
pub const PopTabStop = ImGui_PopTabStop;
pub const PushButtonRepeat = ImGui_PushButtonRepeat;
pub const PopButtonRepeat = ImGui_PopButtonRepeat;
pub const PushItemWidth = ImGui_PushItemWidth;
pub const PopItemWidth = ImGui_PopItemWidth;
pub const SetNextItemWidth = ImGui_SetNextItemWidth;
pub const CalcItemWidth = ImGui_CalcItemWidth;
pub const PushTextWrapPos = ImGui_PushTextWrapPos;
pub const PopTextWrapPos = ImGui_PopTextWrapPos;
pub const GetFont = ImGui_GetFont;
pub const GetFontSize = ImGui_GetFontSize;
pub const GetFontTexUvWhitePixel = ImGui_GetFontTexUvWhitePixel;
pub const GetColorU32 = ImGui_GetColorU32;
pub const GetColorU32Ex = ImGui_GetColorU32Ex;
pub const GetColorU32ImVec4 = ImGui_GetColorU32ImVec4;
pub const GetColorU32ImU32 = ImGui_GetColorU32ImU32;
pub const GetStyleColorVec4 = ImGui_GetStyleColorVec4;
pub const GetCursorScreenPos = ImGui_GetCursorScreenPos;
pub const SetCursorScreenPos = ImGui_SetCursorScreenPos;
pub const GetCursorPos = ImGui_GetCursorPos;
pub const GetCursorPosX = ImGui_GetCursorPosX;
pub const GetCursorPosY = ImGui_GetCursorPosY;
pub const SetCursorPos = ImGui_SetCursorPos;
pub const SetCursorPosX = ImGui_SetCursorPosX;
pub const SetCursorPosY = ImGui_SetCursorPosY;
pub const GetCursorStartPos = ImGui_GetCursorStartPos;
pub const Separator = ImGui_Separator;
pub const SameLine = ImGui_SameLine;
pub const SameLineEx = ImGui_SameLineEx;
pub const NewLine = ImGui_NewLine;
pub const Spacing = ImGui_Spacing;
pub const Dummy = ImGui_Dummy;
pub const Indent = ImGui_Indent;
pub const IndentEx = ImGui_IndentEx;
pub const Unindent = ImGui_Unindent;
pub const UnindentEx = ImGui_UnindentEx;
pub const BeginGroup = ImGui_BeginGroup;
pub const EndGroup = ImGui_EndGroup;
pub const AlignTextToFramePadding = ImGui_AlignTextToFramePadding;
pub const GetTextLineHeight = ImGui_GetTextLineHeight;
pub const GetTextLineHeightWithSpacing = ImGui_GetTextLineHeightWithSpacing;
pub const GetFrameHeight = ImGui_GetFrameHeight;
pub const GetFrameHeightWithSpacing = ImGui_GetFrameHeightWithSpacing;
pub const PushID = ImGui_PushID;
pub const PushIDStr = ImGui_PushIDStr;
pub const PushIDPtr = ImGui_PushIDPtr;
pub const PushIDInt = ImGui_PushIDInt;
pub const PopID = ImGui_PopID;
pub const GetID = ImGui_GetID;
pub const GetIDStr = ImGui_GetIDStr;
pub const GetIDPtr = ImGui_GetIDPtr;
pub const TextUnformatted = ImGui_TextUnformatted;
pub const TextUnformattedEx = ImGui_TextUnformattedEx;
pub const Text = ImGui_Text;
pub const TextV = ImGui_TextV;
pub const TextColored = ImGui_TextColored;
pub const TextColoredUnformatted = ImGui_TextColoredUnformatted;
pub const TextColoredV = ImGui_TextColoredV;
pub const TextDisabled = ImGui_TextDisabled;
pub const TextDisabledUnformatted = ImGui_TextDisabledUnformatted;
pub const TextDisabledV = ImGui_TextDisabledV;
pub const TextWrapped = ImGui_TextWrapped;
pub const TextWrappedUnformatted = ImGui_TextWrappedUnformatted;
pub const TextWrappedV = ImGui_TextWrappedV;
pub const LabelText = ImGui_LabelText;
pub const LabelTextUnformatted = ImGui_LabelTextUnformatted;
pub const LabelTextV = ImGui_LabelTextV;
pub const BulletText = ImGui_BulletText;
pub const BulletTextUnformatted = ImGui_BulletTextUnformatted;
pub const BulletTextV = ImGui_BulletTextV;
pub const SeparatorText = ImGui_SeparatorText;
pub const Button = ImGui_Button;
pub const ButtonEx = ImGui_ButtonEx;
pub const SmallButton = ImGui_SmallButton;
pub const InvisibleButton = ImGui_InvisibleButton;
pub const ArrowButton = ImGui_ArrowButton;
pub const Checkbox = ImGui_Checkbox;
pub const CheckboxFlagsIntPtr = ImGui_CheckboxFlagsIntPtr;
pub const CheckboxFlagsUintPtr = ImGui_CheckboxFlagsUintPtr;
pub const RadioButton = ImGui_RadioButton;
pub const RadioButtonIntPtr = ImGui_RadioButtonIntPtr;
pub const ProgressBar = ImGui_ProgressBar;
pub const Bullet = ImGui_Bullet;
pub const Image = ImGui_Image;
pub const ImageEx = ImGui_ImageEx;
pub const ImageButton = ImGui_ImageButton;
pub const ImageButtonEx = ImGui_ImageButtonEx;
pub const BeginCombo = ImGui_BeginCombo;
pub const EndCombo = ImGui_EndCombo;
pub const ComboChar = ImGui_ComboChar;
pub const ComboCharEx = ImGui_ComboCharEx;
pub const Combo = ImGui_Combo;
pub const ComboEx = ImGui_ComboEx;
pub const ComboCallback = ImGui_ComboCallback;
pub const ComboCallbackEx = ImGui_ComboCallbackEx;
pub const DragFloat = ImGui_DragFloat;
pub const DragFloatEx = ImGui_DragFloatEx;
pub const DragFloat2 = ImGui_DragFloat2;
pub const DragFloat2Ex = ImGui_DragFloat2Ex;
pub const DragFloat3 = ImGui_DragFloat3;
pub const DragFloat3Ex = ImGui_DragFloat3Ex;
pub const DragFloat4 = ImGui_DragFloat4;
pub const DragFloat4Ex = ImGui_DragFloat4Ex;
pub const DragFloatRange2 = ImGui_DragFloatRange2;
pub const DragFloatRange2Ex = ImGui_DragFloatRange2Ex;
pub const DragInt = ImGui_DragInt;
pub const DragIntEx = ImGui_DragIntEx;
pub const DragInt2 = ImGui_DragInt2;
pub const DragInt2Ex = ImGui_DragInt2Ex;
pub const DragInt3 = ImGui_DragInt3;
pub const DragInt3Ex = ImGui_DragInt3Ex;
pub const DragInt4 = ImGui_DragInt4;
pub const DragInt4Ex = ImGui_DragInt4Ex;
pub const DragIntRange2 = ImGui_DragIntRange2;
pub const DragIntRange2Ex = ImGui_DragIntRange2Ex;
pub const DragScalar = ImGui_DragScalar;
pub const DragScalarEx = ImGui_DragScalarEx;
pub const DragScalarN = ImGui_DragScalarN;
pub const DragScalarNEx = ImGui_DragScalarNEx;
pub const SliderFloat = ImGui_SliderFloat;
pub const SliderFloatEx = ImGui_SliderFloatEx;
pub const SliderFloat2 = ImGui_SliderFloat2;
pub const SliderFloat2Ex = ImGui_SliderFloat2Ex;
pub const SliderFloat3 = ImGui_SliderFloat3;
pub const SliderFloat3Ex = ImGui_SliderFloat3Ex;
pub const SliderFloat4 = ImGui_SliderFloat4;
pub const SliderFloat4Ex = ImGui_SliderFloat4Ex;
pub const SliderAngle = ImGui_SliderAngle;
pub const SliderAngleEx = ImGui_SliderAngleEx;
pub const SliderInt = ImGui_SliderInt;
pub const SliderIntEx = ImGui_SliderIntEx;
pub const SliderInt2 = ImGui_SliderInt2;
pub const SliderInt2Ex = ImGui_SliderInt2Ex;
pub const SliderInt3 = ImGui_SliderInt3;
pub const SliderInt3Ex = ImGui_SliderInt3Ex;
pub const SliderInt4 = ImGui_SliderInt4;
pub const SliderInt4Ex = ImGui_SliderInt4Ex;
pub const SliderScalar = ImGui_SliderScalar;
pub const SliderScalarEx = ImGui_SliderScalarEx;
pub const SliderScalarN = ImGui_SliderScalarN;
pub const SliderScalarNEx = ImGui_SliderScalarNEx;
pub const VSliderFloat = ImGui_VSliderFloat;
pub const VSliderFloatEx = ImGui_VSliderFloatEx;
pub const VSliderInt = ImGui_VSliderInt;
pub const VSliderIntEx = ImGui_VSliderIntEx;
pub const VSliderScalar = ImGui_VSliderScalar;
pub const VSliderScalarEx = ImGui_VSliderScalarEx;
pub const InputText = ImGui_InputText;
pub const InputTextEx = ImGui_InputTextEx;
pub const InputTextMultiline = ImGui_InputTextMultiline;
pub const InputTextMultilineEx = ImGui_InputTextMultilineEx;
pub const InputTextWithHint = ImGui_InputTextWithHint;
pub const InputTextWithHintEx = ImGui_InputTextWithHintEx;
pub const InputFloat = ImGui_InputFloat;
pub const InputFloatEx = ImGui_InputFloatEx;
pub const InputFloat2 = ImGui_InputFloat2;
pub const InputFloat2Ex = ImGui_InputFloat2Ex;
pub const InputFloat3 = ImGui_InputFloat3;
pub const InputFloat3Ex = ImGui_InputFloat3Ex;
pub const InputFloat4 = ImGui_InputFloat4;
pub const InputFloat4Ex = ImGui_InputFloat4Ex;
pub const InputInt = ImGui_InputInt;
pub const InputIntEx = ImGui_InputIntEx;
pub const InputInt2 = ImGui_InputInt2;
pub const InputInt3 = ImGui_InputInt3;
pub const InputInt4 = ImGui_InputInt4;
pub const InputDouble = ImGui_InputDouble;
pub const InputDoubleEx = ImGui_InputDoubleEx;
pub const InputScalar = ImGui_InputScalar;
pub const InputScalarEx = ImGui_InputScalarEx;
pub const InputScalarN = ImGui_InputScalarN;
pub const InputScalarNEx = ImGui_InputScalarNEx;
pub const ColorEdit3 = ImGui_ColorEdit3;
pub const ColorEdit4 = ImGui_ColorEdit4;
pub const ColorPicker3 = ImGui_ColorPicker3;
pub const ColorPicker4 = ImGui_ColorPicker4;
pub const ColorButton = ImGui_ColorButton;
pub const ColorButtonEx = ImGui_ColorButtonEx;
pub const SetColorEditOptions = ImGui_SetColorEditOptions;
pub const TreeNode = ImGui_TreeNode;
pub const TreeNodeStr = ImGui_TreeNodeStr;
pub const TreeNodeStrUnformatted = ImGui_TreeNodeStrUnformatted;
pub const TreeNodePtr = ImGui_TreeNodePtr;
pub const TreeNodePtrUnformatted = ImGui_TreeNodePtrUnformatted;
pub const TreeNodeV = ImGui_TreeNodeV;
pub const TreeNodeVPtr = ImGui_TreeNodeVPtr;
pub const TreeNodeEx = ImGui_TreeNodeEx;
pub const TreeNodeExStr = ImGui_TreeNodeExStr;
pub const TreeNodeExStrUnformatted = ImGui_TreeNodeExStrUnformatted;
pub const TreeNodeExPtr = ImGui_TreeNodeExPtr;
pub const TreeNodeExPtrUnformatted = ImGui_TreeNodeExPtrUnformatted;
pub const TreeNodeExV = ImGui_TreeNodeExV;
pub const TreeNodeExVPtr = ImGui_TreeNodeExVPtr;
pub const TreePush = ImGui_TreePush;
pub const TreePushPtr = ImGui_TreePushPtr;
pub const TreePop = ImGui_TreePop;
pub const GetTreeNodeToLabelSpacing = ImGui_GetTreeNodeToLabelSpacing;
pub const CollapsingHeader = ImGui_CollapsingHeader;
pub const CollapsingHeaderBoolPtr = ImGui_CollapsingHeaderBoolPtr;
pub const SetNextItemOpen = ImGui_SetNextItemOpen;
pub const Selectable = ImGui_Selectable;
pub const SelectableEx = ImGui_SelectableEx;
pub const SelectableBoolPtr = ImGui_SelectableBoolPtr;
pub const SelectableBoolPtrEx = ImGui_SelectableBoolPtrEx;
pub const BeginListBox = ImGui_BeginListBox;
pub const EndListBox = ImGui_EndListBox;
pub const ListBox = ImGui_ListBox;
pub const ListBoxCallback = ImGui_ListBoxCallback;
pub const ListBoxCallbackEx = ImGui_ListBoxCallbackEx;
pub const PlotLines = ImGui_PlotLines;
pub const PlotLinesEx = ImGui_PlotLinesEx;
pub const PlotLinesCallback = ImGui_PlotLinesCallback;
pub const PlotLinesCallbackEx = ImGui_PlotLinesCallbackEx;
pub const PlotHistogram = ImGui_PlotHistogram;
pub const PlotHistogramEx = ImGui_PlotHistogramEx;
pub const PlotHistogramCallback = ImGui_PlotHistogramCallback;
pub const PlotHistogramCallbackEx = ImGui_PlotHistogramCallbackEx;
pub const BeginMenuBar = ImGui_BeginMenuBar;
pub const EndMenuBar = ImGui_EndMenuBar;
pub const BeginMainMenuBar = ImGui_BeginMainMenuBar;
pub const EndMainMenuBar = ImGui_EndMainMenuBar;
pub const BeginMenu = ImGui_BeginMenu;
pub const BeginMenuEx = ImGui_BeginMenuEx;
pub const EndMenu = ImGui_EndMenu;
pub const MenuItem = ImGui_MenuItem;
pub const MenuItemEx = ImGui_MenuItemEx;
pub const MenuItemBoolPtr = ImGui_MenuItemBoolPtr;
pub const BeginTooltip = ImGui_BeginTooltip;
pub const EndTooltip = ImGui_EndTooltip;
pub const SetTooltip = ImGui_SetTooltip;
pub const SetTooltipUnformatted = ImGui_SetTooltipUnformatted;
pub const SetTooltipV = ImGui_SetTooltipV;
pub const BeginItemTooltip = ImGui_BeginItemTooltip;
pub const SetItemTooltip = ImGui_SetItemTooltip;
pub const SetItemTooltipUnformatted = ImGui_SetItemTooltipUnformatted;
pub const SetItemTooltipV = ImGui_SetItemTooltipV;
pub const BeginPopup = ImGui_BeginPopup;
pub const BeginPopupModal = ImGui_BeginPopupModal;
pub const EndPopup = ImGui_EndPopup;
pub const OpenPopup = ImGui_OpenPopup;
pub const OpenPopupID = ImGui_OpenPopupID;
pub const OpenPopupOnItemClick = ImGui_OpenPopupOnItemClick;
pub const CloseCurrentPopup = ImGui_CloseCurrentPopup;
pub const BeginPopupContextItem = ImGui_BeginPopupContextItem;
pub const BeginPopupContextItemEx = ImGui_BeginPopupContextItemEx;
pub const BeginPopupContextWindow = ImGui_BeginPopupContextWindow;
pub const BeginPopupContextWindowEx = ImGui_BeginPopupContextWindowEx;
pub const BeginPopupContextVoid = ImGui_BeginPopupContextVoid;
pub const BeginPopupContextVoidEx = ImGui_BeginPopupContextVoidEx;
pub const IsPopupOpen = ImGui_IsPopupOpen;
pub const BeginTable = ImGui_BeginTable;
pub const BeginTableEx = ImGui_BeginTableEx;
pub const EndTable = ImGui_EndTable;
pub const TableNextRow = ImGui_TableNextRow;
pub const TableNextRowEx = ImGui_TableNextRowEx;
pub const TableNextColumn = ImGui_TableNextColumn;
pub const TableSetColumnIndex = ImGui_TableSetColumnIndex;
pub const TableSetupColumn = ImGui_TableSetupColumn;
pub const TableSetupColumnEx = ImGui_TableSetupColumnEx;
pub const TableSetupScrollFreeze = ImGui_TableSetupScrollFreeze;
pub const TableHeader = ImGui_TableHeader;
pub const TableHeadersRow = ImGui_TableHeadersRow;
pub const TableAngledHeadersRow = ImGui_TableAngledHeadersRow;
pub const TableGetSortSpecs = ImGui_TableGetSortSpecs;
pub const TableGetColumnCount = ImGui_TableGetColumnCount;
pub const TableGetColumnIndex = ImGui_TableGetColumnIndex;
pub const TableGetRowIndex = ImGui_TableGetRowIndex;
pub const TableGetColumnName = ImGui_TableGetColumnName;
pub const TableGetColumnFlags = ImGui_TableGetColumnFlags;
pub const TableSetColumnEnabled = ImGui_TableSetColumnEnabled;
pub const TableSetBgColor = ImGui_TableSetBgColor;
pub const Columns = ImGui_Columns;
pub const ColumnsEx = ImGui_ColumnsEx;
pub const NextColumn = ImGui_NextColumn;
pub const GetColumnIndex = ImGui_GetColumnIndex;
pub const GetColumnWidth = ImGui_GetColumnWidth;
pub const SetColumnWidth = ImGui_SetColumnWidth;
pub const GetColumnOffset = ImGui_GetColumnOffset;
pub const SetColumnOffset = ImGui_SetColumnOffset;
pub const GetColumnsCount = ImGui_GetColumnsCount;
pub const BeginTabBar = ImGui_BeginTabBar;
pub const EndTabBar = ImGui_EndTabBar;
pub const BeginTabItem = ImGui_BeginTabItem;
pub const EndTabItem = ImGui_EndTabItem;
pub const TabItemButton = ImGui_TabItemButton;
pub const SetTabItemClosed = ImGui_SetTabItemClosed;
pub const LogToTTY = ImGui_LogToTTY;
pub const LogToFile = ImGui_LogToFile;
pub const LogToClipboard = ImGui_LogToClipboard;
pub const LogFinish = ImGui_LogFinish;
pub const LogButtons = ImGui_LogButtons;
pub const LogText = ImGui_LogText;
pub const LogTextUnformatted = ImGui_LogTextUnformatted;
pub const LogTextV = ImGui_LogTextV;
pub const BeginDragDropSource = ImGui_BeginDragDropSource;
pub const SetDragDropPayload = ImGui_SetDragDropPayload;
pub const EndDragDropSource = ImGui_EndDragDropSource;
pub const BeginDragDropTarget = ImGui_BeginDragDropTarget;
pub const AcceptDragDropPayload = ImGui_AcceptDragDropPayload;
pub const EndDragDropTarget = ImGui_EndDragDropTarget;
pub const GetDragDropPayload = ImGui_GetDragDropPayload;
pub const BeginDisabled = ImGui_BeginDisabled;
pub const EndDisabled = ImGui_EndDisabled;
pub const PushClipRect = ImGui_PushClipRect;
pub const PopClipRect = ImGui_PopClipRect;
pub const SetItemDefaultFocus = ImGui_SetItemDefaultFocus;
pub const SetKeyboardFocusHere = ImGui_SetKeyboardFocusHere;
pub const SetKeyboardFocusHereEx = ImGui_SetKeyboardFocusHereEx;
pub const SetNextItemAllowOverlap = ImGui_SetNextItemAllowOverlap;
pub const IsItemHovered = ImGui_IsItemHovered;
pub const IsItemActive = ImGui_IsItemActive;
pub const IsItemFocused = ImGui_IsItemFocused;
pub const IsItemClicked = ImGui_IsItemClicked;
pub const IsItemClickedEx = ImGui_IsItemClickedEx;
pub const IsItemVisible = ImGui_IsItemVisible;
pub const IsItemEdited = ImGui_IsItemEdited;
pub const IsItemActivated = ImGui_IsItemActivated;
pub const IsItemDeactivated = ImGui_IsItemDeactivated;
pub const IsItemDeactivatedAfterEdit = ImGui_IsItemDeactivatedAfterEdit;
pub const IsItemToggledOpen = ImGui_IsItemToggledOpen;
pub const IsAnyItemHovered = ImGui_IsAnyItemHovered;
pub const IsAnyItemActive = ImGui_IsAnyItemActive;
pub const IsAnyItemFocused = ImGui_IsAnyItemFocused;
pub const GetItemID = ImGui_GetItemID;
pub const GetItemRectMin = ImGui_GetItemRectMin;
pub const GetItemRectMax = ImGui_GetItemRectMax;
pub const GetItemRectSize = ImGui_GetItemRectSize;
pub const GetMainViewport = ImGui_GetMainViewport;
pub const GetBackgroundDrawList = ImGui_GetBackgroundDrawList;
pub const GetForegroundDrawList = ImGui_GetForegroundDrawList;
pub const IsRectVisibleBySize = ImGui_IsRectVisibleBySize;
pub const IsRectVisible = ImGui_IsRectVisible;
pub const GetTime = ImGui_GetTime;
pub const GetFrameCount = ImGui_GetFrameCount;
pub const GetDrawListSharedData = ImGui_GetDrawListSharedData;
pub const GetStyleColorName = ImGui_GetStyleColorName;
pub const SetStateStorage = ImGui_SetStateStorage;
pub const GetStateStorage = ImGui_GetStateStorage;
pub const BeginChildFrame = ImGui_BeginChildFrame;
pub const EndChildFrame = ImGui_EndChildFrame;
pub const CalcTextSize = ImGui_CalcTextSize;
pub const CalcTextSizeEx = ImGui_CalcTextSizeEx;
pub const ColorConvertU32ToFloat4 = ImGui_ColorConvertU32ToFloat4;
pub const ColorConvertFloat4ToU32 = ImGui_ColorConvertFloat4ToU32;
pub const ColorConvertRGBtoHSV = ImGui_ColorConvertRGBtoHSV;
pub const ColorConvertHSVtoRGB = ImGui_ColorConvertHSVtoRGB;
pub const IsKeyDown = ImGui_IsKeyDown;
pub const IsKeyPressed = ImGui_IsKeyPressed;
pub const IsKeyPressedEx = ImGui_IsKeyPressedEx;
pub const IsKeyReleased = ImGui_IsKeyReleased;
pub const GetKeyPressedAmount = ImGui_GetKeyPressedAmount;
pub const GetKeyName = ImGui_GetKeyName;
pub const SetNextFrameWantCaptureKeyboard = ImGui_SetNextFrameWantCaptureKeyboard;
pub const IsMouseDown = ImGui_IsMouseDown;
pub const IsMouseClicked = ImGui_IsMouseClicked;
pub const IsMouseClickedEx = ImGui_IsMouseClickedEx;
pub const IsMouseReleased = ImGui_IsMouseReleased;
pub const IsMouseDoubleClicked = ImGui_IsMouseDoubleClicked;
pub const GetMouseClickedCount = ImGui_GetMouseClickedCount;
pub const IsMouseHoveringRect = ImGui_IsMouseHoveringRect;
pub const IsMouseHoveringRectEx = ImGui_IsMouseHoveringRectEx;
pub const IsMousePosValid = ImGui_IsMousePosValid;
pub const IsAnyMouseDown = ImGui_IsAnyMouseDown;
pub const GetMousePos = ImGui_GetMousePos;
pub const GetMousePosOnOpeningCurrentPopup = ImGui_GetMousePosOnOpeningCurrentPopup;
pub const IsMouseDragging = ImGui_IsMouseDragging;
pub const GetMouseDragDelta = ImGui_GetMouseDragDelta;
pub const ResetMouseDragDelta = ImGui_ResetMouseDragDelta;
pub const ResetMouseDragDeltaEx = ImGui_ResetMouseDragDeltaEx;
pub const GetMouseCursor = ImGui_GetMouseCursor;
pub const SetMouseCursor = ImGui_SetMouseCursor;
pub const SetNextFrameWantCaptureMouse = ImGui_SetNextFrameWantCaptureMouse;
pub const GetClipboardText = ImGui_GetClipboardText;
pub const SetClipboardText = ImGui_SetClipboardText;
pub const LoadIniSettingsFromDisk = ImGui_LoadIniSettingsFromDisk;
pub const LoadIniSettingsFromMemory = ImGui_LoadIniSettingsFromMemory;
pub const SaveIniSettingsToDisk = ImGui_SaveIniSettingsToDisk;
pub const SaveIniSettingsToMemory = ImGui_SaveIniSettingsToMemory;
pub const DebugTextEncoding = ImGui_DebugTextEncoding;
pub const DebugCheckVersionAndDataLayout = ImGui_DebugCheckVersionAndDataLayout;
pub const SetAllocatorFunctions = ImGui_SetAllocatorFunctions;
pub const GetAllocatorFunctions = ImGui_GetAllocatorFunctions;
pub const MemAlloc = ImGui_MemAlloc;
pub const MemFree = ImGui_MemFree;
pub const Vector_Construct = ImVector_Construct;
pub const Vector_Destruct = ImVector_Destruct;
pub const Style_ScaleAllSizes = ImGuiStyle_ScaleAllSizes;
pub const IO_AddKeyEvent = ImGuiIO_AddKeyEvent;
pub const IO_AddKeyAnalogEvent = ImGuiIO_AddKeyAnalogEvent;
pub const IO_AddMousePosEvent = ImGuiIO_AddMousePosEvent;
pub const IO_AddMouseButtonEvent = ImGuiIO_AddMouseButtonEvent;
pub const IO_AddMouseWheelEvent = ImGuiIO_AddMouseWheelEvent;
pub const IO_AddMouseSourceEvent = ImGuiIO_AddMouseSourceEvent;
pub const IO_AddFocusEvent = ImGuiIO_AddFocusEvent;
pub const IO_AddInputCharacter = ImGuiIO_AddInputCharacter;
pub const IO_AddInputCharacterUTF16 = ImGuiIO_AddInputCharacterUTF16;
pub const IO_AddInputCharactersUTF8 = ImGuiIO_AddInputCharactersUTF8;
pub const IO_SetKeyEventNativeData = ImGuiIO_SetKeyEventNativeData;
pub const IO_SetKeyEventNativeDataEx = ImGuiIO_SetKeyEventNativeDataEx;
pub const IO_SetAppAcceptingEvents = ImGuiIO_SetAppAcceptingEvents;
pub const IO_ClearEventsQueue = ImGuiIO_ClearEventsQueue;
pub const IO_ClearInputKeys = ImGuiIO_ClearInputKeys;
pub const IO_ClearInputCharacters = ImGuiIO_ClearInputCharacters;
pub const InputTextCallbackData_DeleteChars = ImGuiInputTextCallbackData_DeleteChars;
pub const InputTextCallbackData_InsertChars = ImGuiInputTextCallbackData_InsertChars;
pub const InputTextCallbackData_SelectAll = ImGuiInputTextCallbackData_SelectAll;
pub const InputTextCallbackData_ClearSelection = ImGuiInputTextCallbackData_ClearSelection;
pub const InputTextCallbackData_HasSelection = ImGuiInputTextCallbackData_HasSelection;
pub const Payload_Clear = ImGuiPayload_Clear;
pub const Payload_IsDataType = ImGuiPayload_IsDataType;
pub const Payload_IsPreview = ImGuiPayload_IsPreview;
pub const Payload_IsDelivery = ImGuiPayload_IsDelivery;
pub const TextFilter_ImGuiTextRange_empty = ImGuiTextFilter_ImGuiTextRange_empty;
pub const TextFilter_ImGuiTextRange_split = ImGuiTextFilter_ImGuiTextRange_split;
pub const TextFilter_Draw = ImGuiTextFilter_Draw;
pub const TextFilter_PassFilter = ImGuiTextFilter_PassFilter;
pub const TextFilter_Build = ImGuiTextFilter_Build;
pub const TextFilter_Clear = ImGuiTextFilter_Clear;
pub const TextFilter_IsActive = ImGuiTextFilter_IsActive;
pub const TextBuffer_begin = ImGuiTextBuffer_begin;
pub const TextBuffer_end = ImGuiTextBuffer_end;
pub const TextBuffer_size = ImGuiTextBuffer_size;
pub const TextBuffer_empty = ImGuiTextBuffer_empty;
pub const TextBuffer_clear = ImGuiTextBuffer_clear;
pub const TextBuffer_reserve = ImGuiTextBuffer_reserve;
pub const TextBuffer_c_str = ImGuiTextBuffer_c_str;
pub const TextBuffer_append = ImGuiTextBuffer_append;
pub const TextBuffer_appendf = ImGuiTextBuffer_appendf;
pub const TextBuffer_appendfv = ImGuiTextBuffer_appendfv;
pub const Storage_Clear = ImGuiStorage_Clear;
pub const Storage_GetInt = ImGuiStorage_GetInt;
pub const Storage_SetInt = ImGuiStorage_SetInt;
pub const Storage_GetBool = ImGuiStorage_GetBool;
pub const Storage_SetBool = ImGuiStorage_SetBool;
pub const Storage_GetFloat = ImGuiStorage_GetFloat;
pub const Storage_SetFloat = ImGuiStorage_SetFloat;
pub const Storage_GetVoidPtr = ImGuiStorage_GetVoidPtr;
pub const Storage_SetVoidPtr = ImGuiStorage_SetVoidPtr;
pub const Storage_GetIntRef = ImGuiStorage_GetIntRef;
pub const Storage_GetBoolRef = ImGuiStorage_GetBoolRef;
pub const Storage_GetFloatRef = ImGuiStorage_GetFloatRef;
pub const Storage_GetVoidPtrRef = ImGuiStorage_GetVoidPtrRef;
pub const Storage_SetAllInt = ImGuiStorage_SetAllInt;
pub const Storage_BuildSortByKey = ImGuiStorage_BuildSortByKey;
pub const ListClipper_Begin = ImGuiListClipper_Begin;
pub const ListClipper_End = ImGuiListClipper_End;
pub const ListClipper_Step = ImGuiListClipper_Step;
pub const ListClipper_IncludeItemByIndex = ImGuiListClipper_IncludeItemByIndex;
pub const ListClipper_IncludeItemsByIndex = ImGuiListClipper_IncludeItemsByIndex;
pub const ListClipper_IncludeRangeByIndices = ImGuiListClipper_IncludeRangeByIndices;
pub const ListClipper_ForceDisplayRangeByIndices = ImGuiListClipper_ForceDisplayRangeByIndices;
pub const Color_SetHSV = ImColor_SetHSV;
pub const Color_HSV = ImColor_HSV;
pub const DrawCmd_GetTexID = ImDrawCmd_GetTexID;
pub const DrawListSplitter_Clear = ImDrawListSplitter_Clear;
pub const DrawListSplitter_ClearFreeMemory = ImDrawListSplitter_ClearFreeMemory;
pub const DrawListSplitter_Split = ImDrawListSplitter_Split;
pub const DrawListSplitter_Merge = ImDrawListSplitter_Merge;
pub const DrawListSplitter_SetCurrentChannel = ImDrawListSplitter_SetCurrentChannel;
pub const DrawList_PushClipRect = ImDrawList_PushClipRect;
pub const DrawList_PushClipRectFullScreen = ImDrawList_PushClipRectFullScreen;
pub const DrawList_PopClipRect = ImDrawList_PopClipRect;
pub const DrawList_PushTextureID = ImDrawList_PushTextureID;
pub const DrawList_PopTextureID = ImDrawList_PopTextureID;
pub const DrawList_GetClipRectMin = ImDrawList_GetClipRectMin;
pub const DrawList_GetClipRectMax = ImDrawList_GetClipRectMax;
pub const DrawList_AddLine = ImDrawList_AddLine;
pub const DrawList_AddLineEx = ImDrawList_AddLineEx;
pub const DrawList_AddRect = ImDrawList_AddRect;
pub const DrawList_AddRectEx = ImDrawList_AddRectEx;
pub const DrawList_AddRectFilled = ImDrawList_AddRectFilled;
pub const DrawList_AddRectFilledEx = ImDrawList_AddRectFilledEx;
pub const DrawList_AddRectFilledMultiColor = ImDrawList_AddRectFilledMultiColor;
pub const DrawList_AddQuad = ImDrawList_AddQuad;
pub const DrawList_AddQuadEx = ImDrawList_AddQuadEx;
pub const DrawList_AddQuadFilled = ImDrawList_AddQuadFilled;
pub const DrawList_AddTriangle = ImDrawList_AddTriangle;
pub const DrawList_AddTriangleEx = ImDrawList_AddTriangleEx;
pub const DrawList_AddTriangleFilled = ImDrawList_AddTriangleFilled;
pub const DrawList_AddCircle = ImDrawList_AddCircle;
pub const DrawList_AddCircleEx = ImDrawList_AddCircleEx;
pub const DrawList_AddCircleFilled = ImDrawList_AddCircleFilled;
pub const DrawList_AddNgon = ImDrawList_AddNgon;
pub const DrawList_AddNgonEx = ImDrawList_AddNgonEx;
pub const DrawList_AddNgonFilled = ImDrawList_AddNgonFilled;
pub const DrawList_AddEllipse = ImDrawList_AddEllipse;
pub const DrawList_AddEllipseEx = ImDrawList_AddEllipseEx;
pub const DrawList_AddEllipseFilled = ImDrawList_AddEllipseFilled;
pub const DrawList_AddEllipseFilledEx = ImDrawList_AddEllipseFilledEx;
pub const DrawList_AddText = ImDrawList_AddText;
pub const DrawList_AddTextEx = ImDrawList_AddTextEx;
pub const DrawList_AddTextImFontPtr = ImDrawList_AddTextImFontPtr;
pub const DrawList_AddTextImFontPtrEx = ImDrawList_AddTextImFontPtrEx;
pub const DrawList_AddPolyline = ImDrawList_AddPolyline;
pub const DrawList_AddConvexPolyFilled = ImDrawList_AddConvexPolyFilled;
pub const DrawList_AddBezierCubic = ImDrawList_AddBezierCubic;
pub const DrawList_AddBezierQuadratic = ImDrawList_AddBezierQuadratic;
pub const DrawList_AddImage = ImDrawList_AddImage;
pub const DrawList_AddImageEx = ImDrawList_AddImageEx;
pub const DrawList_AddImageQuad = ImDrawList_AddImageQuad;
pub const DrawList_AddImageQuadEx = ImDrawList_AddImageQuadEx;
pub const DrawList_AddImageRounded = ImDrawList_AddImageRounded;
pub const DrawList_PathClear = ImDrawList_PathClear;
pub const DrawList_PathLineTo = ImDrawList_PathLineTo;
pub const DrawList_PathLineToMergeDuplicate = ImDrawList_PathLineToMergeDuplicate;
pub const DrawList_PathFillConvex = ImDrawList_PathFillConvex;
pub const DrawList_PathStroke = ImDrawList_PathStroke;
pub const DrawList_PathArcTo = ImDrawList_PathArcTo;
pub const DrawList_PathArcToFast = ImDrawList_PathArcToFast;
pub const DrawList_PathEllipticalArcTo = ImDrawList_PathEllipticalArcTo;
pub const DrawList_PathEllipticalArcToEx = ImDrawList_PathEllipticalArcToEx;
pub const DrawList_PathBezierCubicCurveTo = ImDrawList_PathBezierCubicCurveTo;
pub const DrawList_PathBezierQuadraticCurveTo = ImDrawList_PathBezierQuadraticCurveTo;
pub const DrawList_PathRect = ImDrawList_PathRect;
pub const DrawList_AddCallback = ImDrawList_AddCallback;
pub const DrawList_AddDrawCmd = ImDrawList_AddDrawCmd;
pub const DrawList_CloneOutput = ImDrawList_CloneOutput;
pub const DrawList_ChannelsSplit = ImDrawList_ChannelsSplit;
pub const DrawList_ChannelsMerge = ImDrawList_ChannelsMerge;
pub const DrawList_ChannelsSetCurrent = ImDrawList_ChannelsSetCurrent;
pub const DrawList_PrimReserve = ImDrawList_PrimReserve;
pub const DrawList_PrimUnreserve = ImDrawList_PrimUnreserve;
pub const DrawList_PrimRect = ImDrawList_PrimRect;
pub const DrawList_PrimRectUV = ImDrawList_PrimRectUV;
pub const DrawList_PrimQuadUV = ImDrawList_PrimQuadUV;
pub const DrawList_PrimWriteVtx = ImDrawList_PrimWriteVtx;
pub const DrawList_PrimWriteIdx = ImDrawList_PrimWriteIdx;
pub const DrawList_PrimVtx = ImDrawList_PrimVtx;
pub const DrawList__ResetForNewFrame = ImDrawList__ResetForNewFrame;
pub const DrawList__ClearFreeMemory = ImDrawList__ClearFreeMemory;
pub const DrawList__PopUnusedDrawCmd = ImDrawList__PopUnusedDrawCmd;
pub const DrawList__TryMergeDrawCmds = ImDrawList__TryMergeDrawCmds;
pub const DrawList__OnChangedClipRect = ImDrawList__OnChangedClipRect;
pub const DrawList__OnChangedTextureID = ImDrawList__OnChangedTextureID;
pub const DrawList__OnChangedVtxOffset = ImDrawList__OnChangedVtxOffset;
pub const DrawList__CalcCircleAutoSegmentCount = ImDrawList__CalcCircleAutoSegmentCount;
pub const DrawList__PathArcToFastEx = ImDrawList__PathArcToFastEx;
pub const DrawList__PathArcToN = ImDrawList__PathArcToN;
pub const DrawData_Clear = ImDrawData_Clear;
pub const DrawData_AddDrawList = ImDrawData_AddDrawList;
pub const DrawData_DeIndexAllBuffers = ImDrawData_DeIndexAllBuffers;
pub const DrawData_ScaleClipRects = ImDrawData_ScaleClipRects;
pub const FontGlyphRangesBuilder_Clear = ImFontGlyphRangesBuilder_Clear;
pub const FontGlyphRangesBuilder_GetBit = ImFontGlyphRangesBuilder_GetBit;
pub const FontGlyphRangesBuilder_SetBit = ImFontGlyphRangesBuilder_SetBit;
pub const FontGlyphRangesBuilder_AddChar = ImFontGlyphRangesBuilder_AddChar;
pub const FontGlyphRangesBuilder_AddText = ImFontGlyphRangesBuilder_AddText;
pub const FontGlyphRangesBuilder_AddRanges = ImFontGlyphRangesBuilder_AddRanges;
pub const FontGlyphRangesBuilder_BuildRanges = ImFontGlyphRangesBuilder_BuildRanges;
pub const FontAtlasCustomRect_IsPacked = ImFontAtlasCustomRect_IsPacked;
pub const FontAtlas_AddFont = ImFontAtlas_AddFont;
pub const FontAtlas_AddFontDefault = ImFontAtlas_AddFontDefault;
pub const FontAtlas_AddFontFromFileTTF = ImFontAtlas_AddFontFromFileTTF;
pub const FontAtlas_AddFontFromMemoryTTF = ImFontAtlas_AddFontFromMemoryTTF;
pub const FontAtlas_AddFontFromMemoryCompressedTTF = ImFontAtlas_AddFontFromMemoryCompressedTTF;
pub const FontAtlas_AddFontFromMemoryCompressedBase85TTF = ImFontAtlas_AddFontFromMemoryCompressedBase85TTF;
pub const FontAtlas_ClearInputData = ImFontAtlas_ClearInputData;
pub const FontAtlas_ClearTexData = ImFontAtlas_ClearTexData;
pub const FontAtlas_ClearFonts = ImFontAtlas_ClearFonts;
pub const FontAtlas_Clear = ImFontAtlas_Clear;
pub const FontAtlas_Build = ImFontAtlas_Build;
pub const FontAtlas_GetTexDataAsAlpha8 = ImFontAtlas_GetTexDataAsAlpha8;
pub const FontAtlas_GetTexDataAsRGBA32 = ImFontAtlas_GetTexDataAsRGBA32;
pub const FontAtlas_IsBuilt = ImFontAtlas_IsBuilt;
pub const FontAtlas_SetTexID = ImFontAtlas_SetTexID;
pub const FontAtlas_GetGlyphRangesDefault = ImFontAtlas_GetGlyphRangesDefault;
pub const FontAtlas_GetGlyphRangesGreek = ImFontAtlas_GetGlyphRangesGreek;
pub const FontAtlas_GetGlyphRangesKorean = ImFontAtlas_GetGlyphRangesKorean;
pub const FontAtlas_GetGlyphRangesJapanese = ImFontAtlas_GetGlyphRangesJapanese;
pub const FontAtlas_GetGlyphRangesChineseFull = ImFontAtlas_GetGlyphRangesChineseFull;
pub const FontAtlas_GetGlyphRangesChineseSimplifiedCommon = ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon;
pub const FontAtlas_GetGlyphRangesCyrillic = ImFontAtlas_GetGlyphRangesCyrillic;
pub const FontAtlas_GetGlyphRangesThai = ImFontAtlas_GetGlyphRangesThai;
pub const FontAtlas_GetGlyphRangesVietnamese = ImFontAtlas_GetGlyphRangesVietnamese;
pub const FontAtlas_AddCustomRectRegular = ImFontAtlas_AddCustomRectRegular;
pub const FontAtlas_AddCustomRectFontGlyph = ImFontAtlas_AddCustomRectFontGlyph;
pub const FontAtlas_GetCustomRectByIndex = ImFontAtlas_GetCustomRectByIndex;
pub const FontAtlas_CalcCustomRectUV = ImFontAtlas_CalcCustomRectUV;
pub const FontAtlas_GetMouseCursorTexData = ImFontAtlas_GetMouseCursorTexData;
pub const Font_FindGlyph = ImFont_FindGlyph;
pub const Font_FindGlyphNoFallback = ImFont_FindGlyphNoFallback;
pub const Font_GetCharAdvance = ImFont_GetCharAdvance;
pub const Font_IsLoaded = ImFont_IsLoaded;
pub const Font_GetDebugName = ImFont_GetDebugName;
pub const Font_CalcTextSizeA = ImFont_CalcTextSizeA;
pub const Font_CalcTextSizeAEx = ImFont_CalcTextSizeAEx;
pub const Font_CalcWordWrapPositionA = ImFont_CalcWordWrapPositionA;
pub const Font_RenderChar = ImFont_RenderChar;
pub const Font_RenderText = ImFont_RenderText;
pub const Font_BuildLookupTable = ImFont_BuildLookupTable;
pub const Font_ClearOutputData = ImFont_ClearOutputData;
pub const Font_GrowIndex = ImFont_GrowIndex;
pub const Font_AddGlyph = ImFont_AddGlyph;
pub const Font_AddRemapChar = ImFont_AddRemapChar;
pub const Font_SetGlyphVisible = ImFont_SetGlyphVisible;
pub const Font_IsGlyphRangeUnused = ImFont_IsGlyphRangeUnused;
pub const Viewport_GetCenter = ImGuiViewport_GetCenter;
pub const Viewport_GetWorkCenter = ImGuiViewport_GetWorkCenter;
pub const ShowStackToolWindow = ImGui_ShowStackToolWindow;
pub const ListBoxObsolete = ImGui_ListBoxObsolete;
pub const ListBoxObsoleteEx = ImGui_ListBoxObsoleteEx;
pub const ComboObsolete = ImGui_ComboObsolete;
pub const ComboObsoleteEx = ImGui_ComboObsoleteEx;
pub const SetItemAllowOverlap = ImGui_SetItemAllowOverlap;
pub const PushAllowKeyboardFocus = ImGui_PushAllowKeyboardFocus;
pub const PopAllowKeyboardFocus = ImGui_PopAllowKeyboardFocus;
pub const ImageButtonImTextureID = ImGui_ImageButtonImTextureID;
pub const CaptureKeyboardFromApp = ImGui_CaptureKeyboardFromApp;
pub const CaptureMouseFromApp = ImGui_CaptureMouseFromApp;
pub const CalcListClipping = ImGui_CalcListClipping;
test {
    std.testing.refAllDeclsRecursive(@This());
}
