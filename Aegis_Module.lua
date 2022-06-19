--Services
local UserInputService = game:GetService("UserInputService");
local TweenService = game:GetService("TweenService");
local TextService = game:GetService("TextService")
local CoreGui = game:GetService('CoreGui');
local RenderStepped = game:GetService("RunService").RenderStepped;
local LocalPlayer = game:GetService("Players").LocalPlayer;
local Mouse = LocalPlayer:GetMouse();

--Load Modules
local Api = loadstring(game:HttpGet("https://raw.githubusercontent.com/DocsFoxr/Aegis-Hub-Library/main/modules/Api.lua"))();
loadstring(game:HttpGet("https://raw.githubusercontent.com/DocsFoxr/Aegis-Hub-Library/main/Classes/Array.lua"))();

local StatusClient = Api:GetHashCode();
local Aegis = Instance.new("ScreenGui")
Aegis.Name = StatusClient[1]
Aegis.ZIndexBehavior = Enum.ZIndexBehavior.Global
Aegis.Parent = CoreGui

local Theme = {
     BackgroundColor = Color3.fromRGB(80, 80, 80),
     BorderColor = Color3.fromRGB(109, 109, 109),

     TextColor = Color3.fromRGB(255, 255, 255),
     PrimaryColor = Color3.fromRGB(255, 85, 127),

     FontFamily = Enum.Font.RobotoMono
};

local Tools = {};
local Library = {};

do
     function Tools:Tween(instance, properties, duration, ...)
          TweenService:Create(instance, TweenInfo.new(duration, ...), properties):Play();
     end

     function Tools:MapValue(Value, MinA, MaxA, MinB, MaxB)
          return (1 - ((Value - MinA) / (MaxA - MinA))) * MinB + ((Value - MinA) / (MaxA - MinA)) * MaxB;
      end;

	function Tools:GetTextSize(Text, Size, Font)
	     return TextService:GetTextSize(Text, Size, Enum.Font[Font], Vector2.new(260, 1080))
	end

     function Tools:Dragged(main, value)
          local dragging;
          local dragInput;
          local dragStart;
          local startPos;

          local function update(input)
               local delta = input.Position - dragStart;
               value:TweenPosition(UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y), 'Out', 'Sine' , 0.1, true);
          end;

          main.InputBegan:Connect(function(input)
               if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true;
                    dragStart = input.Position;
                    startPos = value.Position;

                    repeat task.wait() until input.UserInputState == Enum.UserInputState.End;
                    dragging = false;
               end;
          end);

          main.InputChanged:Connect(function(input)
               if input.UserInputType == Enum.UserInputType.MouseMovement then
                    dragInput = input;
               end;
          end);

          game:GetService("UserInputService").InputChanged:Connect(function(input)
               if input == dragInput and dragging then
                    update(input);
               end;
          end);
     end

     function Tools:GetDarkColor(color3, value)
          local value = value or 1.5;
          local H, S, V = color3:ToHSV();
          return Color3.fromHSV(H, S, V / value)
     end
end

