local TweenService = game:GetService("TweenService")

local Load = {}

function Load:Constructor(counts, parent)
    local ScreenLoaded = Instance.new("Frame")
    local _h6_loaded_logo = Instance.new("TextLabel")
    local _h6_loaded_version = Instance.new("TextLabel")
    local _div_Load = Instance.new("Frame")
    local Frame1 = Instance.new("ImageLabel")
    local Frame2 = Instance.new("ImageLabel")
    local Frame3 = Instance.new("ImageLabel")

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
    _h6_loaded_version.Text = "GUID: 1.1"
    _h6_loaded_version.TextColor3 = Color3.fromRGB(204, 204, 204)
    _h6_loaded_version.TextSize = 14.000
    _h6_loaded_version.TextXAlignment = Enum.TextXAlignment.Right

    _div_Load.Name = "_div_Load"
    _div_Load.Parent = ScreenLoaded
    _div_Load.AnchorPoint = Vector2.new(0.5, 0.5)
    _div_Load.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _div_Load.BackgroundTransparency = 1.000
    _div_Load.Position = UDim2.new(0.5, 0, 0.5, 0)
    _div_Load.Size = UDim2.new(0.438435614, 0, -0.0316835158, 25)
    _div_Load.ZIndex = 3001

    Frame1.Name = "Frame1"
    Frame1.Parent = _div_Load
    Frame1.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame1.BackgroundTransparency = 1.000
    Frame1.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Frame1.Position = UDim2.new(0.349999994, 0, 0.5, 0)
    Frame1.Size = UDim2.new(0, 15, 1, 0)
    Frame1.Image = "http://www.roblox.com/asset/?id=3926305904"
    Frame1.ImageColor3 = Color3.fromRGB(149, 149, 149)
    Frame1.ImageRectOffset = Vector2.new(204, 484)
    Frame1.ImageRectSize = Vector2.new(36, 36)
    Frame1.SliceScale = 3001.000

    Frame2.Name = "Frame2"
    Frame2.Parent = _div_Load
    Frame2.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame2.BackgroundTransparency = 1.000
    Frame2.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Frame2.Position = UDim2.new(0.5, 0, 0.5, 0)
    Frame2.Size = UDim2.new(0, 15, 1, 0)
    Frame2.Image = "http://www.roblox.com/asset/?id=3926305904"
    Frame2.ImageColor3 = Color3.fromRGB(149, 149, 149)
    Frame2.ImageRectOffset = Vector2.new(204, 484)
    Frame2.ImageRectSize = Vector2.new(36, 36)
    Frame2.SliceScale = 3001.000

    Frame3.Name = "Frame3"
    Frame3.Parent = _div_Load
    Frame3.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame3.BackgroundTransparency = 1.000
    Frame3.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Frame3.Position = UDim2.new(0.649999976, 0, 0.5, 0)
    Frame3.Size = UDim2.new(0, 15, 1, 0)
    Frame3.Image = "http://www.roblox.com/asset/?id=3926305904"
    Frame3.ImageColor3 = Color3.fromRGB(149, 149, 149)
    Frame3.ImageRectOffset = Vector2.new(204, 484)
    Frame3.ImageRectSize = Vector2.new(36, 36)
    Frame3.SliceScale = 3001

    local dataConfig = { TweenTime = 0.4, Wait = 0.35 }
    local TweenLoadAnimation = TweenInfo.new(dataConfig.TweenTime, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)

    self.Items = {
        _Frame_Main = ScreenLoaded,
        _Div_Load = _div_Load,
        Children = {
            _h6_loaded_version,
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

    function Prototype:Close()
        local Library = self.Library

        local TweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
        TweenService:Create(Library._Frame_Main, TweenInfo, { BackgroundTransparency = 1 }):Play()

        for _, v in pairs(Library._Div_Load:GetChildren()) do
            TweenService:Create(v, TweenInfo, { ImageTransparency = 1 }):Play()
        end

        for _, v in pairs(Library.Children) do
            if v:IsA('TextLabel') then
                TweenService:Create(v, TweenInfo, { TextTransparency = 1 }):Play()
            end
        end

        task.wait(3)
        Library._Frame_Main:Destroy();
    end

    task.spawn(function()
        for _ = 0, counts do
            TweenService:Create(Frame1, TweenLoadAnimation, { Position = UDim2.fromScale(Frame1.Position.Width.Scale, 0.1)}):Play()
            task.wait(dataConfig.Wait)
            TweenService:Create(Frame2, TweenLoadAnimation, { Position = UDim2.fromScale(Frame2.Position.Width.Scale, 0.1)}):Play()
            task.wait(dataConfig.Wait)
            TweenService:Create(Frame3, TweenLoadAnimation, { Position = UDim2.fromScale(Frame3.Position.Width.Scale, 0.1)}):Play()
            task.wait(dataConfig.Wait)
       end

       Prototype:Close();
    end)

    return Prototype
end

return Load