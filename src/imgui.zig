const std = @import("std");
const c = @cImport({
    @cInclude("stdarg.h");
});
pub const backends = struct {
    pub const mach = @import("imgui_mach.zig");
};

pub const VERSION = "1.89.9";
pub const VERSION_NUM = 18990;
//pub const IMPL_API = IMGUI_API;
pub const PAYLOAD_TYPE_COLOR_3F = "_COL3F";
pub const PAYLOAD_TYPE_COLOR_4F = "_COL4F";
pub const UNICODE_CODEPOINT_INVALID = 0xFFFD;
pub const UNICODE_CODEPOINT_MAX = 0xFFFF;
pub const COL32_R_SHIFT = 0;
pub const COL32_G_SHIFT = 8;
pub const COL32_B_SHIFT = 16;
pub const COL32_A_SHIFT = 24;
pub const COL32_A_MASK = 0xFF000000;
pub const DRAWLIST_TEX_LINES_WIDTH_MAX = 63;
pub const WindowFlags_None = 0;
pub const WindowFlags_NoTitleBar = 1;
pub const WindowFlags_NoResize = 2;
pub const WindowFlags_NoMove = 4;
pub const WindowFlags_NoScrollbar = 8;
pub const WindowFlags_NoScrollWithMouse = 16;
pub const WindowFlags_NoCollapse = 32;
pub const WindowFlags_AlwaysAutoResize = 64;
pub const WindowFlags_NoBackground = 128;
pub const WindowFlags_NoSavedSettings = 256;
pub const WindowFlags_NoMouseInputs = 512;
pub const WindowFlags_MenuBar = 1024;
pub const WindowFlags_HorizontalScrollbar = 2048;
pub const WindowFlags_NoFocusOnAppearing = 4096;
pub const WindowFlags_NoBringToFrontOnFocus = 8192;
pub const WindowFlags_AlwaysVerticalScrollbar = 16384;
pub const WindowFlags_AlwaysHorizontalScrollbar = 32768;
pub const WindowFlags_AlwaysUseWindowPadding = 65536;
pub const WindowFlags_NoNavInputs = 262144;
pub const WindowFlags_NoNavFocus = 524288;
pub const WindowFlags_UnsavedDocument = 1048576;
pub const WindowFlags_NoDocking = 2097152;
pub const WindowFlags_NoNav = 786432;
pub const WindowFlags_NoDecoration = 43;
pub const WindowFlags_NoInputs = 786944;
pub const WindowFlags_NavFlattened = 8388608;
pub const WindowFlags_ChildWindow = 16777216;
pub const WindowFlags_Tooltip = 33554432;
pub const WindowFlags_Popup = 67108864;
pub const WindowFlags_Modal = 134217728;
pub const WindowFlags_ChildMenu = 268435456;
pub const WindowFlags_DockNodeHost = 536870912;
pub const InputTextFlags_None = 0;
pub const InputTextFlags_CharsDecimal = 1;
pub const InputTextFlags_CharsHexadecimal = 2;
pub const InputTextFlags_CharsUppercase = 4;
pub const InputTextFlags_CharsNoBlank = 8;
pub const InputTextFlags_AutoSelectAll = 16;
pub const InputTextFlags_EnterReturnsTrue = 32;
pub const InputTextFlags_CallbackCompletion = 64;
pub const InputTextFlags_CallbackHistory = 128;
pub const InputTextFlags_CallbackAlways = 256;
pub const InputTextFlags_CallbackCharFilter = 512;
pub const InputTextFlags_AllowTabInput = 1024;
pub const InputTextFlags_CtrlEnterForNewLine = 2048;
pub const InputTextFlags_NoHorizontalScroll = 4096;
pub const InputTextFlags_AlwaysOverwrite = 8192;
pub const InputTextFlags_ReadOnly = 16384;
pub const InputTextFlags_Password = 32768;
pub const InputTextFlags_NoUndoRedo = 65536;
pub const InputTextFlags_CharsScientific = 131072;
pub const InputTextFlags_CallbackResize = 262144;
pub const InputTextFlags_CallbackEdit = 524288;
pub const InputTextFlags_EscapeClearsAll = 1048576;
pub const TreeNodeFlags_None = 0;
pub const TreeNodeFlags_Selected = 1;
pub const TreeNodeFlags_Framed = 2;
pub const TreeNodeFlags_AllowOverlap = 4;
pub const TreeNodeFlags_NoTreePushOnOpen = 8;
pub const TreeNodeFlags_NoAutoOpenOnLog = 16;
pub const TreeNodeFlags_DefaultOpen = 32;
pub const TreeNodeFlags_OpenOnDoubleClick = 64;
pub const TreeNodeFlags_OpenOnArrow = 128;
pub const TreeNodeFlags_Leaf = 256;
pub const TreeNodeFlags_Bullet = 512;
pub const TreeNodeFlags_FramePadding = 1024;
pub const TreeNodeFlags_SpanAvailWidth = 2048;
pub const TreeNodeFlags_SpanFullWidth = 4096;
pub const TreeNodeFlags_NavLeftJumpsBackHere = 8192;
pub const TreeNodeFlags_CollapsingHeader = 26;
pub const PopupFlags_None = 0;
pub const PopupFlags_MouseButtonLeft = 0;
pub const PopupFlags_MouseButtonRight = 1;
pub const PopupFlags_MouseButtonMiddle = 2;
pub const PopupFlags_MouseButtonMask_ = 31;
pub const PopupFlags_MouseButtonDefault_ = 1;
pub const PopupFlags_NoOpenOverExistingPopup = 32;
pub const PopupFlags_NoOpenOverItems = 64;
pub const PopupFlags_AnyPopupId = 128;
pub const PopupFlags_AnyPopupLevel = 256;
pub const PopupFlags_AnyPopup = 384;
pub const SelectableFlags_None = 0;
pub const SelectableFlags_DontClosePopups = 1;
pub const SelectableFlags_SpanAllColumns = 2;
pub const SelectableFlags_AllowDoubleClick = 4;
pub const SelectableFlags_Disabled = 8;
pub const SelectableFlags_AllowOverlap = 16;
pub const ComboFlags_None = 0;
pub const ComboFlags_PopupAlignLeft = 1;
pub const ComboFlags_HeightSmall = 2;
pub const ComboFlags_HeightRegular = 4;
pub const ComboFlags_HeightLarge = 8;
pub const ComboFlags_HeightLargest = 16;
pub const ComboFlags_NoArrowButton = 32;
pub const ComboFlags_NoPreview = 64;
pub const ComboFlags_HeightMask_ = 30;
pub const TabBarFlags_None = 0;
pub const TabBarFlags_Reorderable = 1;
pub const TabBarFlags_AutoSelectNewTabs = 2;
pub const TabBarFlags_TabListPopupButton = 4;
pub const TabBarFlags_NoCloseWithMiddleMouseButton = 8;
pub const TabBarFlags_NoTabListScrollingButtons = 16;
pub const TabBarFlags_NoTooltip = 32;
pub const TabBarFlags_FittingPolicyResizeDown = 64;
pub const TabBarFlags_FittingPolicyScroll = 128;
pub const TabBarFlags_FittingPolicyMask_ = 192;
pub const TabBarFlags_FittingPolicyDefault_ = 64;
pub const TabItemFlags_None = 0;
pub const TabItemFlags_UnsavedDocument = 1;
pub const TabItemFlags_SetSelected = 2;
pub const TabItemFlags_NoCloseWithMiddleMouseButton = 4;
pub const TabItemFlags_NoPushId = 8;
pub const TabItemFlags_NoTooltip = 16;
pub const TabItemFlags_NoReorder = 32;
pub const TabItemFlags_Leading = 64;
pub const TabItemFlags_Trailing = 128;
pub const TableFlags_None = 0;
pub const TableFlags_Resizable = 1;
pub const TableFlags_Reorderable = 2;
pub const TableFlags_Hideable = 4;
pub const TableFlags_Sortable = 8;
pub const TableFlags_NoSavedSettings = 16;
pub const TableFlags_ContextMenuInBody = 32;
pub const TableFlags_RowBg = 64;
pub const TableFlags_BordersInnerH = 128;
pub const TableFlags_BordersOuterH = 256;
pub const TableFlags_BordersInnerV = 512;
pub const TableFlags_BordersOuterV = 1024;
pub const TableFlags_BordersH = 384;
pub const TableFlags_BordersV = 1536;
pub const TableFlags_BordersInner = 640;
pub const TableFlags_BordersOuter = 1280;
pub const TableFlags_Borders = 1920;
pub const TableFlags_NoBordersInBody = 2048;
pub const TableFlags_NoBordersInBodyUntilResize = 4096;
pub const TableFlags_SizingFixedFit = 8192;
pub const TableFlags_SizingFixedSame = 16384;
pub const TableFlags_SizingStretchProp = 24576;
pub const TableFlags_SizingStretchSame = 32768;
pub const TableFlags_NoHostExtendX = 65536;
pub const TableFlags_NoHostExtendY = 131072;
pub const TableFlags_NoKeepColumnsVisible = 262144;
pub const TableFlags_PreciseWidths = 524288;
pub const TableFlags_NoClip = 1048576;
pub const TableFlags_PadOuterX = 2097152;
pub const TableFlags_NoPadOuterX = 4194304;
pub const TableFlags_NoPadInnerX = 8388608;
pub const TableFlags_ScrollX = 16777216;
pub const TableFlags_ScrollY = 33554432;
pub const TableFlags_SortMulti = 67108864;
pub const TableFlags_SortTristate = 134217728;
pub const TableFlags_SizingMask_ = 57344;
pub const TableColumnFlags_None = 0;
pub const TableColumnFlags_Disabled = 1;
pub const TableColumnFlags_DefaultHide = 2;
pub const TableColumnFlags_DefaultSort = 4;
pub const TableColumnFlags_WidthStretch = 8;
pub const TableColumnFlags_WidthFixed = 16;
pub const TableColumnFlags_NoResize = 32;
pub const TableColumnFlags_NoReorder = 64;
pub const TableColumnFlags_NoHide = 128;
pub const TableColumnFlags_NoClip = 256;
pub const TableColumnFlags_NoSort = 512;
pub const TableColumnFlags_NoSortAscending = 1024;
pub const TableColumnFlags_NoSortDescending = 2048;
pub const TableColumnFlags_NoHeaderLabel = 4096;
pub const TableColumnFlags_NoHeaderWidth = 8192;
pub const TableColumnFlags_PreferSortAscending = 16384;
pub const TableColumnFlags_PreferSortDescending = 32768;
pub const TableColumnFlags_IndentEnable = 65536;
pub const TableColumnFlags_IndentDisable = 131072;
pub const TableColumnFlags_IsEnabled = 16777216;
pub const TableColumnFlags_IsVisible = 33554432;
pub const TableColumnFlags_IsSorted = 67108864;
pub const TableColumnFlags_IsHovered = 134217728;
pub const TableColumnFlags_WidthMask_ = 24;
pub const TableColumnFlags_IndentMask_ = 196608;
pub const TableColumnFlags_StatusMask_ = 251658240;
pub const TableColumnFlags_NoDirectResize_ = 1073741824;
pub const TableRowFlags_None = 0;
pub const TableRowFlags_Headers = 1;
pub const TableBgTarget_None = 0;
pub const TableBgTarget_RowBg0 = 1;
pub const TableBgTarget_RowBg1 = 2;
pub const TableBgTarget_CellBg = 3;
pub const FocusedFlags_None = 0;
pub const FocusedFlags_ChildWindows = 1;
pub const FocusedFlags_RootWindow = 2;
pub const FocusedFlags_AnyWindow = 4;
pub const FocusedFlags_NoPopupHierarchy = 8;
pub const FocusedFlags_DockHierarchy = 16;
pub const FocusedFlags_RootAndChildWindows = 3;
pub const HoveredFlags_None = 0;
pub const HoveredFlags_ChildWindows = 1;
pub const HoveredFlags_RootWindow = 2;
pub const HoveredFlags_AnyWindow = 4;
pub const HoveredFlags_NoPopupHierarchy = 8;
pub const HoveredFlags_DockHierarchy = 16;
pub const HoveredFlags_AllowWhenBlockedByPopup = 32;
pub const HoveredFlags_AllowWhenBlockedByActiveItem = 128;
pub const HoveredFlags_AllowWhenOverlappedByItem = 256;
pub const HoveredFlags_AllowWhenOverlappedByWindow = 512;
pub const HoveredFlags_AllowWhenDisabled = 1024;
pub const HoveredFlags_NoNavOverride = 2048;
pub const HoveredFlags_AllowWhenOverlapped = 768;
pub const HoveredFlags_RectOnly = 928;
pub const HoveredFlags_RootAndChildWindows = 3;
pub const HoveredFlags_ForTooltip = 4096;
pub const HoveredFlags_Stationary = 8192;
pub const HoveredFlags_DelayNone = 16384;
pub const HoveredFlags_DelayShort = 32768;
pub const HoveredFlags_DelayNormal = 65536;
pub const HoveredFlags_NoSharedDelay = 131072;
pub const DockNodeFlags_None = 0;
pub const DockNodeFlags_KeepAliveOnly = 1;
pub const DockNodeFlags_NoDockingInCentralNode = 4;
pub const DockNodeFlags_PassthruCentralNode = 8;
pub const DockNodeFlags_NoSplit = 16;
pub const DockNodeFlags_NoResize = 32;
pub const DockNodeFlags_AutoHideTabBar = 64;
pub const DragDropFlags_None = 0;
pub const DragDropFlags_SourceNoPreviewTooltip = 1;
pub const DragDropFlags_SourceNoDisableHover = 2;
pub const DragDropFlags_SourceNoHoldToOpenOthers = 4;
pub const DragDropFlags_SourceAllowNullID = 8;
pub const DragDropFlags_SourceExtern = 16;
pub const DragDropFlags_SourceAutoExpirePayload = 32;
pub const DragDropFlags_AcceptBeforeDelivery = 1024;
pub const DragDropFlags_AcceptNoDrawDefaultRect = 2048;
pub const DragDropFlags_AcceptNoPreviewTooltip = 4096;
pub const DragDropFlags_AcceptPeekOnly = 3072;
pub const DataType_S8 = 0;
pub const DataType_U8 = 1;
pub const DataType_S16 = 2;
pub const DataType_U16 = 3;
pub const DataType_S32 = 4;
pub const DataType_U32 = 5;
pub const DataType_S64 = 6;
pub const DataType_U64 = 7;
pub const DataType_Float = 8;
pub const DataType_Double = 9;
pub const DataType_COUNT = 10;
pub const Dir_None = -1;
pub const Dir_Left = 0;
pub const Dir_Right = 1;
pub const Dir_Up = 2;
pub const Dir_Down = 3;
pub const Dir_COUNT = 4;
pub const SortDirection_None = 0;
pub const SortDirection_Ascending = 1;
pub const SortDirection_Descending = 2;
pub const Key_None = 0;
pub const Key_Tab = 512;
pub const Key_LeftArrow = 513;
pub const Key_RightArrow = 514;
pub const Key_UpArrow = 515;
pub const Key_DownArrow = 516;
pub const Key_PageUp = 517;
pub const Key_PageDown = 518;
pub const Key_Home = 519;
pub const Key_End = 520;
pub const Key_Insert = 521;
pub const Key_Delete = 522;
pub const Key_Backspace = 523;
pub const Key_Space = 524;
pub const Key_Enter = 525;
pub const Key_Escape = 526;
pub const Key_LeftCtrl = 527;
pub const Key_LeftShift = 528;
pub const Key_LeftAlt = 529;
pub const Key_LeftSuper = 530;
pub const Key_RightCtrl = 531;
pub const Key_RightShift = 532;
pub const Key_RightAlt = 533;
pub const Key_RightSuper = 534;
pub const Key_Menu = 535;
pub const Key_0 = 536;
pub const Key_1 = 537;
pub const Key_2 = 538;
pub const Key_3 = 539;
pub const Key_4 = 540;
pub const Key_5 = 541;
pub const Key_6 = 542;
pub const Key_7 = 543;
pub const Key_8 = 544;
pub const Key_9 = 545;
pub const Key_A = 546;
pub const Key_B = 547;
pub const Key_C = 548;
pub const Key_D = 549;
pub const Key_E = 550;
pub const Key_F = 551;
pub const Key_G = 552;
pub const Key_H = 553;
pub const Key_I = 554;
pub const Key_J = 555;
pub const Key_K = 556;
pub const Key_L = 557;
pub const Key_M = 558;
pub const Key_N = 559;
pub const Key_O = 560;
pub const Key_P = 561;
pub const Key_Q = 562;
pub const Key_R = 563;
pub const Key_S = 564;
pub const Key_T = 565;
pub const Key_U = 566;
pub const Key_V = 567;
pub const Key_W = 568;
pub const Key_X = 569;
pub const Key_Y = 570;
pub const Key_Z = 571;
pub const Key_F1 = 572;
pub const Key_F2 = 573;
pub const Key_F3 = 574;
pub const Key_F4 = 575;
pub const Key_F5 = 576;
pub const Key_F6 = 577;
pub const Key_F7 = 578;
pub const Key_F8 = 579;
pub const Key_F9 = 580;
pub const Key_F10 = 581;
pub const Key_F11 = 582;
pub const Key_F12 = 583;
pub const Key_Apostrophe = 584;
pub const Key_Comma = 585;
pub const Key_Minus = 586;
pub const Key_Period = 587;
pub const Key_Slash = 588;
pub const Key_Semicolon = 589;
pub const Key_Equal = 590;
pub const Key_LeftBracket = 591;
pub const Key_Backslash = 592;
pub const Key_RightBracket = 593;
pub const Key_GraveAccent = 594;
pub const Key_CapsLock = 595;
pub const Key_ScrollLock = 596;
pub const Key_NumLock = 597;
pub const Key_PrintScreen = 598;
pub const Key_Pause = 599;
pub const Key_Keypad0 = 600;
pub const Key_Keypad1 = 601;
pub const Key_Keypad2 = 602;
pub const Key_Keypad3 = 603;
pub const Key_Keypad4 = 604;
pub const Key_Keypad5 = 605;
pub const Key_Keypad6 = 606;
pub const Key_Keypad7 = 607;
pub const Key_Keypad8 = 608;
pub const Key_Keypad9 = 609;
pub const Key_KeypadDecimal = 610;
pub const Key_KeypadDivide = 611;
pub const Key_KeypadMultiply = 612;
pub const Key_KeypadSubtract = 613;
pub const Key_KeypadAdd = 614;
pub const Key_KeypadEnter = 615;
pub const Key_KeypadEqual = 616;
pub const Key_GamepadStart = 617;
pub const Key_GamepadBack = 618;
pub const Key_GamepadFaceLeft = 619;
pub const Key_GamepadFaceRight = 620;
pub const Key_GamepadFaceUp = 621;
pub const Key_GamepadFaceDown = 622;
pub const Key_GamepadDpadLeft = 623;
pub const Key_GamepadDpadRight = 624;
pub const Key_GamepadDpadUp = 625;
pub const Key_GamepadDpadDown = 626;
pub const Key_GamepadL1 = 627;
pub const Key_GamepadR1 = 628;
pub const Key_GamepadL2 = 629;
pub const Key_GamepadR2 = 630;
pub const Key_GamepadL3 = 631;
pub const Key_GamepadR3 = 632;
pub const Key_GamepadLStickLeft = 633;
pub const Key_GamepadLStickRight = 634;
pub const Key_GamepadLStickUp = 635;
pub const Key_GamepadLStickDown = 636;
pub const Key_GamepadRStickLeft = 637;
pub const Key_GamepadRStickRight = 638;
pub const Key_GamepadRStickUp = 639;
pub const Key_GamepadRStickDown = 640;
pub const Key_MouseLeft = 641;
pub const Key_MouseRight = 642;
pub const Key_MouseMiddle = 643;
pub const Key_MouseX1 = 644;
pub const Key_MouseX2 = 645;
pub const Key_MouseWheelX = 646;
pub const Key_MouseWheelY = 647;
pub const Key_ReservedForModCtrl = 648;
pub const Key_ReservedForModShift = 649;
pub const Key_ReservedForModAlt = 650;
pub const Key_ReservedForModSuper = 651;
pub const Key_COUNT = 652;
pub const Mod_None = 0;
pub const Mod_Ctrl = 4096;
pub const Mod_Shift = 8192;
pub const Mod_Alt = 16384;
pub const Mod_Super = 32768;
pub const Mod_Shortcut = 2048;
pub const Mod_Mask_ = 63488;
pub const Key_NamedKey_BEGIN = 512;
pub const Key_NamedKey_END = 652;
pub const Key_NamedKey_COUNT = 140;
pub const Key_KeysData_SIZE = 140;
pub const Key_KeysData_OFFSET = 512;
pub const ConfigFlags_None = 0;
pub const ConfigFlags_NavEnableKeyboard = 1;
pub const ConfigFlags_NavEnableGamepad = 2;
pub const ConfigFlags_NavEnableSetMousePos = 4;
pub const ConfigFlags_NavNoCaptureKeyboard = 8;
pub const ConfigFlags_NoMouse = 16;
pub const ConfigFlags_NoMouseCursorChange = 32;
pub const ConfigFlags_DockingEnable = 64;
pub const ConfigFlags_ViewportsEnable = 1024;
pub const ConfigFlags_DpiEnableScaleViewports = 16384;
pub const ConfigFlags_DpiEnableScaleFonts = 32768;
pub const ConfigFlags_IsSRGB = 1048576;
pub const ConfigFlags_IsTouchScreen = 2097152;
pub const BackendFlags_None = 0;
pub const BackendFlags_HasGamepad = 1;
pub const BackendFlags_HasMouseCursors = 2;
pub const BackendFlags_HasSetMousePos = 4;
pub const BackendFlags_RendererHasVtxOffset = 8;
pub const BackendFlags_PlatformHasViewports = 1024;
pub const BackendFlags_HasMouseHoveredViewport = 2048;
pub const BackendFlags_RendererHasViewports = 4096;
pub const Col_Text = 0;
pub const Col_TextDisabled = 1;
pub const Col_WindowBg = 2;
pub const Col_ChildBg = 3;
pub const Col_PopupBg = 4;
pub const Col_Border = 5;
pub const Col_BorderShadow = 6;
pub const Col_FrameBg = 7;
pub const Col_FrameBgHovered = 8;
pub const Col_FrameBgActive = 9;
pub const Col_TitleBg = 10;
pub const Col_TitleBgActive = 11;
pub const Col_TitleBgCollapsed = 12;
pub const Col_MenuBarBg = 13;
pub const Col_ScrollbarBg = 14;
pub const Col_ScrollbarGrab = 15;
pub const Col_ScrollbarGrabHovered = 16;
pub const Col_ScrollbarGrabActive = 17;
pub const Col_CheckMark = 18;
pub const Col_SliderGrab = 19;
pub const Col_SliderGrabActive = 20;
pub const Col_Button = 21;
pub const Col_ButtonHovered = 22;
pub const Col_ButtonActive = 23;
pub const Col_Header = 24;
pub const Col_HeaderHovered = 25;
pub const Col_HeaderActive = 26;
pub const Col_Separator = 27;
pub const Col_SeparatorHovered = 28;
pub const Col_SeparatorActive = 29;
pub const Col_ResizeGrip = 30;
pub const Col_ResizeGripHovered = 31;
pub const Col_ResizeGripActive = 32;
pub const Col_Tab = 33;
pub const Col_TabHovered = 34;
pub const Col_TabActive = 35;
pub const Col_TabUnfocused = 36;
pub const Col_TabUnfocusedActive = 37;
pub const Col_DockingPreview = 38;
pub const Col_DockingEmptyBg = 39;
pub const Col_PlotLines = 40;
pub const Col_PlotLinesHovered = 41;
pub const Col_PlotHistogram = 42;
pub const Col_PlotHistogramHovered = 43;
pub const Col_TableHeaderBg = 44;
pub const Col_TableBorderStrong = 45;
pub const Col_TableBorderLight = 46;
pub const Col_TableRowBg = 47;
pub const Col_TableRowBgAlt = 48;
pub const Col_TextSelectedBg = 49;
pub const Col_DragDropTarget = 50;
pub const Col_NavHighlight = 51;
pub const Col_NavWindowingHighlight = 52;
pub const Col_NavWindowingDimBg = 53;
pub const Col_ModalWindowDimBg = 54;
pub const Col_COUNT = 55;
pub const StyleVar_Alpha = 0;
pub const StyleVar_DisabledAlpha = 1;
pub const StyleVar_WindowPadding = 2;
pub const StyleVar_WindowRounding = 3;
pub const StyleVar_WindowBorderSize = 4;
pub const StyleVar_WindowMinSize = 5;
pub const StyleVar_WindowTitleAlign = 6;
pub const StyleVar_ChildRounding = 7;
pub const StyleVar_ChildBorderSize = 8;
pub const StyleVar_PopupRounding = 9;
pub const StyleVar_PopupBorderSize = 10;
pub const StyleVar_FramePadding = 11;
pub const StyleVar_FrameRounding = 12;
pub const StyleVar_FrameBorderSize = 13;
pub const StyleVar_ItemSpacing = 14;
pub const StyleVar_ItemInnerSpacing = 15;
pub const StyleVar_IndentSpacing = 16;
pub const StyleVar_CellPadding = 17;
pub const StyleVar_ScrollbarSize = 18;
pub const StyleVar_ScrollbarRounding = 19;
pub const StyleVar_GrabMinSize = 20;
pub const StyleVar_GrabRounding = 21;
pub const StyleVar_TabRounding = 22;
pub const StyleVar_ButtonTextAlign = 23;
pub const StyleVar_SelectableTextAlign = 24;
pub const StyleVar_SeparatorTextBorderSize = 25;
pub const StyleVar_SeparatorTextAlign = 26;
pub const StyleVar_SeparatorTextPadding = 27;
pub const StyleVar_DockingSeparatorSize = 28;
pub const StyleVar_COUNT = 29;
pub const ButtonFlags_None = 0;
pub const ButtonFlags_MouseButtonLeft = 1;
pub const ButtonFlags_MouseButtonRight = 2;
pub const ButtonFlags_MouseButtonMiddle = 4;
pub const ButtonFlags_MouseButtonMask_ = 7;
pub const ButtonFlags_MouseButtonDefault_ = 1;
pub const ColorEditFlags_None = 0;
pub const ColorEditFlags_NoAlpha = 2;
pub const ColorEditFlags_NoPicker = 4;
pub const ColorEditFlags_NoOptions = 8;
pub const ColorEditFlags_NoSmallPreview = 16;
pub const ColorEditFlags_NoInputs = 32;
pub const ColorEditFlags_NoTooltip = 64;
pub const ColorEditFlags_NoLabel = 128;
pub const ColorEditFlags_NoSidePreview = 256;
pub const ColorEditFlags_NoDragDrop = 512;
pub const ColorEditFlags_NoBorder = 1024;
pub const ColorEditFlags_AlphaBar = 65536;
pub const ColorEditFlags_AlphaPreview = 131072;
pub const ColorEditFlags_AlphaPreviewHalf = 262144;
pub const ColorEditFlags_HDR = 524288;
pub const ColorEditFlags_DisplayRGB = 1048576;
pub const ColorEditFlags_DisplayHSV = 2097152;
pub const ColorEditFlags_DisplayHex = 4194304;
pub const ColorEditFlags_Uint8 = 8388608;
pub const ColorEditFlags_Float = 16777216;
pub const ColorEditFlags_PickerHueBar = 33554432;
pub const ColorEditFlags_PickerHueWheel = 67108864;
pub const ColorEditFlags_InputRGB = 134217728;
pub const ColorEditFlags_InputHSV = 268435456;
pub const ColorEditFlags_DefaultOptions_ = 177209344;
pub const ColorEditFlags_DisplayMask_ = 7340032;
pub const ColorEditFlags_DataTypeMask_ = 25165824;
pub const ColorEditFlags_PickerMask_ = 100663296;
pub const ColorEditFlags_InputMask_ = 402653184;
pub const SliderFlags_None = 0;
pub const SliderFlags_AlwaysClamp = 16;
pub const SliderFlags_Logarithmic = 32;
pub const SliderFlags_NoRoundToFormat = 64;
pub const SliderFlags_NoInput = 128;
pub const SliderFlags_InvalidMask_ = 1879048207;
pub const MouseButton_Left = 0;
pub const MouseButton_Right = 1;
pub const MouseButton_Middle = 2;
pub const MouseButton_COUNT = 5;
pub const MouseCursor_None = -1;
pub const MouseCursor_Arrow = 0;
pub const MouseCursor_TextInput = 1;
pub const MouseCursor_ResizeAll = 2;
pub const MouseCursor_ResizeNS = 3;
pub const MouseCursor_ResizeEW = 4;
pub const MouseCursor_ResizeNESW = 5;
pub const MouseCursor_ResizeNWSE = 6;
pub const MouseCursor_Hand = 7;
pub const MouseCursor_NotAllowed = 8;
pub const MouseCursor_COUNT = 9;
pub const MouseSource_Mouse = 0;
pub const MouseSource_TouchScreen = 1;
pub const MouseSource_Pen = 2;
pub const MouseSource_COUNT = 3;
pub const Cond_None = 0;
pub const Cond_Always = 1;
pub const Cond_Once = 2;
pub const Cond_FirstUseEver = 4;
pub const Cond_Appearing = 8;
pub const DrawFlags_None = 0;
pub const DrawFlags_Closed = 1;
pub const DrawFlags_RoundCornersTopLeft = 16;
pub const DrawFlags_RoundCornersTopRight = 32;
pub const DrawFlags_RoundCornersBottomLeft = 64;
pub const DrawFlags_RoundCornersBottomRight = 128;
pub const DrawFlags_RoundCornersNone = 256;
pub const DrawFlags_RoundCornersTop = 48;
pub const DrawFlags_RoundCornersBottom = 192;
pub const DrawFlags_RoundCornersLeft = 80;
pub const DrawFlags_RoundCornersRight = 160;
pub const DrawFlags_RoundCornersAll = 240;
pub const DrawFlags_RoundCornersDefault_ = 240;
pub const DrawFlags_RoundCornersMask_ = 496;
pub const DrawListFlags_None = 0;
pub const DrawListFlags_AntiAliasedLines = 1;
pub const DrawListFlags_AntiAliasedLinesUseTex = 2;
pub const DrawListFlags_AntiAliasedFill = 4;
pub const DrawListFlags_AllowVtxOffset = 8;
pub const FontAtlasFlags_None = 0;
pub const FontAtlasFlags_NoPowerOfTwoHeight = 1;
pub const FontAtlasFlags_NoMouseCursors = 2;
pub const FontAtlasFlags_NoBakedLines = 4;
pub const ViewportFlags_None = 0;
pub const ViewportFlags_IsPlatformWindow = 1;
pub const ViewportFlags_IsPlatformMonitor = 2;
pub const ViewportFlags_OwnedByApp = 4;
pub const ViewportFlags_NoDecoration = 8;
pub const ViewportFlags_NoTaskBarIcon = 16;
pub const ViewportFlags_NoFocusOnAppearing = 32;
pub const ViewportFlags_NoFocusOnClick = 64;
pub const ViewportFlags_NoInputs = 128;
pub const ViewportFlags_NoRendererClear = 256;
pub const ViewportFlags_NoAutoMerge = 512;
pub const ViewportFlags_TopMost = 1024;
pub const ViewportFlags_CanHostOtherWindows = 2048;
pub const ViewportFlags_IsMinimized = 4096;
pub const ViewportFlags_IsFocused = 8192;
pub const Key = c_int;
pub const MouseSource = c_int;
pub const Col = c_int;
pub const Cond = c_int;
pub const DataType = c_int;
pub const Dir = c_int;
pub const MouseButton = c_int;
pub const MouseCursor = c_int;
pub const SortDirection = c_int;
pub const StyleVar = c_int;
pub const TableBgTarget = c_int;
pub const DrawFlags = c_int;
pub const DrawListFlags = c_int;
pub const FontAtlasFlags = c_int;
pub const BackendFlags = c_int;
pub const ButtonFlags = c_int;
pub const ColorEditFlags = c_int;
pub const ConfigFlags = c_int;
pub const ComboFlags = c_int;
pub const DockNodeFlags = c_int;
pub const DragDropFlags = c_int;
pub const FocusedFlags = c_int;
pub const HoveredFlags = c_int;
pub const InputTextFlags = c_int;
pub const KeyChord = c_int;
pub const PopupFlags = c_int;
pub const SelectableFlags = c_int;
pub const SliderFlags = c_int;
pub const TabBarFlags = c_int;
pub const TabItemFlags = c_int;
pub const TableFlags = c_int;
pub const TableColumnFlags = c_int;
pub const TableRowFlags = c_int;
pub const TreeNodeFlags = c_int;
pub const ViewportFlags = c_int;
pub const WindowFlags = c_int;
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
pub const Wchar16 = c_ushort;
pub const Wchar32 = c_uint;
pub const Wchar = Wchar16;
pub const InputTextCallback = ?*const fn (?*InputTextCallbackData) callconv(.C) c_int;
pub const SizeCallback = ?*const fn (?*SizeCallbackData) callconv(.C) void;
pub const MemAllocFunc = ?*const fn (usize, ?*anyopaque) callconv(.C) ?*anyopaque;
pub const MemFreeFunc = ?*const fn (?*anyopaque, ?*anyopaque) callconv(.C) void;
pub const DrawCallback = ?*const fn (?*const DrawList, ?*const DrawCmd) callconv(.C) void;
pub fn Vector(comptime T: type) type {
    return extern struct {
        size: c_int,
        capacity: c_int,
        data: [*]T,
    };
}
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
pub const Vector_ImGuiPlatformMonitor = extern struct {
    size: c_int,
    capacity: c_int,
    data: ?*PlatformMonitor,
};
pub const Vector_ImGuiViewportPtr = extern struct {
    size: c_int,
    capacity: c_int,
    data: ?*?*Viewport,
};
pub const Style = extern struct {
    alpha: f32,
    disabled_alpha: f32,
    window_padding: Vec2,
    window_rounding: f32,
    window_border_size: f32,
    window_min_size: Vec2,
    window_title_align: Vec2,
    window_menu_button_position: Dir,
    child_rounding: f32,
    child_border_size: f32,
    popup_rounding: f32,
    popup_border_size: f32,
    frame_padding: Vec2,
    frame_rounding: f32,
    frame_border_size: f32,
    item_spacing: Vec2,
    item_inner_spacing: Vec2,
    cell_padding: Vec2,
    touch_extra_padding: Vec2,
    indent_spacing: f32,
    columns_min_spacing: f32,
    scrollbar_size: f32,
    scrollbar_rounding: f32,
    grab_min_size: f32,
    grab_rounding: f32,
    log_slider_deadzone: f32,
    tab_rounding: f32,
    tab_border_size: f32,
    tab_min_width_for_close_button: f32,
    color_button_position: Dir,
    button_text_align: Vec2,
    selectable_text_align: Vec2,
    separator_text_border_size: f32,
    separator_text_align: Vec2,
    separator_text_padding: Vec2,
    display_window_padding: Vec2,
    display_safe_area_padding: Vec2,
    docking_separator_size: f32,
    mouse_cursor_scale: f32,
    anti_aliased_lines: bool,
    anti_aliased_lines_use_tex: bool,
    anti_aliased_fill: bool,
    curve_tessellation_tol: f32,
    circle_tessellation_max_error: f32,
    colors: [Col_COUNT]Vec4,
    hover_stationary_delay: f32,
    hover_delay_short: f32,
    hover_delay_normal: f32,
    hover_flags_for_tooltip_mouse: HoveredFlags,
    hover_flags_for_tooltip_nav: HoveredFlags,
    pub const scaleAllSizes = ImGuiStyle_ScaleAllSizes;
};
pub const KeyData = extern struct {
    down: bool,
    down_duration: f32,
    down_duration_prev: f32,
    analog_value: f32,
};
pub const IO = extern struct {
    config_flags: ConfigFlags,
    backend_flags: BackendFlags,
    display_size: Vec2,
    delta_time: f32,
    ini_saving_rate: f32,
    ini_filename: ?[*:0]const u8,
    log_filename: ?[*:0]const u8,
    user_data: ?*anyopaque,
    fonts: ?*FontAtlas,
    font_global_scale: f32,
    font_allow_user_scaling: bool,
    font_default: ?*Font,
    display_framebuffer_scale: Vec2,
    config_docking_no_split: bool,
    config_docking_with_shift: bool,
    config_docking_always_tab_bar: bool,
    config_docking_transparent_payload: bool,
    config_viewports_no_auto_merge: bool,
    config_viewports_no_task_bar_icon: bool,
    config_viewports_no_decoration: bool,
    config_viewports_no_default_parent: bool,
    mouse_draw_cursor: bool,
    config_mac_osxbehaviors: bool,
    config_input_trickle_event_queue: bool,
    config_input_text_cursor_blink: bool,
    config_input_text_enter_keep_active: bool,
    config_drag_click_to_input_text: bool,
    config_windows_resize_from_edges: bool,
    config_windows_move_from_title_bar_only: bool,
    config_memory_compact_timer: f32,
    mouse_double_click_time: f32,
    mouse_double_click_max_dist: f32,
    mouse_drag_threshold: f32,
    key_repeat_delay: f32,
    key_repeat_rate: f32,
    config_debug_begin_return_value_once: bool,
    config_debug_begin_return_value_loop: bool,
    config_debug_ignore_focus_loss: bool,
    config_debug_ini_settings: bool,
    backend_platform_name: ?[*:0]const u8,
    backend_renderer_name: ?[*:0]const u8,
    backend_platform_user_data: ?*anyopaque,
    backend_renderer_user_data: ?*anyopaque,
    backend_language_user_data: ?*anyopaque,
    get_clipboard_text_fn: ?*const fn (?*anyopaque) callconv(.C) ?[*:0]const u8,
    set_clipboard_text_fn: ?*const fn (?*anyopaque, ?[*:0]const u8) callconv(.C) void,
    clipboard_user_data: ?*anyopaque,
    set_platform_ime_data_fn: ?*const fn (?*Viewport, ?*PlatformImeData) callconv(.C) void,
    platform_locale_decimal_point: Wchar,
    want_capture_mouse: bool,
    want_capture_keyboard: bool,
    want_text_input: bool,
    want_set_mouse_pos: bool,
    want_save_ini_settings: bool,
    nav_active: bool,
    nav_visible: bool,
    framerate: f32,
    metrics_render_vertices: c_int,
    metrics_render_indices: c_int,
    metrics_render_windows: c_int,
    metrics_active_windows: c_int,
    metrics_active_allocations: c_int,
    mouse_delta: Vec2,
    ctx: ?*Context,
    mouse_pos: Vec2,
    mouse_down: [5]bool,
    mouse_wheel: f32,
    mouse_wheel_h: f32,
    mouse_source: MouseSource,
    mouse_hovered_viewport: ID,
    key_ctrl: bool,
    key_shift: bool,
    key_alt: bool,
    key_super: bool,
    key_mods: KeyChord,
    keys_data: [Key_KeysData_SIZE]KeyData,
    want_capture_mouse_unless_popup_close: bool,
    mouse_pos_prev: Vec2,
    mouse_clicked_pos: [5]Vec2,
    mouse_clicked_time: [5]f64,
    mouse_clicked: [5]bool,
    mouse_double_clicked: [5]bool,
    mouse_clicked_count: [5]U16,
    mouse_clicked_last_count: [5]U16,
    mouse_released: [5]bool,
    mouse_down_owned: [5]bool,
    mouse_down_owned_unless_popup_close: [5]bool,
    mouse_wheel_request_axis_swap: bool,
    mouse_down_duration: [5]f32,
    mouse_down_duration_prev: [5]f32,
    mouse_drag_max_distance_abs: [5]Vec2,
    mouse_drag_max_distance_sqr: [5]f32,
    pen_pressure: f32,
    app_focus_lost: bool,
    app_accepting_events: bool,
    backend_using_legacy_key_arrays: S8,
    backend_using_legacy_nav_input_array: bool,
    input_queue_surrogate: Wchar16,
    input_queue_characters: Vector(Wchar),
    pub const addKeyEvent = ImGuiIO_AddKeyEvent;
    pub const addKeyAnalogEvent = ImGuiIO_AddKeyAnalogEvent;
    pub const addMousePosEvent = ImGuiIO_AddMousePosEvent;
    pub const addMouseButtonEvent = ImGuiIO_AddMouseButtonEvent;
    pub const addMouseWheelEvent = ImGuiIO_AddMouseWheelEvent;
    pub const addMouseSourceEvent = ImGuiIO_AddMouseSourceEvent;
    pub const addMouseViewportEvent = ImGuiIO_AddMouseViewportEvent;
    pub const addFocusEvent = ImGuiIO_AddFocusEvent;
    pub const addInputCharacter = ImGuiIO_AddInputCharacter;
    pub const addInputCharacterUTF16 = ImGuiIO_AddInputCharacterUTF16;
    pub const addInputCharactersUTF8 = ImGuiIO_AddInputCharactersUTF8;
    pub const setKeyEventNativeData = ImGuiIO_SetKeyEventNativeData;
    pub const setKeyEventNativeDataEx = ImGuiIO_SetKeyEventNativeDataEx;
    pub const setAppAcceptingEvents = ImGuiIO_SetAppAcceptingEvents;
    pub const clearEventsQueue = ImGuiIO_ClearEventsQueue;
    pub const clearInputKeys = ImGuiIO_ClearInputKeys;
};
pub const InputTextCallbackData = extern struct {
    ctx: ?*Context,
    event_flag: InputTextFlags,
    flags: InputTextFlags,
    user_data: ?*anyopaque,
    event_char: Wchar,
    event_key: Key,
    buf: ?[*:0]const u8,
    buf_text_len: c_int,
    buf_size: c_int,
    buf_dirty: bool,
    cursor_pos: c_int,
    selection_start: c_int,
    selection_end: c_int,
    pub const deleteChars = ImGuiInputTextCallbackData_DeleteChars;
    pub const insertChars = ImGuiInputTextCallbackData_InsertChars;
    pub const selectAll = ImGuiInputTextCallbackData_SelectAll;
    pub const clearSelection = ImGuiInputTextCallbackData_ClearSelection;
    pub const hasSelection = ImGuiInputTextCallbackData_HasSelection;
};
pub const SizeCallbackData = extern struct {
    user_data: ?*anyopaque,
    pos: Vec2,
    current_size: Vec2,
    desired_size: Vec2,
};
pub const WindowClass = extern struct {
    class_id: ID,
    parent_viewport_id: ID,
    viewport_flags_override_set: ViewportFlags,
    viewport_flags_override_clear: ViewportFlags,
    tab_item_flags_override_set: TabItemFlags,
    dock_node_flags_override_set: DockNodeFlags,
    docking_always_tab_bar: bool,
    docking_allow_unclassed: bool,
};
pub const Payload = extern struct {
    data: ?*anyopaque,
    data_size: c_int,
    source_id: ID,
    source_parent_id: ID,
    data_frame_count: c_int,
    data_type: [32 + 1]c_char,
    preview: bool,
    delivery: bool,
    pub const clear = ImGuiPayload_Clear;
    pub const isDataType = ImGuiPayload_IsDataType;
    pub const isPreview = ImGuiPayload_IsPreview;
    pub const isDelivery = ImGuiPayload_IsDelivery;
};
pub const TableColumnSortSpecs = extern struct {
    column_user_id: ID,
    column_index: S16,
    sort_order: S16,
    sort_direction: SortDirection,
};
pub const TableSortSpecs = extern struct {
    specs: ?[*]const TableColumnSortSpecs,
    specs_count: c_int,
    specs_dirty: bool,
};
pub const TextFilter_ImGuiTextRange = extern struct {
    b: ?[*:0]const u8,
    e: ?[*:0]const u8,
};
pub const TextFilter = extern struct {
    input_buf: [256]c_char,
    filters: Vector(TextFilter_ImGuiTextRange),
    count_grep: c_int,
    pub const imGuiTextRange_empty = ImGuiTextFilter_ImGuiTextRange_empty;
    pub const imGuiTextRange_split = ImGuiTextFilter_ImGuiTextRange_split;
    pub const draw = ImGuiTextFilter_Draw;
    pub const passFilter = ImGuiTextFilter_PassFilter;
    pub const build = ImGuiTextFilter_Build;
    pub const clear = ImGuiTextFilter_Clear;
    pub const isActive = ImGuiTextFilter_IsActive;
};
pub const TextBuffer = extern struct {
    buf: Vector(u8),
    pub const begin = ImGuiTextBuffer_begin;
    pub const end = ImGuiTextBuffer_end;
    pub const size = ImGuiTextBuffer_size;
    pub const empty = ImGuiTextBuffer_empty;
    pub const clear = ImGuiTextBuffer_clear;
    pub const reserve = ImGuiTextBuffer_reserve;
    pub const c_str = ImGuiTextBuffer_c_str;
    pub const append = ImGuiTextBuffer_append;
    pub const appendf = ImGuiTextBuffer_appendf;
    pub const appendfv = ImGuiTextBuffer_appendfv;
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
    data: Vector(Storage_ImGuiStoragePair),
    pub const clear = ImGuiStorage_Clear;
    pub const getInt = ImGuiStorage_GetInt;
    pub const setInt = ImGuiStorage_SetInt;
    pub const getBool = ImGuiStorage_GetBool;
    pub const setBool = ImGuiStorage_SetBool;
    pub const getFloat = ImGuiStorage_GetFloat;
    pub const setFloat = ImGuiStorage_SetFloat;
    pub const getVoidPtr = ImGuiStorage_GetVoidPtr;
    pub const setVoidPtr = ImGuiStorage_SetVoidPtr;
    pub const getIntRef = ImGuiStorage_GetIntRef;
    pub const getBoolRef = ImGuiStorage_GetBoolRef;
    pub const getFloatRef = ImGuiStorage_GetFloatRef;
    pub const getVoidPtrRef = ImGuiStorage_GetVoidPtrRef;
    pub const setAllInt = ImGuiStorage_SetAllInt;
    pub const buildSortByKey = ImGuiStorage_BuildSortByKey;
};
pub const ListClipper = extern struct {
    ctx: ?*Context,
    display_start: c_int,
    display_end: c_int,
    items_count: c_int,
    items_height: f32,
    start_pos_y: f32,
    temp_data: ?*anyopaque,
    pub const begin = ImGuiListClipper_Begin;
    pub const end = ImGuiListClipper_End;
    pub const step = ImGuiListClipper_Step;
    pub const includeItemByIndex = ImGuiListClipper_IncludeItemByIndex;
    pub const includeItemsByIndex = ImGuiListClipper_IncludeItemsByIndex;
};
pub const Color = extern struct {
    value: Vec4,
    pub const setHSV = ImColor_SetHSV;
    pub const hSV = ImColor_HSV;
};
pub const DrawCmd = extern struct {
    clip_rect: Vec4,
    texture_id: TextureID,
    vtx_offset: c_uint,
    idx_offset: c_uint,
    elem_count: c_uint,
    user_callback: DrawCallback,
    user_callback_data: ?*anyopaque,
    pub const getTexID = ImDrawCmd_GetTexID;
};
pub const DrawVert = extern struct {
    pos: Vec2,
    uv: Vec2,
    col: U32,
};
pub const DrawCmdHeader = extern struct {
    clip_rect: Vec4,
    texture_id: TextureID,
    vtx_offset: c_uint,
};
pub const DrawChannel = extern struct {
    __cmd_buffer: Vector(DrawCmd),
    __idx_buffer: Vector(DrawIdx),
};
pub const DrawListSplitter = extern struct {
    __current: c_int,
    __count: c_int,
    __channels: Vector(DrawChannel),
    pub const clear = ImDrawListSplitter_Clear;
    pub const clearFreeMemory = ImDrawListSplitter_ClearFreeMemory;
    pub const split = ImDrawListSplitter_Split;
    pub const merge = ImDrawListSplitter_Merge;
    pub const setCurrentChannel = ImDrawListSplitter_SetCurrentChannel;
};
pub const DrawList = extern struct {
    cmd_buffer: Vector(DrawCmd),
    idx_buffer: Vector(DrawIdx),
    vtx_buffer: Vector(DrawVert),
    flags: DrawListFlags,
    __vtx_current_idx: c_uint,
    __data: ?*DrawListSharedData,
    __owner_name: ?[*:0]const u8,
    __vtx_write_ptr: ?[*]DrawVert,
    __idx_write_ptr: ?[*]DrawIdx,
    __clip_rect_stack: Vector(Vec4),
    __texture_id_stack: Vector(TextureID),
    __path: Vector(Vec2),
    __cmd_header: DrawCmdHeader,
    __splitter: DrawListSplitter,
    __fringe_scale: f32,
    pub const pushClipRect = ImDrawList_PushClipRect;
    pub const pushClipRectFullScreen = ImDrawList_PushClipRectFullScreen;
    pub const popClipRect = ImDrawList_PopClipRect;
    pub const pushTextureID = ImDrawList_PushTextureID;
    pub const popTextureID = ImDrawList_PopTextureID;
    pub const getClipRectMin = ImDrawList_GetClipRectMin;
    pub const getClipRectMax = ImDrawList_GetClipRectMax;
    pub const addLine = ImDrawList_AddLine;
    pub const addLineEx = ImDrawList_AddLineEx;
    pub const addRect = ImDrawList_AddRect;
    pub const addRectEx = ImDrawList_AddRectEx;
    pub const addRectFilled = ImDrawList_AddRectFilled;
    pub const addRectFilledEx = ImDrawList_AddRectFilledEx;
    pub const addRectFilledMultiColor = ImDrawList_AddRectFilledMultiColor;
    pub const addQuad = ImDrawList_AddQuad;
    pub const addQuadEx = ImDrawList_AddQuadEx;
    pub const addQuadFilled = ImDrawList_AddQuadFilled;
    pub const addTriangle = ImDrawList_AddTriangle;
    pub const addTriangleEx = ImDrawList_AddTriangleEx;
    pub const addTriangleFilled = ImDrawList_AddTriangleFilled;
    pub const addCircle = ImDrawList_AddCircle;
    pub const addCircleEx = ImDrawList_AddCircleEx;
    pub const addCircleFilled = ImDrawList_AddCircleFilled;
    pub const addNgon = ImDrawList_AddNgon;
    pub const addNgonEx = ImDrawList_AddNgonEx;
    pub const addNgonFilled = ImDrawList_AddNgonFilled;
    pub const addText = ImDrawList_AddText;
    pub const addTextEx = ImDrawList_AddTextEx;
    pub const addTextImFontPtr = ImDrawList_AddTextImFontPtr;
    pub const addTextImFontPtrEx = ImDrawList_AddTextImFontPtrEx;
    pub const addPolyline = ImDrawList_AddPolyline;
    pub const addConvexPolyFilled = ImDrawList_AddConvexPolyFilled;
    pub const addBezierCubic = ImDrawList_AddBezierCubic;
    pub const addBezierQuadratic = ImDrawList_AddBezierQuadratic;
    pub const addImage = ImDrawList_AddImage;
    pub const addImageEx = ImDrawList_AddImageEx;
    pub const addImageQuad = ImDrawList_AddImageQuad;
    pub const addImageQuadEx = ImDrawList_AddImageQuadEx;
    pub const addImageRounded = ImDrawList_AddImageRounded;
    pub const pathClear = ImDrawList_PathClear;
    pub const pathLineTo = ImDrawList_PathLineTo;
    pub const pathLineToMergeDuplicate = ImDrawList_PathLineToMergeDuplicate;
    pub const pathFillConvex = ImDrawList_PathFillConvex;
    pub const pathStroke = ImDrawList_PathStroke;
    pub const pathArcTo = ImDrawList_PathArcTo;
    pub const pathArcToFast = ImDrawList_PathArcToFast;
    pub const pathBezierCubicCurveTo = ImDrawList_PathBezierCubicCurveTo;
    pub const pathBezierQuadraticCurveTo = ImDrawList_PathBezierQuadraticCurveTo;
    pub const pathRect = ImDrawList_PathRect;
    pub const addCallback = ImDrawList_AddCallback;
    pub const addDrawCmd = ImDrawList_AddDrawCmd;
    pub const cloneOutput = ImDrawList_CloneOutput;
    pub const channelsSplit = ImDrawList_ChannelsSplit;
    pub const channelsMerge = ImDrawList_ChannelsMerge;
    pub const channelsSetCurrent = ImDrawList_ChannelsSetCurrent;
    pub const primReserve = ImDrawList_PrimReserve;
    pub const primUnreserve = ImDrawList_PrimUnreserve;
    pub const primRect = ImDrawList_PrimRect;
    pub const primRectUV = ImDrawList_PrimRectUV;
    pub const primQuadUV = ImDrawList_PrimQuadUV;
    pub const primWriteVtx = ImDrawList_PrimWriteVtx;
    pub const primWriteIdx = ImDrawList_PrimWriteIdx;
    pub const primVtx = ImDrawList_PrimVtx;
    pub const resetForNewFrame = ImDrawList__ResetForNewFrame;
    pub const clearFreeMemory = ImDrawList__ClearFreeMemory;
    pub const popUnusedDrawCmd = ImDrawList__PopUnusedDrawCmd;
    pub const tryMergeDrawCmds = ImDrawList__TryMergeDrawCmds;
    pub const onChangedClipRect = ImDrawList__OnChangedClipRect;
    pub const onChangedTextureID = ImDrawList__OnChangedTextureID;
    pub const onChangedVtxOffset = ImDrawList__OnChangedVtxOffset;
    pub const calcCircleAutoSegmentCount = ImDrawList__CalcCircleAutoSegmentCount;
    pub const pathArcToFastEx = ImDrawList__PathArcToFastEx;
    pub const pathArcToN = ImDrawList__PathArcToN;
};
pub const DrawData = extern struct {
    valid: bool,
    cmd_lists_count: c_int,
    total_idx_count: c_int,
    total_vtx_count: c_int,
    cmd_lists: Vector(*DrawList),
    display_pos: Vec2,
    display_size: Vec2,
    framebuffer_scale: Vec2,
    owner_viewport: ?*Viewport,
    pub const clear = ImDrawData_Clear;
    pub const addDrawList = ImDrawData_AddDrawList;
    pub const deIndexAllBuffers = ImDrawData_DeIndexAllBuffers;
    pub const scaleClipRects = ImDrawData_ScaleClipRects;
};
pub const FontConfig = extern struct {
    font_data: ?*anyopaque,
    font_data_size: c_int,
    font_data_owned_by_atlas: bool,
    font_no: c_int,
    size_pixels: f32,
    oversample_h: c_int,
    oversample_v: c_int,
    pixel_snap_h: bool,
    glyph_extra_spacing: Vec2,
    glyph_offset: Vec2,
    glyph_ranges: ?[*]const Wchar,
    glyph_min_advance_x: f32,
    glyph_max_advance_x: f32,
    merge_mode: bool,
    font_builder_flags: c_uint,
    rasterizer_multiply: f32,
    ellipsis_char: Wchar,
    name: [40]c_char,
    dst_font: ?*Font,
};
pub const FontGlyph = extern struct {
    colored: c_uint,
    visible: c_uint,
    codepoint: c_uint,
    advance_x: f32,
    x0: f32,
    y0: f32,
    x1: f32,
    y1: f32,
    u0: f32,
    v0: f32,
    u1: f32,
    v1: f32,
};
pub const FontGlyphRangesBuilder = extern struct {
    used_chars: Vector(U32),
    pub const clear = ImFontGlyphRangesBuilder_Clear;
    pub const getBit = ImFontGlyphRangesBuilder_GetBit;
    pub const setBit = ImFontGlyphRangesBuilder_SetBit;
    pub const addChar = ImFontGlyphRangesBuilder_AddChar;
    pub const addText = ImFontGlyphRangesBuilder_AddText;
    pub const addRanges = ImFontGlyphRangesBuilder_AddRanges;
    pub const buildRanges = ImFontGlyphRangesBuilder_BuildRanges;
};
pub const FontAtlasCustomRect = extern struct {
    width: c_ushort,
    height: c_ushort,
    x: c_ushort,
    y: c_ushort,
    glyph_id: c_uint,
    glyph_advance_x: f32,
    glyph_offset: Vec2,
    font: ?*Font,
    pub const isPacked = ImFontAtlasCustomRect_IsPacked;
};
pub const FontAtlas = extern struct {
    flags: FontAtlasFlags,
    tex_id: TextureID,
    tex_desired_width: c_int,
    tex_glyph_padding: c_int,
    locked: bool,
    user_data: ?*anyopaque,
    tex_ready: bool,
    tex_pixels_use_colors: bool,
    tex_pixels_alpha8: ?[*]c_char,
    tex_pixels_rgba32: ?[*]c_uint,
    tex_width: c_int,
    tex_height: c_int,
    tex_uv_scale: Vec2,
    tex_uv_white_pixel: Vec2,
    fonts: Vector(*Font),
    custom_rects: Vector(FontAtlasCustomRect),
    config_data: Vector(FontConfig),
    tex_uv_lines: [DRAWLIST_TEX_LINES_WIDTH_MAX + 1]Vec4,
    font_builder_io: ?*const FontBuilderIO,
    font_builder_flags: c_uint,
    pack_id_mouse_cursors: c_int,
    pack_id_lines: c_int,
    pub const addFont = ImFontAtlas_AddFont;
    pub const addFontDefault = ImFontAtlas_AddFontDefault;
    pub const addFontFromFileTTF = ImFontAtlas_AddFontFromFileTTF;
    pub const addFontFromMemoryTTF = ImFontAtlas_AddFontFromMemoryTTF;
    pub const addFontFromMemoryCompressedTTF = ImFontAtlas_AddFontFromMemoryCompressedTTF;
    pub const addFontFromMemoryCompressedBase85TTF = ImFontAtlas_AddFontFromMemoryCompressedBase85TTF;
    pub const clearInputData = ImFontAtlas_ClearInputData;
    pub const clearTexData = ImFontAtlas_ClearTexData;
    pub const clearFonts = ImFontAtlas_ClearFonts;
    pub const clear = ImFontAtlas_Clear;
    pub const build = ImFontAtlas_Build;
    pub const getTexDataAsAlpha8 = ImFontAtlas_GetTexDataAsAlpha8;
    pub const getTexDataAsRGBA32 = ImFontAtlas_GetTexDataAsRGBA32;
    pub const isBuilt = ImFontAtlas_IsBuilt;
    pub const setTexID = ImFontAtlas_SetTexID;
    pub const getGlyphRangesDefault = ImFontAtlas_GetGlyphRangesDefault;
    pub const getGlyphRangesGreek = ImFontAtlas_GetGlyphRangesGreek;
    pub const getGlyphRangesKorean = ImFontAtlas_GetGlyphRangesKorean;
    pub const getGlyphRangesJapanese = ImFontAtlas_GetGlyphRangesJapanese;
    pub const getGlyphRangesChineseFull = ImFontAtlas_GetGlyphRangesChineseFull;
    pub const getGlyphRangesChineseSimplifiedCommon = ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon;
    pub const getGlyphRangesCyrillic = ImFontAtlas_GetGlyphRangesCyrillic;
    pub const getGlyphRangesThai = ImFontAtlas_GetGlyphRangesThai;
    pub const getGlyphRangesVietnamese = ImFontAtlas_GetGlyphRangesVietnamese;
    pub const addCustomRectRegular = ImFontAtlas_AddCustomRectRegular;
    pub const addCustomRectFontGlyph = ImFontAtlas_AddCustomRectFontGlyph;
    pub const getCustomRectByIndex = ImFontAtlas_GetCustomRectByIndex;
    pub const calcCustomRectUV = ImFontAtlas_CalcCustomRectUV;
    pub const getMouseCursorTexData = ImFontAtlas_GetMouseCursorTexData;
};
pub const Font = extern struct {
    index_advance_x: Vector(f32),
    fallback_advance_x: f32,
    font_size: f32,
    index_lookup: Vector(Wchar),
    glyphs: Vector(FontGlyph),
    fallback_glyph: ?*const FontGlyph,
    container_atlas: ?*FontAtlas,
    config_data: ?*const FontConfig,
    config_data_count: c_short,
    fallback_char: Wchar,
    ellipsis_char: Wchar,
    ellipsis_char_count: c_short,
    ellipsis_width: f32,
    ellipsis_char_step: f32,
    dirty_lookup_tables: bool,
    scale: f32,
    ascent: f32,
    descent: f32,
    metrics_total_surface: c_int,
    used4k_pages_map: [(UNICODE_CODEPOINT_MAX + 1) / 4096 / 8]U8,
    pub const findGlyph = ImFont_FindGlyph;
    pub const findGlyphNoFallback = ImFont_FindGlyphNoFallback;
    pub const getCharAdvance = ImFont_GetCharAdvance;
    pub const isLoaded = ImFont_IsLoaded;
    pub const getDebugName = ImFont_GetDebugName;
    pub const calcTextSizeA = ImFont_CalcTextSizeA;
    pub const calcTextSizeAEx = ImFont_CalcTextSizeAEx;
    pub const calcWordWrapPositionA = ImFont_CalcWordWrapPositionA;
    pub const renderChar = ImFont_RenderChar;
    pub const renderText = ImFont_RenderText;
    pub const buildLookupTable = ImFont_BuildLookupTable;
    pub const clearOutputData = ImFont_ClearOutputData;
    pub const growIndex = ImFont_GrowIndex;
    pub const addGlyph = ImFont_AddGlyph;
    pub const addRemapChar = ImFont_AddRemapChar;
    pub const setGlyphVisible = ImFont_SetGlyphVisible;
    pub const isGlyphRangeUnused = ImFont_IsGlyphRangeUnused;
};
pub const Viewport = extern struct {
    id: ID,
    flags: ViewportFlags,
    pos: Vec2,
    size: Vec2,
    work_pos: Vec2,
    work_size: Vec2,
    dpi_scale: f32,
    parent_viewport_id: ID,
    draw_data: ?*DrawData,
    renderer_user_data: ?*anyopaque,
    platform_user_data: ?*anyopaque,
    platform_handle: ?*anyopaque,
    platform_handle_raw: ?*anyopaque,
    platform_window_created: bool,
    platform_request_move: bool,
    platform_request_resize: bool,
    platform_request_close: bool,
    pub const getCenter = ImGuiViewport_GetCenter;
    pub const getWorkCenter = ImGuiViewport_GetWorkCenter;
};
pub const PlatformIO = extern struct {
    platform__create_window: ?*const fn (?*Viewport) callconv(.C) void,
    platform__destroy_window: ?*const fn (?*Viewport) callconv(.C) void,
    platform__show_window: ?*const fn (?*Viewport) callconv(.C) void,
    platform__set_window_pos: ?*const fn (?*Viewport, Vec2) callconv(.C) void,
    platform__get_window_pos: ?*const fn (?*Viewport) callconv(.C) Vec2,
    platform__set_window_size: ?*const fn (?*Viewport, Vec2) callconv(.C) void,
    platform__get_window_size: ?*const fn (?*Viewport) callconv(.C) Vec2,
    platform__set_window_focus: ?*const fn (?*Viewport) callconv(.C) void,
    platform__get_window_focus: ?*const fn (?*Viewport) callconv(.C) bool,
    platform__get_window_minimized: ?*const fn (?*Viewport) callconv(.C) bool,
    platform__set_window_title: ?*const fn (?*Viewport, ?[*:0]const u8) callconv(.C) void,
    platform__set_window_alpha: ?*const fn (?*Viewport, f32) callconv(.C) void,
    platform__update_window: ?*const fn (?*Viewport) callconv(.C) void,
    platform__render_window: ?*const fn (?*Viewport, ?*anyopaque) callconv(.C) void,
    platform__swap_buffers: ?*const fn (?*Viewport, ?*anyopaque) callconv(.C) void,
    platform__get_window_dpi_scale: ?*const fn (?*Viewport) callconv(.C) f32,
    platform__on_changed_viewport: ?*const fn (?*Viewport) callconv(.C) void,
    platform__create_vk_surface: ?*const fn (?*Viewport, U64, ?*anyopaque, ?*U64) callconv(.C) c_int,
    renderer__create_window: ?*const fn (?*Viewport) callconv(.C) void,
    renderer__destroy_window: ?*const fn (?*Viewport) callconv(.C) void,
    renderer__set_window_size: ?*const fn (?*Viewport, Vec2) callconv(.C) void,
    renderer__render_window: ?*const fn (?*Viewport, ?*anyopaque) callconv(.C) void,
    renderer__swap_buffers: ?*const fn (?*Viewport, ?*anyopaque) callconv(.C) void,
    monitors: Vector_ImGuiPlatformMonitor,
    viewports: Vector_ImGuiViewportPtr,
};
pub const PlatformMonitor = extern struct {
    main_pos: Vec2,
    main_size: Vec2,
    work_pos: Vec2,
    work_size: Vec2,
    dpi_scale: f32,
    platform_handle: ?*anyopaque,
};
pub const PlatformImeData = extern struct {
    want_visible: bool,
    input_pos: Vec2,
    input_line_height: f32,
};
pub const createContext = ImGui_CreateContext;
pub const destroyContext = ImGui_DestroyContext;
pub const getCurrentContext = ImGui_GetCurrentContext;
pub const setCurrentContext = ImGui_SetCurrentContext;
pub const getIO = ImGui_GetIO;
pub const getStyle = ImGui_GetStyle;
pub const newFrame = ImGui_NewFrame;
pub const endFrame = ImGui_EndFrame;
pub const render = ImGui_Render;
pub const getDrawData = ImGui_GetDrawData;
pub const showDemoWindow = ImGui_ShowDemoWindow;
pub const showMetricsWindow = ImGui_ShowMetricsWindow;
pub const showDebugLogWindow = ImGui_ShowDebugLogWindow;
pub const showStackToolWindow = ImGui_ShowStackToolWindow;
pub const showAboutWindow = ImGui_ShowAboutWindow;
pub const showStyleEditor = ImGui_ShowStyleEditor;
pub const showStyleSelector = ImGui_ShowStyleSelector;
pub const showFontSelector = ImGui_ShowFontSelector;
pub const showUserGuide = ImGui_ShowUserGuide;
pub const getVersion = ImGui_GetVersion;
pub const styleColorsDark = ImGui_StyleColorsDark;
pub const styleColorsLight = ImGui_StyleColorsLight;
pub const styleColorsClassic = ImGui_StyleColorsClassic;
pub const begin = ImGui_Begin;
pub const end = ImGui_End;
pub const beginChild = ImGui_BeginChild;
pub const beginChildID = ImGui_BeginChildID;
pub const endChild = ImGui_EndChild;
pub const isWindowAppearing = ImGui_IsWindowAppearing;
pub const isWindowCollapsed = ImGui_IsWindowCollapsed;
pub const isWindowFocused = ImGui_IsWindowFocused;
pub const isWindowHovered = ImGui_IsWindowHovered;
pub const getWindowDrawList = ImGui_GetWindowDrawList;
pub const getWindowDpiScale = ImGui_GetWindowDpiScale;
pub const getWindowPos = ImGui_GetWindowPos;
pub const getWindowSize = ImGui_GetWindowSize;
pub const getWindowWidth = ImGui_GetWindowWidth;
pub const getWindowHeight = ImGui_GetWindowHeight;
pub const getWindowViewport = ImGui_GetWindowViewport;
pub const setNextWindowPos = ImGui_SetNextWindowPos;
pub const setNextWindowPosEx = ImGui_SetNextWindowPosEx;
pub const setNextWindowSize = ImGui_SetNextWindowSize;
pub const setNextWindowSizeConstraints = ImGui_SetNextWindowSizeConstraints;
pub const setNextWindowContentSize = ImGui_SetNextWindowContentSize;
pub const setNextWindowCollapsed = ImGui_SetNextWindowCollapsed;
pub const setNextWindowFocus = ImGui_SetNextWindowFocus;
pub const setNextWindowScroll = ImGui_SetNextWindowScroll;
pub const setNextWindowBgAlpha = ImGui_SetNextWindowBgAlpha;
pub const setNextWindowViewport = ImGui_SetNextWindowViewport;
pub const setWindowPos = ImGui_SetWindowPos;
pub const setWindowSize = ImGui_SetWindowSize;
pub const setWindowCollapsed = ImGui_SetWindowCollapsed;
pub const setWindowFocus = ImGui_SetWindowFocus;
pub const setWindowFontScale = ImGui_SetWindowFontScale;
pub const setWindowPosStr = ImGui_SetWindowPosStr;
pub const setWindowSizeStr = ImGui_SetWindowSizeStr;
pub const setWindowCollapsedStr = ImGui_SetWindowCollapsedStr;
pub const setWindowFocusStr = ImGui_SetWindowFocusStr;
pub const getContentRegionAvail = ImGui_GetContentRegionAvail;
pub const getContentRegionMax = ImGui_GetContentRegionMax;
pub const getWindowContentRegionMin = ImGui_GetWindowContentRegionMin;
pub const getWindowContentRegionMax = ImGui_GetWindowContentRegionMax;
pub const getScrollX = ImGui_GetScrollX;
pub const getScrollY = ImGui_GetScrollY;
pub const setScrollX = ImGui_SetScrollX;
pub const setScrollY = ImGui_SetScrollY;
pub const getScrollMaxX = ImGui_GetScrollMaxX;
pub const getScrollMaxY = ImGui_GetScrollMaxY;
pub const setScrollHereX = ImGui_SetScrollHereX;
pub const setScrollHereY = ImGui_SetScrollHereY;
pub const setScrollFromPosX = ImGui_SetScrollFromPosX;
pub const setScrollFromPosY = ImGui_SetScrollFromPosY;
pub const pushFont = ImGui_PushFont;
pub const popFont = ImGui_PopFont;
pub const pushStyleColor = ImGui_PushStyleColor;
pub const pushStyleColorImVec4 = ImGui_PushStyleColorImVec4;
pub const popStyleColor = ImGui_PopStyleColor;
pub const popStyleColorEx = ImGui_PopStyleColorEx;
pub const pushStyleVar = ImGui_PushStyleVar;
pub const pushStyleVarImVec2 = ImGui_PushStyleVarImVec2;
pub const popStyleVar = ImGui_PopStyleVar;
pub const popStyleVarEx = ImGui_PopStyleVarEx;
pub const pushTabStop = ImGui_PushTabStop;
pub const popTabStop = ImGui_PopTabStop;
pub const pushButtonRepeat = ImGui_PushButtonRepeat;
pub const popButtonRepeat = ImGui_PopButtonRepeat;
pub const pushItemWidth = ImGui_PushItemWidth;
pub const popItemWidth = ImGui_PopItemWidth;
pub const setNextItemWidth = ImGui_SetNextItemWidth;
pub const calcItemWidth = ImGui_CalcItemWidth;
pub const pushTextWrapPos = ImGui_PushTextWrapPos;
pub const popTextWrapPos = ImGui_PopTextWrapPos;
pub const getFont = ImGui_GetFont;
pub const getFontSize = ImGui_GetFontSize;
pub const getFontTexUvWhitePixel = ImGui_GetFontTexUvWhitePixel;
pub const getColorU32 = ImGui_GetColorU32;
pub const getColorU32Ex = ImGui_GetColorU32Ex;
pub const getColorU32ImVec4 = ImGui_GetColorU32ImVec4;
pub const getColorU32ImU32 = ImGui_GetColorU32ImU32;
pub const getStyleColorVec4 = ImGui_GetStyleColorVec4;
pub const separator = ImGui_Separator;
pub const sameLine = ImGui_SameLine;
pub const sameLineEx = ImGui_SameLineEx;
pub const newLine = ImGui_NewLine;
pub const spacing = ImGui_Spacing;
pub const dummy = ImGui_Dummy;
pub const indent = ImGui_Indent;
pub const indentEx = ImGui_IndentEx;
pub const unindent = ImGui_Unindent;
pub const unindentEx = ImGui_UnindentEx;
pub const beginGroup = ImGui_BeginGroup;
pub const endGroup = ImGui_EndGroup;
pub const getCursorPos = ImGui_GetCursorPos;
pub const getCursorPosX = ImGui_GetCursorPosX;
pub const getCursorPosY = ImGui_GetCursorPosY;
pub const setCursorPos = ImGui_SetCursorPos;
pub const setCursorPosX = ImGui_SetCursorPosX;
pub const setCursorPosY = ImGui_SetCursorPosY;
pub const getCursorStartPos = ImGui_GetCursorStartPos;
pub const getCursorScreenPos = ImGui_GetCursorScreenPos;
pub const setCursorScreenPos = ImGui_SetCursorScreenPos;
pub const alignTextToFramePadding = ImGui_AlignTextToFramePadding;
pub const getTextLineHeight = ImGui_GetTextLineHeight;
pub const getTextLineHeightWithSpacing = ImGui_GetTextLineHeightWithSpacing;
pub const getFrameHeight = ImGui_GetFrameHeight;
pub const getFrameHeightWithSpacing = ImGui_GetFrameHeightWithSpacing;
pub const pushID = ImGui_PushID;
pub const pushIDStr = ImGui_PushIDStr;
pub const pushIDPtr = ImGui_PushIDPtr;
pub const pushIDInt = ImGui_PushIDInt;
pub const popID = ImGui_PopID;
pub const getID = ImGui_GetID;
pub const getIDStr = ImGui_GetIDStr;
pub const getIDPtr = ImGui_GetIDPtr;
pub const textUnformatted = ImGui_TextUnformatted;
pub const textUnformattedEx = ImGui_TextUnformattedEx;
pub const text = ImGui_Text;
pub const textV = ImGui_TextV;
pub const textColored = ImGui_TextColored;
pub const textColoredV = ImGui_TextColoredV;
pub const textDisabled = ImGui_TextDisabled;
pub const textDisabledV = ImGui_TextDisabledV;
pub const textWrapped = ImGui_TextWrapped;
pub const textWrappedV = ImGui_TextWrappedV;
pub const labelText = ImGui_LabelText;
pub const labelTextV = ImGui_LabelTextV;
pub const bulletText = ImGui_BulletText;
pub const bulletTextV = ImGui_BulletTextV;
pub const separatorText = ImGui_SeparatorText;
pub const button = ImGui_Button;
pub const buttonEx = ImGui_ButtonEx;
pub const smallButton = ImGui_SmallButton;
pub const invisibleButton = ImGui_InvisibleButton;
pub const arrowButton = ImGui_ArrowButton;
pub const checkbox = ImGui_Checkbox;
pub const checkboxFlagsIntPtr = ImGui_CheckboxFlagsIntPtr;
pub const checkboxFlagsUintPtr = ImGui_CheckboxFlagsUintPtr;
pub const radioButton = ImGui_RadioButton;
pub const radioButtonIntPtr = ImGui_RadioButtonIntPtr;
pub const progressBar = ImGui_ProgressBar;
pub const bullet = ImGui_Bullet;
pub const image = ImGui_Image;
pub const imageEx = ImGui_ImageEx;
pub const imageButton = ImGui_ImageButton;
pub const imageButtonEx = ImGui_ImageButtonEx;
pub const beginCombo = ImGui_BeginCombo;
pub const endCombo = ImGui_EndCombo;
pub const comboChar = ImGui_ComboChar;
pub const comboCharEx = ImGui_ComboCharEx;
pub const combo = ImGui_Combo;
pub const comboEx = ImGui_ComboEx;
pub const comboCallback = ImGui_ComboCallback;
pub const comboCallbackEx = ImGui_ComboCallbackEx;
pub const dragFloat = ImGui_DragFloat;
pub const dragFloatEx = ImGui_DragFloatEx;
pub const dragFloat2 = ImGui_DragFloat2;
pub const dragFloat2Ex = ImGui_DragFloat2Ex;
pub const dragFloat3 = ImGui_DragFloat3;
pub const dragFloat3Ex = ImGui_DragFloat3Ex;
pub const dragFloat4 = ImGui_DragFloat4;
pub const dragFloat4Ex = ImGui_DragFloat4Ex;
pub const dragFloatRange2 = ImGui_DragFloatRange2;
pub const dragFloatRange2Ex = ImGui_DragFloatRange2Ex;
pub const dragInt = ImGui_DragInt;
pub const dragIntEx = ImGui_DragIntEx;
pub const dragInt2 = ImGui_DragInt2;
pub const dragInt2Ex = ImGui_DragInt2Ex;
pub const dragInt3 = ImGui_DragInt3;
pub const dragInt3Ex = ImGui_DragInt3Ex;
pub const dragInt4 = ImGui_DragInt4;
pub const dragInt4Ex = ImGui_DragInt4Ex;
pub const dragIntRange2 = ImGui_DragIntRange2;
pub const dragIntRange2Ex = ImGui_DragIntRange2Ex;
pub const dragScalar = ImGui_DragScalar;
pub const dragScalarEx = ImGui_DragScalarEx;
pub const dragScalarN = ImGui_DragScalarN;
pub const dragScalarNEx = ImGui_DragScalarNEx;
pub const sliderFloat = ImGui_SliderFloat;
pub const sliderFloatEx = ImGui_SliderFloatEx;
pub const sliderFloat2 = ImGui_SliderFloat2;
pub const sliderFloat2Ex = ImGui_SliderFloat2Ex;
pub const sliderFloat3 = ImGui_SliderFloat3;
pub const sliderFloat3Ex = ImGui_SliderFloat3Ex;
pub const sliderFloat4 = ImGui_SliderFloat4;
pub const sliderFloat4Ex = ImGui_SliderFloat4Ex;
pub const sliderAngle = ImGui_SliderAngle;
pub const sliderAngleEx = ImGui_SliderAngleEx;
pub const sliderInt = ImGui_SliderInt;
pub const sliderIntEx = ImGui_SliderIntEx;
pub const sliderInt2 = ImGui_SliderInt2;
pub const sliderInt2Ex = ImGui_SliderInt2Ex;
pub const sliderInt3 = ImGui_SliderInt3;
pub const sliderInt3Ex = ImGui_SliderInt3Ex;
pub const sliderInt4 = ImGui_SliderInt4;
pub const sliderInt4Ex = ImGui_SliderInt4Ex;
pub const sliderScalar = ImGui_SliderScalar;
pub const sliderScalarEx = ImGui_SliderScalarEx;
pub const sliderScalarN = ImGui_SliderScalarN;
pub const sliderScalarNEx = ImGui_SliderScalarNEx;
pub const vSliderFloat = ImGui_VSliderFloat;
pub const vSliderFloatEx = ImGui_VSliderFloatEx;
pub const vSliderInt = ImGui_VSliderInt;
pub const vSliderIntEx = ImGui_VSliderIntEx;
pub const vSliderScalar = ImGui_VSliderScalar;
pub const vSliderScalarEx = ImGui_VSliderScalarEx;
pub const inputText = ImGui_InputText;
pub const inputTextEx = ImGui_InputTextEx;
pub const inputTextMultiline = ImGui_InputTextMultiline;
pub const inputTextMultilineEx = ImGui_InputTextMultilineEx;
pub const inputTextWithHint = ImGui_InputTextWithHint;
pub const inputTextWithHintEx = ImGui_InputTextWithHintEx;
pub const inputFloat = ImGui_InputFloat;
pub const inputFloatEx = ImGui_InputFloatEx;
pub const inputFloat2 = ImGui_InputFloat2;
pub const inputFloat2Ex = ImGui_InputFloat2Ex;
pub const inputFloat3 = ImGui_InputFloat3;
pub const inputFloat3Ex = ImGui_InputFloat3Ex;
pub const inputFloat4 = ImGui_InputFloat4;
pub const inputFloat4Ex = ImGui_InputFloat4Ex;
pub const inputInt = ImGui_InputInt;
pub const inputIntEx = ImGui_InputIntEx;
pub const inputInt2 = ImGui_InputInt2;
pub const inputInt3 = ImGui_InputInt3;
pub const inputInt4 = ImGui_InputInt4;
pub const inputDouble = ImGui_InputDouble;
pub const inputDoubleEx = ImGui_InputDoubleEx;
pub const inputScalar = ImGui_InputScalar;
pub const inputScalarEx = ImGui_InputScalarEx;
pub const inputScalarN = ImGui_InputScalarN;
pub const inputScalarNEx = ImGui_InputScalarNEx;
pub const colorEdit3 = ImGui_ColorEdit3;
pub const colorEdit4 = ImGui_ColorEdit4;
pub const colorPicker3 = ImGui_ColorPicker3;
pub const colorPicker4 = ImGui_ColorPicker4;
pub const colorButton = ImGui_ColorButton;
pub const colorButtonEx = ImGui_ColorButtonEx;
pub const setColorEditOptions = ImGui_SetColorEditOptions;
pub const treeNode = ImGui_TreeNode;
pub const treeNodeStr = ImGui_TreeNodeStr;
pub const treeNodePtr = ImGui_TreeNodePtr;
pub const treeNodeV = ImGui_TreeNodeV;
pub const treeNodeVPtr = ImGui_TreeNodeVPtr;
pub const treeNodeEx = ImGui_TreeNodeEx;
pub const treeNodeExStr = ImGui_TreeNodeExStr;
pub const treeNodeExPtr = ImGui_TreeNodeExPtr;
pub const treeNodeExV = ImGui_TreeNodeExV;
pub const treeNodeExVPtr = ImGui_TreeNodeExVPtr;
pub const treePush = ImGui_TreePush;
pub const treePushPtr = ImGui_TreePushPtr;
pub const treePop = ImGui_TreePop;
pub const getTreeNodeToLabelSpacing = ImGui_GetTreeNodeToLabelSpacing;
pub const collapsingHeader = ImGui_CollapsingHeader;
pub const collapsingHeaderBoolPtr = ImGui_CollapsingHeaderBoolPtr;
pub const setNextItemOpen = ImGui_SetNextItemOpen;
pub const selectable = ImGui_Selectable;
pub const selectableEx = ImGui_SelectableEx;
pub const selectableBoolPtr = ImGui_SelectableBoolPtr;
pub const selectableBoolPtrEx = ImGui_SelectableBoolPtrEx;
pub const beginListBox = ImGui_BeginListBox;
pub const endListBox = ImGui_EndListBox;
pub const listBox = ImGui_ListBox;
pub const listBoxCallback = ImGui_ListBoxCallback;
pub const listBoxCallbackEx = ImGui_ListBoxCallbackEx;
pub const plotLines = ImGui_PlotLines;
pub const plotLinesEx = ImGui_PlotLinesEx;
pub const plotLinesCallback = ImGui_PlotLinesCallback;
pub const plotLinesCallbackEx = ImGui_PlotLinesCallbackEx;
pub const plotHistogram = ImGui_PlotHistogram;
pub const plotHistogramEx = ImGui_PlotHistogramEx;
pub const plotHistogramCallback = ImGui_PlotHistogramCallback;
pub const plotHistogramCallbackEx = ImGui_PlotHistogramCallbackEx;
pub const beginMenuBar = ImGui_BeginMenuBar;
pub const endMenuBar = ImGui_EndMenuBar;
pub const beginMainMenuBar = ImGui_BeginMainMenuBar;
pub const endMainMenuBar = ImGui_EndMainMenuBar;
pub const beginMenu = ImGui_BeginMenu;
pub const beginMenuEx = ImGui_BeginMenuEx;
pub const endMenu = ImGui_EndMenu;
pub const menuItem = ImGui_MenuItem;
pub const menuItemEx = ImGui_MenuItemEx;
pub const menuItemBoolPtr = ImGui_MenuItemBoolPtr;
pub const beginTooltip = ImGui_BeginTooltip;
pub const endTooltip = ImGui_EndTooltip;
pub const setTooltip = ImGui_SetTooltip;
pub const setTooltipV = ImGui_SetTooltipV;
pub const beginItemTooltip = ImGui_BeginItemTooltip;
pub const setItemTooltip = ImGui_SetItemTooltip;
pub const setItemTooltipV = ImGui_SetItemTooltipV;
pub const beginPopup = ImGui_BeginPopup;
pub const beginPopupModal = ImGui_BeginPopupModal;
pub const endPopup = ImGui_EndPopup;
pub const openPopup = ImGui_OpenPopup;
pub const openPopupID = ImGui_OpenPopupID;
pub const openPopupOnItemClick = ImGui_OpenPopupOnItemClick;
pub const closeCurrentPopup = ImGui_CloseCurrentPopup;
pub const beginPopupContextItem = ImGui_BeginPopupContextItem;
pub const beginPopupContextItemEx = ImGui_BeginPopupContextItemEx;
pub const beginPopupContextWindow = ImGui_BeginPopupContextWindow;
pub const beginPopupContextWindowEx = ImGui_BeginPopupContextWindowEx;
pub const beginPopupContextVoid = ImGui_BeginPopupContextVoid;
pub const beginPopupContextVoidEx = ImGui_BeginPopupContextVoidEx;
pub const isPopupOpen = ImGui_IsPopupOpen;
pub const beginTable = ImGui_BeginTable;
pub const beginTableEx = ImGui_BeginTableEx;
pub const endTable = ImGui_EndTable;
pub const tableNextRow = ImGui_TableNextRow;
pub const tableNextRowEx = ImGui_TableNextRowEx;
pub const tableNextColumn = ImGui_TableNextColumn;
pub const tableSetColumnIndex = ImGui_TableSetColumnIndex;
pub const tableSetupColumn = ImGui_TableSetupColumn;
pub const tableSetupColumnEx = ImGui_TableSetupColumnEx;
pub const tableSetupScrollFreeze = ImGui_TableSetupScrollFreeze;
pub const tableHeadersRow = ImGui_TableHeadersRow;
pub const tableHeader = ImGui_TableHeader;
pub const tableGetSortSpecs = ImGui_TableGetSortSpecs;
pub const tableGetColumnCount = ImGui_TableGetColumnCount;
pub const tableGetColumnIndex = ImGui_TableGetColumnIndex;
pub const tableGetRowIndex = ImGui_TableGetRowIndex;
pub const tableGetColumnName = ImGui_TableGetColumnName;
pub const tableGetColumnFlags = ImGui_TableGetColumnFlags;
pub const tableSetColumnEnabled = ImGui_TableSetColumnEnabled;
pub const tableSetBgColor = ImGui_TableSetBgColor;
pub const columns = ImGui_Columns;
pub const columnsEx = ImGui_ColumnsEx;
pub const nextColumn = ImGui_NextColumn;
pub const getColumnIndex = ImGui_GetColumnIndex;
pub const getColumnWidth = ImGui_GetColumnWidth;
pub const setColumnWidth = ImGui_SetColumnWidth;
pub const getColumnOffset = ImGui_GetColumnOffset;
pub const setColumnOffset = ImGui_SetColumnOffset;
pub const getColumnsCount = ImGui_GetColumnsCount;
pub const beginTabBar = ImGui_BeginTabBar;
pub const endTabBar = ImGui_EndTabBar;
pub const beginTabItem = ImGui_BeginTabItem;
pub const endTabItem = ImGui_EndTabItem;
pub const tabItemButton = ImGui_TabItemButton;
pub const setTabItemClosed = ImGui_SetTabItemClosed;
pub const dockSpace = ImGui_DockSpace;
pub const dockSpaceEx = ImGui_DockSpaceEx;
pub const dockSpaceOverViewport = ImGui_DockSpaceOverViewport;
pub const dockSpaceOverViewportEx = ImGui_DockSpaceOverViewportEx;
pub const setNextWindowDockID = ImGui_SetNextWindowDockID;
pub const setNextWindowClass = ImGui_SetNextWindowClass;
pub const getWindowDockID = ImGui_GetWindowDockID;
pub const isWindowDocked = ImGui_IsWindowDocked;
pub const logToTTY = ImGui_LogToTTY;
pub const logToFile = ImGui_LogToFile;
pub const logToClipboard = ImGui_LogToClipboard;
pub const logFinish = ImGui_LogFinish;
pub const logButtons = ImGui_LogButtons;
pub const logText = ImGui_LogText;
pub const logTextV = ImGui_LogTextV;
pub const beginDragDropSource = ImGui_BeginDragDropSource;
pub const setDragDropPayload = ImGui_SetDragDropPayload;
pub const endDragDropSource = ImGui_EndDragDropSource;
pub const beginDragDropTarget = ImGui_BeginDragDropTarget;
pub const acceptDragDropPayload = ImGui_AcceptDragDropPayload;
pub const endDragDropTarget = ImGui_EndDragDropTarget;
pub const getDragDropPayload = ImGui_GetDragDropPayload;
pub const beginDisabled = ImGui_BeginDisabled;
pub const endDisabled = ImGui_EndDisabled;
pub const pushClipRect = ImGui_PushClipRect;
pub const popClipRect = ImGui_PopClipRect;
pub const setItemDefaultFocus = ImGui_SetItemDefaultFocus;
pub const setKeyboardFocusHere = ImGui_SetKeyboardFocusHere;
pub const setKeyboardFocusHereEx = ImGui_SetKeyboardFocusHereEx;
pub const setNextItemAllowOverlap = ImGui_SetNextItemAllowOverlap;
pub const isItemHovered = ImGui_IsItemHovered;
pub const isItemActive = ImGui_IsItemActive;
pub const isItemFocused = ImGui_IsItemFocused;
pub const isItemClicked = ImGui_IsItemClicked;
pub const isItemClickedEx = ImGui_IsItemClickedEx;
pub const isItemVisible = ImGui_IsItemVisible;
pub const isItemEdited = ImGui_IsItemEdited;
pub const isItemActivated = ImGui_IsItemActivated;
pub const isItemDeactivated = ImGui_IsItemDeactivated;
pub const isItemDeactivatedAfterEdit = ImGui_IsItemDeactivatedAfterEdit;
pub const isItemToggledOpen = ImGui_IsItemToggledOpen;
pub const isAnyItemHovered = ImGui_IsAnyItemHovered;
pub const isAnyItemActive = ImGui_IsAnyItemActive;
pub const isAnyItemFocused = ImGui_IsAnyItemFocused;
pub const getItemID = ImGui_GetItemID;
pub const getItemRectMin = ImGui_GetItemRectMin;
pub const getItemRectMax = ImGui_GetItemRectMax;
pub const getItemRectSize = ImGui_GetItemRectSize;
pub const getMainViewport = ImGui_GetMainViewport;
pub const getBackgroundDrawList = ImGui_GetBackgroundDrawList;
pub const getForegroundDrawList = ImGui_GetForegroundDrawList;
pub const getBackgroundDrawListImGuiViewportPtr = ImGui_GetBackgroundDrawListImGuiViewportPtr;
pub const getForegroundDrawListImGuiViewportPtr = ImGui_GetForegroundDrawListImGuiViewportPtr;
pub const isRectVisibleBySize = ImGui_IsRectVisibleBySize;
pub const isRectVisible = ImGui_IsRectVisible;
pub const getTime = ImGui_GetTime;
pub const getFrameCount = ImGui_GetFrameCount;
pub const getDrawListSharedData = ImGui_GetDrawListSharedData;
pub const getStyleColorName = ImGui_GetStyleColorName;
pub const setStateStorage = ImGui_SetStateStorage;
pub const getStateStorage = ImGui_GetStateStorage;
pub const beginChildFrame = ImGui_BeginChildFrame;
pub const endChildFrame = ImGui_EndChildFrame;
pub const calcTextSize = ImGui_CalcTextSize;
pub const calcTextSizeEx = ImGui_CalcTextSizeEx;
pub const colorConvertU32ToFloat4 = ImGui_ColorConvertU32ToFloat4;
pub const colorConvertFloat4ToU32 = ImGui_ColorConvertFloat4ToU32;
pub const colorConvertRGBtoHSV = ImGui_ColorConvertRGBtoHSV;
pub const colorConvertHSVtoRGB = ImGui_ColorConvertHSVtoRGB;
pub const isKeyDown = ImGui_IsKeyDown;
pub const isKeyPressed = ImGui_IsKeyPressed;
pub const isKeyPressedEx = ImGui_IsKeyPressedEx;
pub const isKeyReleased = ImGui_IsKeyReleased;
pub const getKeyPressedAmount = ImGui_GetKeyPressedAmount;
pub const getKeyName = ImGui_GetKeyName;
pub const setNextFrameWantCaptureKeyboard = ImGui_SetNextFrameWantCaptureKeyboard;
pub const isMouseDown = ImGui_IsMouseDown;
pub const isMouseClicked = ImGui_IsMouseClicked;
pub const isMouseClickedEx = ImGui_IsMouseClickedEx;
pub const isMouseReleased = ImGui_IsMouseReleased;
pub const isMouseDoubleClicked = ImGui_IsMouseDoubleClicked;
pub const getMouseClickedCount = ImGui_GetMouseClickedCount;
pub const isMouseHoveringRect = ImGui_IsMouseHoveringRect;
pub const isMouseHoveringRectEx = ImGui_IsMouseHoveringRectEx;
pub const isMousePosValid = ImGui_IsMousePosValid;
pub const isAnyMouseDown = ImGui_IsAnyMouseDown;
pub const getMousePos = ImGui_GetMousePos;
pub const getMousePosOnOpeningCurrentPopup = ImGui_GetMousePosOnOpeningCurrentPopup;
pub const isMouseDragging = ImGui_IsMouseDragging;
pub const getMouseDragDelta = ImGui_GetMouseDragDelta;
pub const resetMouseDragDelta = ImGui_ResetMouseDragDelta;
pub const resetMouseDragDeltaEx = ImGui_ResetMouseDragDeltaEx;
pub const getMouseCursor = ImGui_GetMouseCursor;
pub const setMouseCursor = ImGui_SetMouseCursor;
pub const setNextFrameWantCaptureMouse = ImGui_SetNextFrameWantCaptureMouse;
pub const getClipboardText = ImGui_GetClipboardText;
pub const setClipboardText = ImGui_SetClipboardText;
pub const loadIniSettingsFromDisk = ImGui_LoadIniSettingsFromDisk;
pub const loadIniSettingsFromMemory = ImGui_LoadIniSettingsFromMemory;
pub const saveIniSettingsToDisk = ImGui_SaveIniSettingsToDisk;
pub const saveIniSettingsToMemory = ImGui_SaveIniSettingsToMemory;
pub const debugTextEncoding = ImGui_DebugTextEncoding;
pub const debugCheckVersionAndDataLayout = ImGui_DebugCheckVersionAndDataLayout;
pub const setAllocatorFunctions = ImGui_SetAllocatorFunctions;
pub const getAllocatorFunctions = ImGui_GetAllocatorFunctions;
pub const memAlloc = ImGui_MemAlloc;
pub const memFree = ImGui_MemFree;
pub const getPlatformIO = ImGui_GetPlatformIO;
pub const updatePlatformWindows = ImGui_UpdatePlatformWindows;
pub const renderPlatformWindowsDefault = ImGui_RenderPlatformWindowsDefault;
pub const renderPlatformWindowsDefaultEx = ImGui_RenderPlatformWindowsDefaultEx;
pub const destroyPlatformWindows = ImGui_DestroyPlatformWindows;
pub const findViewportByID = ImGui_FindViewportByID;
pub const findViewportByPlatformHandle = ImGui_FindViewportByPlatformHandle;
pub const vector_Construct = ImVector_Construct;
pub const vector_Destruct = ImVector_Destruct;
pub const getKeyIndex = ImGui_GetKeyIndex;
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
extern fn ImGui_ShowStackToolWindow(p_open: ?*bool) void;
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
extern fn ImGui_GetWindowDpiScale() f32;
extern fn ImGui_GetWindowPos() Vec2;
extern fn ImGui_GetWindowSize() Vec2;
extern fn ImGui_GetWindowWidth() f32;
extern fn ImGui_GetWindowHeight() f32;
extern fn ImGui_GetWindowViewport() ?*Viewport;
extern fn ImGui_SetNextWindowPos(pos: Vec2, cond: Cond) void;
extern fn ImGui_SetNextWindowPosEx(pos: Vec2, cond: Cond, pivot: Vec2) void;
extern fn ImGui_SetNextWindowSize(size: Vec2, cond: Cond) void;
extern fn ImGui_SetNextWindowSizeConstraints(size_min: Vec2, size_max: Vec2, custom_callback: SizeCallback, custom_callback_data: ?*anyopaque) void;
extern fn ImGui_SetNextWindowContentSize(size: Vec2) void;
extern fn ImGui_SetNextWindowCollapsed(collapsed: bool, cond: Cond) void;
extern fn ImGui_SetNextWindowFocus() void;
extern fn ImGui_SetNextWindowScroll(scroll: Vec2) void;
extern fn ImGui_SetNextWindowBgAlpha(alpha: f32) void;
extern fn ImGui_SetNextWindowViewport(viewport_id: ID) void;
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
extern fn ImGui_GetCursorPos() Vec2;
extern fn ImGui_GetCursorPosX() f32;
extern fn ImGui_GetCursorPosY() f32;
extern fn ImGui_SetCursorPos(local_pos: Vec2) void;
extern fn ImGui_SetCursorPosX(local_x: f32) void;
extern fn ImGui_SetCursorPosY(local_y: f32) void;
extern fn ImGui_GetCursorStartPos() Vec2;
extern fn ImGui_GetCursorScreenPos() Vec2;
extern fn ImGui_SetCursorScreenPos(pos: Vec2) void;
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
extern fn ImGui_TextColoredV(col: Vec4, fmt: ?[*:0]const u8, args: c.va_list) void;
extern fn ImGui_TextDisabled(fmt: ?[*:0]const u8, ...) void;
extern fn ImGui_TextDisabledV(fmt: ?[*:0]const u8, args: c.va_list) void;
extern fn ImGui_TextWrapped(fmt: ?[*:0]const u8, ...) void;
extern fn ImGui_TextWrappedV(fmt: ?[*:0]const u8, args: c.va_list) void;
extern fn ImGui_LabelText(label: ?[*:0]const u8, fmt: ?[*:0]const u8, ...) void;
extern fn ImGui_LabelTextV(label: ?[*:0]const u8, fmt: ?[*:0]const u8, args: c.va_list) void;
extern fn ImGui_BulletText(fmt: ?[*:0]const u8, ...) void;
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
extern fn ImGui_ImageButton(str_id: ?[*:0]const u8, user_texture_id: TextureID, size: Vec2) bool;
extern fn ImGui_ImageButtonEx(str_id: ?[*:0]const u8, user_texture_id: TextureID, size: Vec2, uv0: Vec2, uv1: Vec2, bg_col: Vec4, tint_col: Vec4) bool;
extern fn ImGui_BeginCombo(label: ?[*:0]const u8, preview_value: ?[*:0]const u8, flags: ComboFlags) bool;
extern fn ImGui_EndCombo() void;
extern fn ImGui_ComboChar(label: ?[*:0]const u8, current_item: ?*c_int, items: [*]const ?[*:0]const u8, items_count: c_int) bool;
extern fn ImGui_ComboCharEx(label: ?[*:0]const u8, current_item: ?*c_int, items: [*]const ?[*:0]const u8, items_count: c_int, popup_max_height_in_items: c_int) bool;
extern fn ImGui_Combo(label: ?[*:0]const u8, current_item: ?*c_int, items_separated_by_zeros: ?[*:0]const u8) bool;
extern fn ImGui_ComboEx(label: ?[*:0]const u8, current_item: ?*c_int, items_separated_by_zeros: ?[*:0]const u8, popup_max_height_in_items: c_int) bool;
extern fn ImGui_ComboCallback(label: ?[*:0]const u8, current_item: ?*c_int, items_getter: ?*const fn (?*anyopaque, c_int, ?*?[*:0]const u8) callconv(.C) bool, data: ?*anyopaque, items_count: c_int) bool;
extern fn ImGui_ComboCallbackEx(label: ?[*:0]const u8, current_item: ?*c_int, items_getter: ?*const fn (?*anyopaque, c_int, ?*?[*:0]const u8) callconv(.C) bool, data: ?*anyopaque, items_count: c_int, popup_max_height_in_items: c_int) bool;
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
extern fn ImGui_TreeNodePtr(ptr_id: ?*anyopaque, fmt: ?[*:0]const u8, ...) bool;
extern fn ImGui_TreeNodeV(str_id: ?[*:0]const u8, fmt: ?[*:0]const u8, args: c.va_list) bool;
extern fn ImGui_TreeNodeVPtr(ptr_id: ?*anyopaque, fmt: ?[*:0]const u8, args: c.va_list) bool;
extern fn ImGui_TreeNodeEx(label: ?[*:0]const u8, flags: TreeNodeFlags) bool;
extern fn ImGui_TreeNodeExStr(str_id: ?[*:0]const u8, flags: TreeNodeFlags, fmt: ?[*:0]const u8, ...) bool;
extern fn ImGui_TreeNodeExPtr(ptr_id: ?*anyopaque, flags: TreeNodeFlags, fmt: ?[*:0]const u8, ...) bool;
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
extern fn ImGui_ListBoxCallback(label: ?[*:0]const u8, current_item: ?*c_int, items_getter: ?*const fn (?*anyopaque, c_int, ?*?[*:0]const u8) callconv(.C) bool, data: ?*anyopaque, items_count: c_int) bool;
extern fn ImGui_ListBoxCallbackEx(label: ?[*:0]const u8, current_item: ?*c_int, items_getter: ?*const fn (?*anyopaque, c_int, ?*?[*:0]const u8) callconv(.C) bool, data: ?*anyopaque, items_count: c_int, height_in_items: c_int) bool;
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
extern fn ImGui_SetTooltipV(fmt: ?[*:0]const u8, args: c.va_list) void;
extern fn ImGui_BeginItemTooltip() bool;
extern fn ImGui_SetItemTooltip(fmt: ?[*:0]const u8, ...) void;
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
extern fn ImGui_TableHeadersRow() void;
extern fn ImGui_TableHeader(label: ?[*:0]const u8) void;
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
extern fn ImGui_DockSpace(id: ID) ID;
extern fn ImGui_DockSpaceEx(id: ID, size: Vec2, flags: DockNodeFlags, window_class: ?*const WindowClass) ID;
extern fn ImGui_DockSpaceOverViewport() ID;
extern fn ImGui_DockSpaceOverViewportEx(viewport: ?*const Viewport, flags: DockNodeFlags, window_class: ?*const WindowClass) ID;
extern fn ImGui_SetNextWindowDockID(dock_id: ID, cond: Cond) void;
extern fn ImGui_SetNextWindowClass(window_class: ?*const WindowClass) void;
extern fn ImGui_GetWindowDockID() ID;
extern fn ImGui_IsWindowDocked() bool;
extern fn ImGui_LogToTTY(auto_open_depth: c_int) void;
extern fn ImGui_LogToFile(auto_open_depth: c_int, filename: ?[*:0]const u8) void;
extern fn ImGui_LogToClipboard(auto_open_depth: c_int) void;
extern fn ImGui_LogFinish() void;
extern fn ImGui_LogButtons() void;
extern fn ImGui_LogText(fmt: ?[*:0]const u8, ...) void;
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
extern fn ImGui_GetBackgroundDrawListImGuiViewportPtr(viewport: ?*Viewport) ?*DrawList;
extern fn ImGui_GetForegroundDrawListImGuiViewportPtr(viewport: ?*Viewport) ?*DrawList;
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
extern fn ImGui_GetPlatformIO() *PlatformIO;
extern fn ImGui_UpdatePlatformWindows() void;
extern fn ImGui_RenderPlatformWindowsDefault() void;
extern fn ImGui_RenderPlatformWindowsDefaultEx(platform_render_arg: ?*anyopaque, renderer_render_arg: ?*anyopaque) void;
extern fn ImGui_DestroyPlatformWindows() void;
extern fn ImGui_FindViewportByID(id: ID) ?*Viewport;
extern fn ImGui_FindViewportByPlatformHandle(platform_handle: ?*anyopaque) ?*Viewport;
extern fn ImVector_Construct(vector: ?*anyopaque) void;
extern fn ImVector_Destruct(vector: ?*anyopaque) void;
extern fn ImGuiStyle_ScaleAllSizes(self: *Style, scale_factor: f32) void;
extern fn ImGuiIO_AddKeyEvent(self: *IO, key: Key, down: bool) void;
extern fn ImGuiIO_AddKeyAnalogEvent(self: *IO, key: Key, down: bool, v: f32) void;
extern fn ImGuiIO_AddMousePosEvent(self: *IO, x: f32, y: f32) void;
extern fn ImGuiIO_AddMouseButtonEvent(self: *IO, button: c_int, down: bool) void;
extern fn ImGuiIO_AddMouseWheelEvent(self: *IO, wheel_x: f32, wheel_y: f32) void;
extern fn ImGuiIO_AddMouseSourceEvent(self: *IO, source: MouseSource) void;
extern fn ImGuiIO_AddMouseViewportEvent(self: *IO, id: ID) void;
extern fn ImGuiIO_AddFocusEvent(self: *IO, focused: bool) void;
extern fn ImGuiIO_AddInputCharacter(self: *IO, c: c_uint) void;
extern fn ImGuiIO_AddInputCharacterUTF16(self: *IO, c: Wchar16) void;
extern fn ImGuiIO_AddInputCharactersUTF8(self: *IO, str: ?[*:0]const u8) void;
extern fn ImGuiIO_SetKeyEventNativeData(self: *IO, key: Key, native_keycode: c_int, native_scancode: c_int) void;
extern fn ImGuiIO_SetKeyEventNativeDataEx(self: *IO, key: Key, native_keycode: c_int, native_scancode: c_int, native_legacy_index: c_int) void;
extern fn ImGuiIO_SetAppAcceptingEvents(self: *IO, accepting_events: bool) void;
extern fn ImGuiIO_ClearEventsQueue(self: *IO) void;
extern fn ImGuiIO_ClearInputKeys(self: *IO) void;
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
extern fn ImGuiTextFilter_ImGuiTextRange_split(self: *const TextFilter_ImGuiTextRange, separator: c_char, out: ?*Vector(TextFilter_ImGuiTextRange)) void;
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
extern fn ImFontGlyphRangesBuilder_BuildRanges(self: *FontGlyphRangesBuilder, out_ranges: ?*Vector(Wchar)) void;
extern fn ImFontAtlasCustomRect_IsPacked(self: *const FontAtlasCustomRect) bool;
extern fn ImFontAtlas_AddFont(self: *FontAtlas, font_cfg: ?*const FontConfig) ?*Font;
extern fn ImFontAtlas_AddFontDefault(self: *FontAtlas, font_cfg: ?*const FontConfig) ?*Font;
extern fn ImFontAtlas_AddFontFromFileTTF(self: *FontAtlas, filename: ?[*:0]const u8, size_pixels: f32, font_cfg: ?*const FontConfig, glyph_ranges: ?*const Wchar) ?*Font;
extern fn ImFontAtlas_AddFontFromMemoryTTF(self: *FontAtlas, font_data: ?*anyopaque, font_size: c_int, size_pixels: f32, font_cfg: ?*const FontConfig, glyph_ranges: ?*const Wchar) ?*Font;
extern fn ImFontAtlas_AddFontFromMemoryCompressedTTF(self: *FontAtlas, compressed_font_data: ?*anyopaque, compressed_font_size: c_int, size_pixels: f32, font_cfg: ?*const FontConfig, glyph_ranges: ?*const Wchar) ?*Font;
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
extern fn ImGui_GetKeyIndex(key: Key) Key;
test {
    std.testing.refAllDeclsRecursive(@This());
}