do
     function Library:CreateWindow(info)
          local window = {
               title = info.Title or "New Window",
               load = info.Load or false
          }
          local _Body = Instance.new("Frame")
          local _Article = Instance.new("Frame")
          local UIPadding = Instance.new("UIPadding")
          local UIStroke = Instance.new("UIStroke")

          local _navbar = Instance.new("Frame")
          local _head = Instance.new("Frame")
          local _he_padding = Instance.new("UIPadding")
          local _box_he = Instance.new("Frame")
          local _boxhe_rounded = Instance.new("UICorner")
          local _box_logo = Instance.new("Frame")
          local _boxlogo_rounded = Instance.new("UICorner")
          local App = Instance.new("TextLabel")
          local Link = Instance.new("TextLabel")
          local _main = Instance.new("ScrollingFrame")
          local _main_display = Instance.new("UIListLayout")
          local _window_close = Instance.new("TextButton")
          local _winc_corner = Instance.new("UICorner")

          local _header = Instance.new("Frame")
          local _h2 = Instance.new("TextLabel")

          local _content = Instance.new("Frame")
          local _con_layout = Instance.new("UIPageLayout")
          local _con_padding = Instance.new("UIPadding")

          _Body.Name = "_Body"
          _Body.Parent = Aegis
          _Body.AnchorPoint = Vector2.new(0.5, 0.5)
          _Body.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
          _Body.BackgroundTransparency = 1.000
          _Body.BorderSizePixel = 0
          _Body.ClipsDescendants = true
          _Body.Position = UDim2.new(0.5, 0, 0.5, 0)
          _Body.Size = UDim2.new(0, 400, 0, 300)
          _Body.ZIndex = 3000

          _Article.Name = "_Article"
          _Article.Parent = _Body
          _Article.BackgroundColor3 = Theme.BackgroundColor
          _Article.BorderSizePixel = 0
          _Article.Size = UDim2.new(1, 0, 1, 0)
          _Article.Visible = false

          UIPadding.Parent = _Body
          UIPadding.PaddingBottom = UDim.new(0, 2)
          UIPadding.PaddingLeft = UDim.new(0, 1)
          UIPadding.PaddingRight = UDim.new(0, 2)
          UIPadding.PaddingTop = UDim.new(0, 1)

          UIStroke.Color = Theme.BorderColor
          UIStroke.Parent = _Body

          if window.load then
               task.spawn(function()
                    local Status, Module = pcall(game.HttpGet, game, "https://raw.githubusercontent.com/DocsFoxr/Aegis-Hub-Library/main/modules/LoadScreen.lua")

                    if Status then
                         local LibraryLoad = loadstring(Module)():Constructor(_Body)
                         LibraryLoad:__Push("Compiling URL...")
                         task.wait(1)
                         LibraryLoad:__Push("Looking for a version...")

                         local _AssymblyVersion = Api:GetVersion()
                         if _AssymblyVersion then
                              LibraryLoad:SetVersion(_AssymblyVersion) task.wait(0.3)
                              LibraryLoad:__Push("Version found successfully!") task.wait(1)
                              LibraryLoad:__Push("Ready to Launch!")
                              _Article.Visible = true
                              task.wait(1)
                              LibraryLoad:Close()
                         end
                    end
               end)
          end

          _navbar.Name = "_navbar"
          _navbar.Parent = _Article
          _navbar.BackgroundColor3 = Tools:GetDarkColor(Theme.BackgroundColor);
          _navbar.BorderColor3 = Color3.fromRGB(27, 42, 53)
          _navbar.BorderSizePixel = 0
          _navbar.ClipsDescendants = true
          _navbar.Size = UDim2.new(0.300000012, 0, 1, 0)
          _navbar.ZIndex = 3000

          _head.Name = "_head"
          _head.Parent = _navbar
          _head.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
          _head.BackgroundTransparency = 1.000
          _head.BorderSizePixel = 0
          _head.Size = UDim2.new(1.00000012, 0, 0.150000006, 0)
          _head.ZIndex = 3000

          _box_he.Name = "_box_he"
          _box_he.Parent = _head
          _box_he.BackgroundColor3 = Tools:GetDarkColor(Theme.BackgroundColor, 2);
          _box_he.ClipsDescendants = true
          _box_he.Size = UDim2.new(1.00000012, 0, 1.22955525, 0)
          _box_he.ZIndex = 3000

          _boxhe_rounded.CornerRadius = UDim.new(0, 5)
          _boxhe_rounded.Name = "_boxhe_rounded"
          _boxhe_rounded.Parent = _box_he

          App.Name = "App"
          App.Parent = _box_he
          App.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
          App.BackgroundTransparency = 1.000
          App.Position = UDim2.new(0.159999996, 0, 0.100000001, 0)
          App.Size = UDim2.new(0.800000012, 0, 0.5, 0)
          App.ZIndex = 3000
          App.Font = Enum.Font.DenkOne
          App.Text = "A E G I S"
          App.TextColor3 = Theme.PrimaryColor
          App.TextSize = 14.000
          App.TextXAlignment = Enum.TextXAlignment.Left

          Link.Name = "Link"
          Link.Parent = _box_he
          Link.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
          Link.BackgroundTransparency = 1.000
          Link.Position = UDim2.new(0.159999996, 0, 0.449999988, 0)
          Link.Size = UDim2.new(0.800000012, 0, 0.5, 0)
          Link.ZIndex = 3000
          Link.Font = Enum.Font.Sarpanch
          Link.Text = "Status: <font color='#83B692'>"..tostring(StatusClient[2]).."</font>"
          Link.TextColor3 = Theme.TextColor
          Link.TextSize = 14.000
          Link.TextXAlignment = Enum.TextXAlignment.Left
          Link.RichText = true;

          _box_logo.Name = "_box_logo"
          _box_logo.Parent = _box_he
          _box_logo.AnchorPoint = Vector2.new(0.5, 0.5)
          _box_logo.BackgroundColor3 = Theme.PrimaryColor
          _box_logo.ClipsDescendants = true
          _box_logo.Position = UDim2.new(-0.095978044, 19, 0.500000179, 0)
          _box_logo.Size = UDim2.new(0, 4, 0, 25)
          _box_logo.ZIndex = 3000

          _boxlogo_rounded.CornerRadius = UDim.new(0, 3)
          _boxlogo_rounded.Name = "_boxhe_rounded"
          _boxlogo_rounded.Parent = _box_logo

          _he_padding.Name = "_he_padding"
          _he_padding.Parent = _head
          _he_padding.PaddingBottom = UDim.new(0, 5)
          _he_padding.PaddingLeft = UDim.new(0, 5)
          _he_padding.PaddingRight = UDim.new(0, 5)
          _he_padding.PaddingTop = UDim.new(0, 5)

          _main.Name = "_main"
          _main.Parent = _navbar
          _main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
          _main.BackgroundTransparency = 1.000
          _main.BorderSizePixel = 0
          _main.Position = UDim2.new(0, 0, 0.180000007, 0)
          _main.Selectable = false
          _main.Size = UDim2.new(1.00000012, 0, 0.819999993, 0)
          _main.ZIndex = 3000
          _main.BottomImage = ""
          _main.MidImage = ""
          _main.ScrollBarThickness = 0
          _main.TopImage = ""

          _main_display.Name = "_main_display"
          _main_display.Parent = _main
          _main_display.SortOrder = Enum.SortOrder.LayoutOrder

          _window_close.Name = "_window_close"
          _window_close.Parent = game.StarterGui.Aegis._Body._Article._navbar
          _window_close.AnchorPoint = Vector2.new(0.5, 0)
          _window_close.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
          _window_close.BorderColor3 = Color3.fromRGB(255, 255, 255)
          _window_close.BorderSizePixel = 0
          _window_close.Position = UDim2.new(0.5, 0, 0.920000017, 0)
          _window_close.Size = UDim2.new(0, 110, 0, 20)
          _window_close.ZIndex = 3001
          _window_close.AutoButtonColor = false
          _window_close.Font = Enum.Font.RobotoMono
          _window_close.Text = "]Exit"
          _window_close.TextColor3 = Color3.fromRGB(255, 85, 127)
          _window_close.TextSize = 14.000
          _window_close.TextXAlignment = Enum.TextXAlignment.Left

          _winc_corner.CornerRadius = UDim.new(0, 5)
          _winc_corner.Name = "_winc_corner"
          _winc_corner.Parent = _window_close

          local connection
          connection = _window_close.MouseButton1Click:Connect(function()
               Aegis:Destroy();
               connection:Disconnect();
          end)

          _header.Name = "_header"
          _header.Parent = _Article
          _header.BackgroundColor3 = Tools:GetDarkColor(Theme.BackgroundColor);
          _header.BorderColor3 = Color3.fromRGB(0, 0, 0)
          _header.BorderSizePixel = 0
          _header.Position = UDim2.new(0.300000012, 0, 0, 0)
          _header.Size = UDim2.new(0.699999988, 0, 0.0599999987, 0)
          _header.ZIndex = 3000

          _h2.Name = "_h2"
          _h2.Parent = _header
          _h2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
          _h2.BackgroundTransparency = 1.000
          _h2.BorderColor3 = Color3.fromRGB(27, 42, 53)
          _h2.BorderSizePixel = 0
          _h2.Size = UDim2.new(1, 0, 1, 0)
          _h2.ZIndex = 3000
          _h2.Font = Theme.FontFamily
          _h2.Text = window.title
          _h2.TextColor3 = Theme.TextColor
          _h2.TextSize = 14.000

          _content.Name = "_content"
          _content.Parent = _Article
          _content.BackgroundColor3 = Theme.BackgroundColor
          _content.BorderColor3 = Color3.fromRGB(27, 42, 53)
          _content.BorderSizePixel = 0
          _content.ClipsDescendants = true
          _content.Position = UDim2.new(0.300000012, 0, 0.0599999987, 0)
          _content.Size = UDim2.new(0.699999988, 0, 0.939999998, 0)
          _content.ZIndex = 3000

          _con_layout.Name = "_con_layout"
          _con_layout.Parent = _content
          _con_layout.FillDirection = Enum.FillDirection.Vertical
          _con_layout.SortOrder = Enum.SortOrder.LayoutOrder
          _con_layout.EasingStyle = Enum.EasingStyle.Circular
          _con_layout.Padding = UDim.new(0, 10)
          _con_layout.TweenTime = 0.500
          _con_layout.GamepadInputEnabled = false
          _con_layout.ScrollWheelInputEnabled = false
          _con_layout.TouchInputEnabled = false

          _con_padding.Name = "_con_padding"
          _con_padding.Parent = _content
          _con_padding.PaddingBottom = UDim.new(0, 10)
          _con_padding.PaddingLeft = UDim.new(0, 10)
          _con_padding.PaddingRight = UDim.new(0, 10)
          _con_padding.PaddingTop = UDim.new(0, 10)

          Tools:Dragged(_header, _Body)

          local TabPages = {};

          function TabPages:addTab(title)
               title = title or "Tab Content"

               local _Tab = Instance.new("TextButton")
               local Tab_padding = Instance.new("UIPadding")
               local _tab_content= Instance.new("Frame")
               local _span = Instance.new("Frame")
               local span_rounded = Instance.new("UICorner")
               local _name_tab = Instance.new("TextLabel")

               local _nav = Instance.new("ScrollingFrame")
               local _nav_display = Instance.new("UIListLayout")

               _Tab.Name = "_Tab"
               _Tab.Parent = _main
               _Tab.Active = false
               _Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
               _Tab.BackgroundTransparency = 1.000
               _Tab.Selectable = false
               _Tab.Size = UDim2.new(1, 0, 0, 30)
               _Tab.ZIndex = 3000
               _Tab.Text = ""
               _Tab.TextTransparency = 1.000

               Tab_padding.Name = "Tab_padding"
               Tab_padding.Parent = _Tab
               Tab_padding.PaddingBottom = UDim.new(0, 2)
               Tab_padding.PaddingTop = UDim.new(0, 2)

               _tab_content.Name = "content"
               _tab_content.Parent = _Tab
               _tab_content.BackgroundColor3 = Tools:GetDarkColor(Theme.BackgroundColor);
               _tab_content.BorderSizePixel = 0
               _tab_content.Size = UDim2.new(1, 0, 1, 0)
               _tab_content.ZIndex = 3000

               _span.Name = "_span"
               _span.Parent = _tab_content
               _span.AnchorPoint = Vector2.new(1, 0)
               _span.BackgroundColor3 = Tools:GetDarkColor(Theme.BackgroundColor);
               _span.BorderSizePixel = 0
               _span.Position = UDim2.new(1, 0, 0, 0)
               _span.Size = UDim2.new(0, 2, 1, 0)
               _span.ZIndex = 3000

               span_rounded.CornerRadius = UDim.new(1, 0)
               span_rounded.Name = "span_rounded"
               span_rounded.Parent = _span

               _name_tab.Name = "_name_tab"
               _name_tab.Parent = _tab_content
               _name_tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
               _name_tab.BackgroundTransparency = 1.000
               _name_tab.BorderSizePixel = 0
               _name_tab.Position = UDim2.new(0.0963148922, 0, 0, 0)
               _name_tab.Size = UDim2.new(0.861809075, 0, 1, 0)
               _name_tab.ZIndex = 3000
               _name_tab.Font = Theme.FontFamily
               _name_tab.Text = title
               _name_tab.TextColor3 = Theme.TextColor
               _name_tab.TextSize = 14.000
               _name_tab.TextXAlignment = Enum.TextXAlignment.Left

               _nav.Name = "_nav"
               _nav.Parent = _content
               _nav.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
               _nav.BackgroundTransparency = 1.000
               _nav.ClipsDescendants = true
               _nav.Selectable = false
               _nav.Size = UDim2.new(1, 0, 1, 0)
               _nav.ZIndex = 3000
               _nav.BottomImage = ""
               _nav.MidImage = ""
               _nav.ScrollBarThickness = 0
               _nav.TopImage = ""
               _nav.CanvasSize = UDim2.fromOffset(0, 0)

               _nav_display.Name = "_nav_display"
               _nav_display.Parent = _nav
               _nav_display.SortOrder = Enum.SortOrder.LayoutOrder

               local Nav = {}

               function Nav:SizeDisplay(value)
                    local BodySize = UDim2.new(0, 0, 0, _nav.CanvasSize.Height.Offset + value)
                    _nav.CanvasSize = BodySize;
               end

               if (not Library.currentContentTab) then
                    Library.currentButtonTab = {
                         Tab = _Tab,
                         Content = _tab_content,
                         Span = _span,
                         Name = _name_tab
                    };
                    Library.currentContentTab = _nav;

                    _tab_content.BackgroundColor3 = Tools:GetDarkColor(Theme.BackgroundColor, 2)
                    _span.BackgroundColor3 = Tools:GetDarkColor(Theme.PrimaryColor)
                    _name_tab.TextColor3 = Tools:GetDarkColor(Theme.PrimaryColor)
               else
                    _tab_content.BackgroundColor3 = Tools:GetDarkColor(Theme.BackgroundColor)
                    _span.BackgroundColor3 = Tools:GetDarkColor(Theme.BackgroundColor)
                    _name_tab.TextColor3 = Theme.TextColor
               end;

               _Tab.MouseButton1Click:Connect(function()
                    if (Library.currentContentTab) then
                         Tools:Tween(Library.currentButtonTab.Content, { BackgroundColor3 = Tools:GetDarkColor(Theme.BackgroundColor) }, 0.5)
                         Tools:Tween(Library.currentButtonTab.Span, { BackgroundColor3 = Tools:GetDarkColor(Theme.BackgroundColor) }, 0.5)
                         Tools:Tween(Library.currentButtonTab.Name, { TextColor3 = Theme.TextColor }, 0.5)
                    end;

                    _con_layout:JumpTo(_nav)
                    Library.currentButtonTab = {
                         Tab = _Tab,
                         Content = _tab_content,
                         Span = _span,
                         Name = _name_tab
                    };
                    Library.currentContentTab = _nav;

                    Tools:Tween(Library.currentButtonTab.Content, { BackgroundColor3 = Tools:GetDarkColor(Theme.BackgroundColor, 2) }, 0.5)
                    Tools:Tween(Library.currentButtonTab.Span, { BackgroundColor3 = Tools:GetDarkColor(Theme.PrimaryColor) }, 0.5)
                    Tools:Tween(Library.currentButtonTab.Name, { TextColor3 = Tools:GetDarkColor(Theme.PrimaryColor) }, 0.5)
               end);

               local Addons = {}

               function Addons:addLabel(name)
                    name = name or "New Section";
                    Nav:SizeDisplay(35);
                    
                    local _Section = Instance.new("Frame")
                    local _sec_padding = Instance.new("UIPadding")
                    local _sec_h4 = Instance.new("TextLabel")
                    local _section_separe = Instance.new("Frame")

                    _Section.Name = "_Section"
                    _Section.Parent = _nav
                    _Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _Section.BackgroundTransparency = 1.000
                    _Section.BorderSizePixel = 0
                    _Section.Size = UDim2.new(1, 0, 0, 35)
                    _Section.ZIndex = 3000

                    _sec_padding.Name = "_sec_padding"
                    _sec_padding.Parent = _Section
                    _sec_padding.PaddingBottom = UDim.new(0, 2)
                    _sec_padding.PaddingLeft = UDim.new(0, 2)
                    _sec_padding.PaddingRight = UDim.new(0, 2)
                    _sec_padding.PaddingTop = UDim.new(0, 2)

                    _sec_h4.Name = "_sec_h4"
                    _sec_h4.Parent = _Section
                    _sec_h4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _sec_h4.BackgroundTransparency = 1.000
                    _sec_h4.Position = UDim2.new(0, 0, 0.100000001, 0)
                    _sec_h4.Size = UDim2.new(1, 0, 0, 15)
                    _sec_h4.ZIndex = 3000
                    _sec_h4.Font = Theme.FontFamily
                    _sec_h4.Text = string.upper(tostring(name))
                    _sec_h4.TextColor3 = Tools:GetDarkColor(Theme.PrimaryColor);
                    _sec_h4.TextSize = 16.000
                    _sec_h4.TextXAlignment = Enum.TextXAlignment.Left

                    _section_separe.Name = "_section_separe"
                    _section_separe.Parent = _Section
                    _section_separe.BackgroundColor3 = Tools:GetDarkColor(Theme.PrimaryColor);
                    _section_separe.BorderSizePixel = 0
                    _section_separe.Position = UDim2.new(0, 0, 0.699999988, 0)
                    _section_separe.Size = UDim2.new(1, 0, 0, 2)
                    _section_separe.ZIndex = 3000
               end

               function Addons:addButton(info, callback)
                    local button = {
                         name = info.Name or "Button!"
                    }
                    Nav:SizeDisplay(35);

                    local _Button = Instance.new("Frame")
                    local _btn_padding = Instance.new("UIPadding")
                    local _btnFrame = Instance.new("Frame")
                    local btnRounded = Instance.new("UICorner")
                    local btn_callback = Instance.new("TextButton")
                    local btn_call_rounded = Instance.new("UICorner")
                    local label_button = Instance.new("TextLabel")


                    _Button.Name = "_Button"
                    _Button.Parent = _nav
                    _Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _Button.BackgroundTransparency = 1.000
                    _Button.BorderSizePixel = 0
                    _Button.Size = UDim2.new(1, 0, 0, 35)
                    _Button.ZIndex = 3000

                    _btnFrame.Name = "_btnFrame"
                    _btnFrame.Parent = _Button
                    _btnFrame.BackgroundColor3 = Tools:GetDarkColor(Theme.BackgroundColor);
                    _btnFrame.Size = UDim2.new(1, 0, 1, 0)
                    _btnFrame.ZIndex = 3000

                    btnRounded.CornerRadius = UDim.new(0, 5)
                    btnRounded.Name = "btnRounded"
                    btnRounded.Parent = _btnFrame

                    btn_callback.Name = "btn_callback"
                    btn_callback.Parent = _btnFrame
                    btn_callback.AnchorPoint = Vector2.new(0.5, 0.5)
                    btn_callback.BackgroundColor3 = Tools:GetDarkColor(Theme.BackgroundColor, 2);
                    btn_callback.Position = UDim2.new(0.800000012, 0, 0.5, 0)
                    btn_callback.Size = UDim2.new(0, 90, 0, 22)
                    btn_callback.ZIndex = 3000
                    btn_callback.AutoButtonColor = false
                    btn_callback.Font = Theme.FontFamily
                    btn_callback.Text = "Pop!"
                    btn_callback.TextColor3 =Theme.TextColor
                    btn_callback.TextSize = 14.000
                    btn_callback.TextWrapped = true

                    btn_call_rounded.CornerRadius = UDim.new(0, 5)
                    btn_call_rounded.Name = "btn_call_rounded"
                    btn_call_rounded.Parent = btn_callback

                    label_button.Name = "label_button"
                    label_button.Parent = _btnFrame
                    label_button.AnchorPoint = Vector2.new(0, 0.5)
                    label_button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    label_button.BackgroundTransparency = 1.000
                    label_button.Position = UDim2.new(0.0500000007, 0, 0.449999988, 0)
                    label_button.Size = UDim2.new(0, 140, 0, 24)
                    label_button.ZIndex = 3000
                    label_button.Font = Theme.FontFamily
                    label_button.Text = info.Name
                    label_button.TextColor3 = Theme.TextColor
                    label_button.TextSize = 14.000
                    label_button.TextXAlignment = Enum.TextXAlignment.Left

                    _btn_padding.Name = "_btn_padding"
                    _btn_padding.Parent = _Button
                    _btn_padding.PaddingBottom = UDim.new(0, 2)
                    _btn_padding.PaddingLeft = UDim.new(0, 2)
                    _btn_padding.PaddingRight = UDim.new(0, 2)
                    _btn_padding.PaddingTop = UDim.new(0, 2)

                    local debounce = false;

                    btn_callback.MouseButton1Click:Connect(function()
                         if debounce then
                              return
                         end

                         callback()
                         debounce = true;
                         local scale = 1.2;
                         Tools:Tween(btn_callback, {TextSize = 10, Size = UDim2.fromOffset(90 / scale, 22 / scale) }, 0.05)
                         task.wait(0.06)
                         Tools:Tween(btn_callback, {TextSize = 14, Size = UDim2.fromOffset(90, 22)}, 0.05)
                         task.wait(0.1)
                         debounce = false;
                    end)
               end

               function Addons:addCheckBox(info, callback)
                    local checkbox = {
                         name = info.Name or "CheckBox!",
                         active = info.Active or false
                    }
                    Nav:SizeDisplay(40);

                    local Image_Active = {
                         check = { Position = UDim2.fromOffset(15, 13) },
                         uncheck = { Position = UDim2.fromOffset(45, 13) }
                    }
                    local Icon_Active = {
                         check = { Position = UDim2.fromOffset(30, 5) },
                         uncheck =  { Position = UDim2.fromOffset(5, 5) }
                    }

                    local _CheckBox = Instance.new("Frame")
                    local _check_padding = Instance.new("UIPadding")
                    local _CbFrame = Instance.new("Frame")
                    local check_Rounded = Instance.new("UICorner")
                    local check_callback = Instance.new("TextButton")
                    local call_rounded = Instance.new("UICorner")
                    local check_icon = Instance.new("Frame")
                    local UICorner = Instance.new("UICorner")
                    local check_active = Instance.new("ImageLabel")
                    local label_checkbox = Instance.new("TextLabel")

                    _CheckBox.Name = "_CheckBox"
                    _CheckBox.Parent = _nav
                    _CheckBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _CheckBox.BackgroundTransparency = 1.000
                    _CheckBox.BorderSizePixel = 0
                    _CheckBox.Position = UDim2.new(0, 0, 0.325595647, 0)
                    _CheckBox.Size = UDim2.new(1, 0, 0, 40)
                    _CheckBox.ZIndex = 3000

                    _CbFrame.Name = "_CbFrame"
                    _CbFrame.Parent = _CheckBox
                    _CbFrame.BackgroundColor3 = Tools:GetDarkColor(Theme.BackgroundColor);
                    _CbFrame.Size = UDim2.new(1, 0, 1, 0)
                    _CbFrame.ZIndex = 3000

                    check_Rounded.CornerRadius = UDim.new(0, 5)
                    check_Rounded.Name = "check_Rounded"
                    check_Rounded.Parent = _CbFrame

                    check_callback.Name = "check_callback"
                    check_callback.Parent = _CbFrame
                    check_callback.AnchorPoint = Vector2.new(0, 0.5)
                    check_callback.BackgroundColor3 = Tools:GetDarkColor(Theme.BackgroundColor, 2);
                    check_callback.Position = UDim2.new(0.730000019, 0, 0.5, 0)
                    check_callback.Size = UDim2.new(0, 60, 0, 25)
                    check_callback.ZIndex = 3000
                    check_callback.AutoButtonColor = false
                    check_callback.Font = Theme.FontFamily
                    check_callback.Text = ""
                    check_callback.TextColor3 = Color3.fromRGB(255, 255, 255)
                    check_callback.TextSize = 14.000

                    call_rounded.CornerRadius = UDim.new(0, 5)
                    call_rounded.Name = "call_rounded"
                    call_rounded.Parent = check_callback

                    check_icon.Name = "check_icon"
                    check_icon.Parent = check_callback
                    check_icon.BackgroundColor3 = Theme.TextColor
                    check_icon.Position = UDim2.new(0, 5, 0, 5)
                    check_icon.Size = UDim2.new(0, 22, 0, 15)
                    check_icon.ZIndex = 3000

                    UICorner.CornerRadius = UDim.new(0, 2)
                    UICorner.Parent = check_icon

                    check_active.Name = "check_active"
                    check_active.Parent = check_callback
                    check_active.Active = true
                    check_active.AnchorPoint = Vector2.new(0.5, 0.5)
                    check_active.BackgroundTransparency = 1.000
                    check_active.Position = UDim2.new(0, 45, 0, 13)
                    check_active.Selectable = true
                    check_active.Size = UDim2.new(0, 15, 0, 15)
                    check_active.ZIndex = 3000
                    check_active.Image = "rbxassetid://3926305904"
                    check_active.ImageColor3 = Theme.TextColor
                    check_active.ImageRectOffset = Vector2.new(924, 724)
                    check_active.ImageRectSize = Vector2.new(36, 36)

                    label_checkbox.Name = "label_checkbox"
                    label_checkbox.Parent = _CbFrame
                    label_checkbox.AnchorPoint = Vector2.new(0, 0.5)
                    label_checkbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    label_checkbox.BackgroundTransparency = 1.000
                    label_checkbox.Position = UDim2.new(0.0500000007, 0, 0.449999988, 0)
                    label_checkbox.Size = UDim2.new(0, 140, 0, 24)
                    label_checkbox.ZIndex = 3000
                    label_checkbox.Font = Theme.FontFamily
                    label_checkbox.Text = checkbox.name
                    label_checkbox.TextColor3 = Theme.TextColor
                    label_checkbox.TextSize = 14.000
                    label_checkbox.TextXAlignment = Enum.TextXAlignment.Left

                    _check_padding.Name = "_check_padding"
                    _check_padding.Parent = _CheckBox
                    _check_padding.PaddingBottom = UDim.new(0, 2)
                    _check_padding.PaddingLeft = UDim.new(0, 2)
                    _check_padding.PaddingRight = UDim.new(0, 2)
                    _check_padding.PaddingTop = UDim.new(0, 2)

                    local debounce = false;

                    if checkbox.active then
                         check_callback.BackgroundColor3 = Theme.PrimaryColor
                         check_icon.Position = Icon_Active.check.Position
                         check_active.Position = Image_Active.check.Position
                         check_active.ImageRectOffset = Vector2.new(312, 4)
                         check_active.ImageRectSize = Vector2.new(24, 24)
                         debounce = true
                    end

                    check_callback.MouseButton1Click:Connect(function()
                         debounce = not debounce

                         if debounce then
                              Tools:Tween(check_active, Image_Active.check, 0.3)
                              Tools:Tween(check_icon, Icon_Active.check, 0.3)
                              Tools:Tween(check_callback, { BackgroundColor3 = Theme.PrimaryColor }, 0.3)
                              check_active.ImageRectOffset = Vector2.new(312, 4)
                              check_active.ImageRectSize = Vector2.new(24, 24)
                              callback(debounce)
                         else
                              Tools:Tween(check_active, Image_Active.uncheck, 0.3)
                              Tools:Tween(check_icon, Icon_Active.uncheck , 0.3)
                              Tools:Tween(check_callback, { BackgroundColor3 = Tools:GetDarkColor(Theme.BackgroundColor, 2) }, 0.3)
                              check_active.ImageRectOffset = Vector2.new(924, 724)
                              check_active.ImageRectSize = Vector2.new(36, 36)
                              callback(debounce)
                         end
                    end)
               end

               function Addons:addSlider(info, callback)
                    local slider = {
                         name = info.Name or "New Slider!",
                         value = info.Default or 0,
                         min = info.Min or 0,
                         max = info.Max or 100,
                         rounding = info.Rounding or 0,
                         maxSize = 232
                    }

                    Nav:SizeDisplay(50);

                    local _Slider = Instance.new("Frame")
                    local _slider_padding = Instance.new("UIPadding")
                    local _SdeFrame = Instance.new("Frame")
                    local _SdeRounded = Instance.new("UICorner")
                    local _EventFrame = Instance.new("TextButton")
                    local SliderTracker = Instance.new("Frame")
                    local label_Slider = Instance.new("TextLabel")
                    local label_sli_value = Instance.new("TextLabel")
                    local SliderFill = Instance.new("Frame")
                    local _Sker_rounded = Instance.new("UICorner")
                    local _Sfill_rounded = Instance.new("UICorner")

                    _Slider.Name = "_Slider"
                    _Slider.Parent = _nav
                    _Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _Slider.BackgroundTransparency = 1.000
                    _Slider.BorderSizePixel = 0
                    _Slider.Position = UDim2.new(0, 0, 0.134068802, 0)
                    _Slider.Size = UDim2.new(1, 0, 0, 50)
                    _Slider.ZIndex = 3000

                    _SdeFrame.Name = "_SdeFrame"
                    _SdeFrame.Parent = _Slider
                    _SdeFrame.BackgroundColor3 = Tools:GetDarkColor(Theme.BackgroundColor)
                    _SdeFrame.Size = UDim2.new(1, 0, 1, 0)
                    _SdeFrame.ZIndex = 3000

                    _SdeRounded.CornerRadius = UDim.new(0, 5)
                    _SdeRounded.Name = "_SdeRounded"
                    _SdeRounded.Parent = _SdeFrame

                    label_Slider.Name = "label_Slider"
                    label_Slider.Parent = _SdeFrame
                    label_Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    label_Slider.BackgroundTransparency = 1.000
                    label_Slider.Position = UDim2.new(0.0499999411, 0, 0, 0)
                    label_Slider.Size = UDim2.new(0, 236, 0, 24)
                    label_Slider.ZIndex = 3000
                    label_Slider.Font = Theme.FontFamily
                    label_Slider.Text = slider.name
                    label_Slider.TextColor3 = Theme.TextColor
                    label_Slider.TextSize = 14.000
                    label_Slider.TextXAlignment = Enum.TextXAlignment.Left

                    label_sli_value.Name = "labe_sli_value"
                    label_sli_value.Parent = _Slider
                    label_sli_value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    label_sli_value.BackgroundTransparency = 1.000
                    label_sli_value.Position = UDim2.new(0.569889545, 0, 0, 0)
                    label_sli_value.Size = UDim2.new(0, 104, 0, 24)
                    label_sli_value.ZIndex = 3000
                    label_sli_value.Font = Theme.FontFamily
                    label_sli_value.Text = "0"
                    label_sli_value.TextColor3 = Theme.TextColor
                    label_sli_value.TextSize = 14.000
                    label_sli_value.TextXAlignment = Enum.TextXAlignment.Right

                    _EventFrame.Name = "_EventFrame"
                    _EventFrame.Parent = _SdeFrame
                    _EventFrame.Active = false
                    _EventFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _EventFrame.BackgroundTransparency = 1
                    _EventFrame.Position = UDim2.new(0.0499999411, 0, 0.521739125, 0)
                    _EventFrame.Selectable = false
                    _EventFrame.Size = UDim2.new(0.924402595, 0, 0.347826093, 0)
                    _EventFrame.ZIndex = 3000
                    _EventFrame.AutoButtonColor = false
                    _EventFrame.Text = ""

                    SliderTracker.Name = "SliderTracker"
                    SliderTracker.Parent = _EventFrame
                    SliderTracker.AnchorPoint = Vector2.new(0, 0.5)
                    SliderTracker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    SliderTracker.BackgroundTransparency = 0.700
                    SliderTracker.BorderSizePixel = 0
                    SliderTracker.Position = UDim2.new(0, 0, 0.5, 0)
                    SliderTracker.Size = UDim2.new(1, 0, 0, 4)
                    SliderTracker.ZIndex = 3000

                    SliderFill.Name = "SliderFill"
                    SliderFill.Parent = SliderTracker
                    SliderFill.BackgroundColor3 = Tools:GetDarkColor(Theme.PrimaryColor)
                    SliderFill.BorderSizePixel = 0
                    SliderFill.Size = UDim2.new(0, 0, 1, 0)
                    SliderFill.ZIndex = 3000

                    _Sfill_rounded.CornerRadius = UDim.new(1, 0)
                    _Sfill_rounded.Name = "_Sfill_rounded"
                    _Sfill_rounded.Parent = SliderFill

                    _Sker_rounded.CornerRadius = UDim.new(1, 0)
                    _Sker_rounded.Name = "_Sker_rounded"
                    _Sker_rounded.Parent = SliderTracker

                    _slider_padding.Name = "_slider_padding"
                    _slider_padding.Parent = _Slider
                    _slider_padding.PaddingBottom = UDim.new(0, 2)
                    _slider_padding.PaddingLeft = UDim.new(0, 2)
                    _slider_padding.PaddingRight = UDim.new(0, 2)
                    _slider_padding.PaddingTop = UDim.new(0, 2)

                    function slider:Display()
                         local Suffix = info.Suffix or ''
                         label_sli_value.Text = string.format('%s/%s', slider.value .. Suffix, slider.max .. Suffix)

                         local X = math.ceil(Tools:MapValue(slider.value, slider.min, slider.max, 0, slider.maxSize))
                         Tools:Tween(SliderFill, { Size = UDim2.new(0, X, 1, 0) }, 0.5)
                    end

                    local function Round(Value)
                         if slider.rounding == 0 then
                              return math.floor(Value)
                         end

                         local Str = Value .. ''
                         local Dot = Str:find('%.')

                         return Dot and tonumber(Str:sub(1, Dot + slider.rounding)) or Value
                    end

                    function slider:GetValueFromXOffset(X)
                         return Round(Tools:MapValue(X, 0, slider.maxSize, slider.min, slider.max))
                    end

                    slider:Display()

                    _EventFrame.InputBegan:Connect(function(Input)
                         if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                              local mPos = Mouse.X
                              local gPos = SliderFill.Size.X.Offset
                              local Diff = mPos - (SliderFill.AbsolutePosition.X + gPos)

                              while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                   local nMPos = Mouse.X
                                   local nX = math.clamp(gPos + (nMPos - mPos) + Diff, 0, slider.maxSize)

                                   local nValue = slider:GetValueFromXOffset(nX)
                                   local OldValue = slider.value
                                   slider.value = nValue

                                   slider:Display()

                                   if nValue ~= OldValue then
                                        callback(slider.value)
                                   end

                                   RenderStepped:Wait()
                              end
                         end
                    end)
               end

               return Addons
          end

          return TabPages
     end

     function Library:AddNotify(info)
          local notify = {
               desc = info.Description or "Description...",
               state = info.State or "Primary",
               wait = info.Wait or 5,

               Theme = {
                    Primary = Color3.fromRGB(172, 255, 178),
                    Secondary = Color3.fromRGB(238, 201, 133),
                    Third = Color3.fromRGB(247, 159, 159)
               }
          }

          local Notify = Instance.new("Frame")
          local UICorner = Instance.new("UICorner")
          local _span = Instance.new("Frame")
          local _span_corner = Instance.new("UICorner")
          local UIListLayout = Instance.new("UIListLayout")
          local _content = Instance.new("TextLabel")
          local UIPadding = Instance.new("UIPadding")

          Notify.Name = "Notify"
          Notify.Parent = Aegis
          Notify.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
          Notify.ClipsDescendants = true
          Notify.Position = UDim2.new(0, 5, 0, 15)
          Notify.Size = UDim2.new(0, 260, 0, 54)

          UICorner.CornerRadius = UDim.new(0, 3)
          UICorner.Parent = Notify

          _span.Name = "_span"
          _span.Parent = Notify
          _span.BackgroundColor3 = Color3.fromRGB(179, 255, 186)
          _span.BorderSizePixel = 0
          _span.Size = UDim2.new(0, 3, 1, 0)

          _span_corner.CornerRadius = UDim.new(1, 0)
          _span_corner.Name = "_span_corner"
          _span_corner.Parent = _span

          UIListLayout.Parent = Notify
          UIListLayout.FillDirection = Enum.FillDirection.Horizontal
          UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
          UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
          UIListLayout.Padding = UDim.new(0, 10)

          _content.Name = "_content"
          _content.Parent = Notify
          _content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
          _content.BackgroundTransparency = 1.000
          _content.BorderSizePixel = 0
          _content.Position = UDim2.new(0.0500000007, 0, 0.027777778, 0)
          _content.Size = UDim2.new(0, 247, 1, 0)
          _content.Font = Enum.Font.Cartoon
          _content.Text = "Description..."
          _content.TextColor3 = Color3.fromRGB(226, 226, 226)
          _content.TextSize = 14.000
          _content.TextWrapped = true
          _content.TextXAlignment = Enum.TextXAlignment.Left
          _content.TextYAlignment = Enum.TextYAlignment.Top

          UIPadding.Parent = _content
          UIPadding.PaddingTop = UDim.new(0, 5)


     end
end

return Library