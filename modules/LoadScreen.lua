local TweenService = game:GetService("TweenService")

local Load = {}

function Load:Constructor(parent)
    local ScreenLoaded = Instance.new("Frame")
    local _h6_loaded_logo = Instance.new("TextLabel")
    local _h6_loaded_version = Instance.new("TextLabel")
    local _div_Load = Instance.new("Frame")
    local _div_corner = Instance.new("UICorner")
    local _span = Instance.new("Frame")
    local _span_corner = Instance.new("UICorner")

    ScreenLoaded.Name = "ScreenLoaded"
    ScreenLoaded.Parent = parent
    ScreenLoaded.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
    ScreenLoaded.BorderSizePixel = 0
    ScreenLoaded.Size = UDim2.new(1, 0, 1, 0)
    ScreenLoaded.ZIndex = 3001

    _h6_loaded_logo.Name = "_h6_loaded_logo"
    _h6_loaded_logo.Parent = ScreenLoaded
    _h6_loaded_logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _h6_loaded_logo.BackgroundTransparency = 1.000
    _h6_loaded_logo.BorderColor3 = Color3.fromRGB(157, 157, 157)
    _h6_loaded_logo.Position = UDim2.new(0.0300000086, 0, 0.0200000089, 0)
    _h6_loaded_logo.Size = UDim2.new(0, 131, 0, 25)
    _h6_loaded_logo.ZIndex = 3001
    _h6_loaded_logo.Font = Enum.Font.Sarpanch
    _h6_loaded_logo.Text = "A E G I S"
    _h6_loaded_logo.TextColor3 = Color3.fromRGB(156, 156, 156)
    _h6_loaded_logo.TextSize = 14.000
    _h6_loaded_logo.TextXAlignment = Enum.TextXAlignment.Left

    _h6_loaded_version.Name = "_h6_loaded_version"
    _h6_loaded_version.Parent = ScreenLoaded
    _h6_loaded_version.AnchorPoint = Vector2.new(1, 0)
    _h6_loaded_version.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _h6_loaded_version.BackgroundTransparency = 1.000
    _h6_loaded_version.BorderColor3 = Color3.fromRGB(157, 157, 157)
    _h6_loaded_version.Position = UDim2.new(0.985000134, 0, 0.0200000089, 0)
    _h6_loaded_version.Size = UDim2.new(0, 129, 0, 18)
    _h6_loaded_version.ZIndex = 3001
    _h6_loaded_version.Font = Enum.Font.Jura
    _h6_loaded_version.Text = "GUID: Finding..."
    _h6_loaded_version.TextColor3 = Color3.fromRGB(204, 204, 204)
    _h6_loaded_version.TextSize = 14.000
    _h6_loaded_version.TextXAlignment = Enum.TextXAlignment.Right

    _div_Load.Name = "_div_Load"
    _div_Load.Parent = ScreenLoaded
    _div_Load.AnchorPoint = Vector2.new(0.5, 0.5)
    _div_Load.BackgroundColor3 = Color3.fromRGB(198, 198, 198)
    _div_Load.Position = UDim2.new(0.5, 0, 0.5, 0)
    _div_Load.ZIndex = 3001

    _div_corner.CornerRadius = UDim.new(1, 0)
    _div_corner.Name = "_div_corner"
    _div_corner.Parent = _div_Load

    _span.Name = "_span"
    _span.Parent = ScreenLoaded
    _span.AnchorPoint = Vector2.new(0.5, 0.5)
    _span.BackgroundColor3 = Color3.fromRGB(182, 182, 182)
    _span.Position = UDim2.new(0.5, 0, 0.5, 0)
    _span.Size = UDim2.new(0, 30, 0, 30)
    _span.ZIndex = 3001

    _span_corner.CornerRadius = UDim.new(1, 0)
    _span_corner.Name = "_span_corner"
    _span_corner.Parent = _span

    local _divTween = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, -1)
	local _spanTween = TweenInfo.new(2/2, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, -1, true)

	local Tween1 = TweenService:Create(_div_Load, _divTween, { Size = UDim2.fromOffset(70, 70), BackgroundTransparency = 1})
	local Tween2 = TweenService:Create(_span, _spanTween, { Size = UDim2.fromOffset(33, 33) })

    Tween1:Play()
    Tween2:Play()

    self.Items = {
        _Frame_Main = ScreenLoaded,
        Forms = {
            _div_Load = _div_Load,
            _span = _span
        },
        Tweens = { Tween1, Tween2 },
        Children = {
            Status = _h6_loaded_version,
            _h6_loaded_logo
        }
    }

    local Prototype = {
        Library = self.Items
    }

    function Prototype:__Push(description)
        if not self.Pusheds then
            local _h6_loaded_status = Instance.new("TextLabel")
            self.Pusheds = _h6_loaded_status

            _h6_loaded_status.Name = "_h6_loaded_status"
            _h6_loaded_status.Parent = ScreenLoaded
            _h6_loaded_status.AnchorPoint = Vector2.new(1, 0)
            _h6_loaded_status.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _h6_loaded_status.BackgroundTransparency = 1.000
            _h6_loaded_status.BorderColor3 = Color3.fromRGB(157, 157, 157)
            _h6_loaded_status.Position = UDim2.new(0.352758348, 0, 0.912255883, 0)
            _h6_loaded_status.Size = UDim2.new(0, 129, 0, 18)
            _h6_loaded_status.ZIndex = 3001
            _h6_loaded_status.Font = Enum.Font.Code
            _h6_loaded_status.Text = "BASH<font color='#ff557f'> > </font>"..tostring(description)
            _h6_loaded_status.TextColor3 = Color3.fromRGB(170, 170, 170)
            _h6_loaded_status.TextSize = 14.000
            _h6_loaded_status.TextXAlignment = Enum.TextXAlignment.Left
            _h6_loaded_status.RichText = true;

            table.insert(self.Library.Children, _h6_loaded_status);
        else
            self.Pusheds.Text = "BASH<font color='#ff557f'> > </font>"..tostring(description)
        end
    end

    function Prototype:SetVersion(GUID)
        local _label_version = self.Library.Children.Status
        _label_version.Text = "GUID: "..tostring(GUID)
    end

    function Prototype:Close()
        local Library = self.Library
        local Tweens = Library.Tweens

        Tweens[1]:Stop()
        Tweens[2]:Stop()

        local TweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
        TweenService:Create(Library._Frame_Main, TweenInfo, { BackgroundTransparency = 1 }):Play()
        TweenService:Create(Library.Forms._div_Load, TweenInfo, { BackgroundTransparency = 1 }):Play()
        TweenService:Create(Library.Forms._span, TweenInfo, { BackgroundTransparency = 1 }):Play()

        for _, v in pairs(Library.Children) do
            if v:IsA('TextLabel') then
                TweenService:Create(v, TweenInfo, { TextTransparency = 1 }):Play()
            end
        end

        task.wait(3)
        Library._Frame_Main:Destroy();
    end

    return Prototype
end

return Load