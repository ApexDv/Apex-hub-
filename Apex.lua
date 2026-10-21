-- ==========================================
-- 1. CARREGANDO SERVIÇOS
-- ==========================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- ==========================================
-- 2. SISTEMA DE KEY (A PROTEÇÃO)
-- ==========================================
local KeyCorreta = "APEXDV56" -- ⚠️ ApexDv56
local LinkKey = "https://discord.gg/XnXcSWDkZ" -- ⚠️ SEU LINK

local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "ApexKeyUI"
KeyGui.ResetOnSpawn = false
pcall(function() KeyGui.Parent = game:GetService("CoreGui") end)
if not KeyGui.Parent then KeyGui.Parent = player.PlayerGui end

local Overlay = Instance.new("Frame")
Overlay.Size = UDim2.new(1, 0, 1, 0)
Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Overlay.BackgroundTransparency = 0.5
Overlay.Parent = KeyGui

local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 350, 0, 250)
KeyFrame.Position = UDim2.new(0.5, -175, 0.5, -125)
KeyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
KeyFrame.BorderSizePixel = 0
KeyFrame.Parent = KeyGui
Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0, 12)

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(0, 150, 255)
UIStroke.Thickness = 2
UIStroke.Parent = KeyFrame

local Titulo = Instance.new("TextLabel")
Titulo.Size = UDim2.new(1, 0, 0, 50)
Titulo.BackgroundTransparency = 1
Titulo.Text = "Apex Hub | Autenticação"
Titulo.TextColor3 = Color3.fromRGB(0, 150, 255)
Titulo.Font = Enum.Font.GothamBold
Titulo.TextSize = 20
Titulo.Parent = KeyFrame

local Info = Instance.new("TextLabel")
Info.Size = UDim2.new(1, -40, 0, 30)
Info.Position = UDim2.new(0, 20, 0, 50)
Info.BackgroundTransparency = 1
Info.Text = "Pegue sua Key no Discord abaixo:"
Info.TextColor3 = Color3.fromRGB(150, 150, 150)
Info.Font = Enum.Font.Gotham
Info.TextSize = 13
Info.Parent = KeyFrame

local LinkBtn = Instance.new("TextButton")
LinkBtn.Size = UDim2.new(1, -40, 0, 35)
LinkBtn.Position = UDim2.new(0, 20, 0, 80)
LinkBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
LinkBtn.Text = "Copiar Link do Discord"
LinkBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
LinkBtn.Font = Enum.Font.Gotham
LinkBtn.TextSize = 14
LinkBtn.Parent = KeyFrame
Instance.new("UICorner", LinkBtn).CornerRadius = UDim.new(0, 6)

LinkBtn.MouseButton1Click:Connect(function()
    pcall(function() setclipboard(LinkKey) end)
    LinkBtn.Text = "Link Copiado!"
    task.wait(2)
    LinkBtn.Text = "Copiar Link do Discord"
end)

local InputKey = Instance.new("TextBox")
InputKey.Size = UDim2.new(1, -40, 0, 40)
InputKey.Position = UDim2.new(0, 20, 0, 125)
InputKey.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
InputKey.TextColor3 = Color3.fromRGB(255, 255, 255)
InputKey.PlaceholderText = "Cole sua Key aqui..."
InputKey.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
InputKey.Font = Enum.Font.Gotham
InputKey.TextSize = 14
InputKey.Parent = KeyFrame
Instance.new("UICorner", InputKey).CornerRadius = UDim.new(0, 6)

local VerificarBtn = Instance.new("TextButton")
VerificarBtn.Size = UDim2.new(1, -40, 0, 40)
VerificarBtn.Position = UDim2.new(0, 20, 0, 180)
VerificarBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
VerificarBtn.Text = "Verificar e Entrar"
VerificarBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VerificarBtn.Font = Enum.Font.GothamBold
VerificarBtn.TextSize = 15
VerificarBtn.Parent = KeyFrame
Instance.new("UICorner", VerificarBtn).CornerRadius = UDim.new(0, 6)

-- ==========================================
-- 3. LÓGICA DE VERIFICAÇÃO E CARREGAMENTO
-- ==========================================
VerificarBtn.MouseButton1Click:Connect(function()
    if InputKey.Text == KeyCorreta then
        VerificarBtn.Text = "Acesso Liberado!"
        VerificarBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        task.wait(0.5)
        KeyGui:Destroy()
        
        -- Carrega o Rayfield
        local success, Rayfield = pcall(function()
            return loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
        end)

        if not success or not Rayfield then
            player:Kick("Erro ao carregar a interface.")
            return
        end

        -- ==========================================
        -- 4. MENU DO HUB
        -- ==========================================
        local Config = { AimlockAtivo = false, MiraPausada = false, FOV = 70, HitboxAtiva = false, HitboxSize = 6, HitboxVisibility = 50, ESPAtivo = false, PausarAoArrastar = false }

        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Name = "ApexFloatingGui"
        ScreenGui.ResetOnSpawn = false
        pcall(function() ScreenGui.Parent = game:GetService("CoreGui") end)
        if not ScreenGui.Parent then ScreenGui.Parent = player.PlayerGui end

        local FloatBtn = Instance.new("TextButton")
        FloatBtn.Name = "AimlockBtn"
        FloatBtn.Size = UDim2.new(0, 120, 0, 45) 
        FloatBtn.Position = UDim2.new(0, 20, 0.5, -25) 
        FloatBtn.BackgroundColor3 = Color3.fromRGB(25, 45, 75)
        FloatBtn.Text = "AIMLOCK"
        FloatBtn.TextColor3 = Color3.new(1, 1, 1)
        FloatBtn.Font = Enum.Font.GothamBold
        FloatBtn.TextSize = 14
        FloatBtn.Visible = false 
        FloatBtn.Parent = ScreenGui

        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 8)
        UICorner.Parent = FloatBtn

        local UIStroke = Instance.new("UIStroke")
        UIStroke.Color = Color3.fromRGB(0, 150, 255)
        UIStroke.Thickness = 1.5
        UIStroke.Transparency = 0.2
        UIStroke.Parent = FloatBtn

        local dragging = false
        local dragInput, dragStart, startPos
        local touchStartTime = 0

        FloatBtn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                Config.PausarAoArrastar = true 
                touchStartTime = os.clock()
                dragStart = input.Position
                startPos = FloatBtn.Position
                
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                        Config.PausarAoArrastar = false 
                        local touchDuration = os.clock() - touchStartTime
                        if touchDuration < 0.2 then
                            Config.MiraPausada = not Config.MiraPausada
                            if Config.MiraPausada then
                                FloatBtn.BackgroundColor3 = Color3.fromRGB(25, 45, 75) 
                                UIStroke.Color = Color3.fromRGB(25, 45, 75)
                            else
                                FloatBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255) 
                                UIStroke.Color = Color3.fromRGB(0, 150, 255)
                            end
                        end
                    end
                end)
            end
        end)

        FloatBtn.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                local delta = input.Position - dragStart
                if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then touchStartTime = 0 end
                FloatBtn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)

        local Window = Rayfield:CreateWindow({
           Name = "Apex Hub", 
           LoadingTitle = "Apex Hub",
           LoadingSubtitle = "by ApexDv",
           Theme = "DarkBlue",
           ConfigurationSaving = {Enabled = false},
           KeySystem = false
        })

        local UpdateTab = Window:CreateTab("Atualizações", "bell")
        local GameTab = Window:CreateTab("Jogo", "gamepad-2")
        local PlayerTab = Window:CreateTab("Jogador", "user")
        local AttentionTab = Window:CreateTab("Atenção", "alert-triangle")

        local ESPObjects = {}
        local function LimparESP()
            for _, v in pairs(ESPObjects) do if v then v.Name:Remove(); v.Health:Remove(); v.Line:Remove() end end
            table.clear(ESPObjects)
        end

        GameTab:CreateSection("Hitbox")
        GameTab:CreateSlider({ Name = "Hitbox Size", Range = {0, 30}, Increment = 0.5, Suffix = "x", CurrentValue = Config.HitboxSize, Callback = function(Value) Config.HitboxSize = Value end, })
        GameTab:CreateSlider({ Name = "Hitbox Invisible", Range = {0, 100}, Increment = 1, Suffix = "%", CurrentValue = Config.HitboxVisibility, Callback = function(Value) Config.HitboxVisibility = Value end, })
        GameTab:CreateToggle({ Name = "Hitbox", CurrentValue = Config.HitboxAtiva, Callback = function(Value) Config.HitboxAtiva = Value; if not Value then for _, p in pairs(Players:GetPlayers()) do if p.Character and p.Character:FindFirstChild("ApexHitbox") then p.Character.ApexHitbox:Destroy() end end end end, })

        GameTab:CreateSection("Câmera")
        GameTab:CreateSlider({ Name = "FOV", Range = {0, 120}, Increment = 1, CurrentValue = Config.FOV, Callback = function(Value) Config.FOV = Value; camera.FieldOfView = Value end, })

        GameTab:CreateSection("Aimlock")
        GameTab:CreateToggle({ Name = "Aimlock", CurrentValue = Config.AimlockAtivo, Callback = function(Value) Config.AimlockAtivo = Value; if Value then FloatBtn.Visible = true; Config.MiraPausada = false; FloatBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255); UIStroke.Color = Color3.fromRGB(0, 150, 255) else FloatBtn.Visible = false; UserInputService.MouseBehavior = Enum.MouseBehavior.Default end end, })

        GameTab:CreateSection("Visual")
        GameTab:CreateToggle({ Name = "ESP", CurrentValue = Config.ESPAtivo, Callback = function(Value) Config.ESPAtivo = Value; if not Value then LimparESP() end end, })

        PlayerTab:CreateSection("Movimento do Jogador")
        PlayerTab:CreateSlider({ Name = "Speed", Range = {16, 300}, Increment = 1, Suffix = "spd", CurrentValue = 16, Callback = function(Value) local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid"); if hum then hum.WalkSpeed = Value end end, })
        PlayerTab:CreateSlider({ Name = "Jump", Range = {50, 500}, Increment = 1, Suffix = "pwr", CurrentValue = 50, Callback = function(Value) local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid"); if hum then hum.JumpPower = Value end end, })

        UpdateTab:CreateSection("Notas de Atualização")
        UpdateTab:CreateParagraph({Title = "Apex Hub v6.6", Content = "Sistema de Key adicionado. ESP atualizado com linha guia."})

        AttentionTab:CreateSection("Aviso")
        AttentionTab:CreateParagraph({Title = "Uso Responsável", Content = "Use apenas em servidores privados."})
        AttentionTab:CreateButton({ Name = "Unload", Callback = function() for _, p in pairs(Players:GetPlayers()) do if p.Character and p.Character:FindFirstChild("ApexHitbox") then p.Character.ApexHitbox:Destroy() end end; LimparESP(); camera.FieldOfView = 70; UserInputService.MouseBehavior = Enum.MouseBehavior.Default; ScreenGui:Destroy(); Rayfield:Destroy() end, })

        local function getClosestTarget()
            local closest = nil; local shortestDist = 300; local viewportCenter = camera.ViewportSize / 2
            for _, p in ipairs(Players:GetPlayers()) do
                if p == player then continue end
                local char = p.Character; if not char then continue end
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                local alvo = Config.HitboxAtiva and char:FindFirstChild("ApexHitbox") or char:FindFirstChild("Head")
                if humanoid and humanoid.Health > 0 and alvo then
                    local screenPos, onScreen = camera:WorldToViewportPoint(alvo.Position)
                    if onScreen then
                        local dist = (Vector2.new(screenPos.X, screenPos.Y) - viewportCenter).Magnitude
                        if dist < shortestDist then shortestDist = dist; closest = alvo end
                    end
                end
            end
            return closest
        end

        RunService.RenderStepped:Connect(function()
            if Config.HitboxAtiva or Config.ESPAtivo then
                for _, p in ipairs(Players:GetPlayers()) do
                    if p == player then continue end
                    local char = p.Character; local head = char and char:FindFirstChild("Head"); local hum = char and char:FindFirstChildOfClass("Humanoid"); local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    if head and hum and hum.Health > 0 then
                        if Config.HitboxAtiva then
                            local hb = char:FindFirstChild("ApexHitbox")
                            if not hb then hb = Instance.new("Part"); hb.Name = "ApexHitbox"; hb.Shape = Enum.PartType.Ball; hb.Color = Color3.fromRGB(0, 0, 0); hb.Material = Enum.Material.SmoothPlastic; hb.CanCollide = false; hb.CanQuery = true; hb.Anchored = true; hb.CastShadow = false; hb.Parent = char end
                            hb.Size = Vector3.new(Config.HitboxSize, Config.HitboxSize, Config.HitboxSize); hb.Transparency = 1 - (Config.HitboxVisibility / 100); hb.CFrame = head.CFrame
                        end
                        if Config.ESPAtivo then
                            if not ESPObjects[p] then
                                ESPObjects[p] = {Name = Drawing.new("Text"), Health = Drawing.new("Text"), Line = Drawing.new("Line")}
                                ESPObjects[p].Name.Center = true; ESPObjects[p].Name.Outline = true; ESPObjects[p].Name.Size = 16; ESPObjects[p].Name.Color = Color3.fromRGB(255, 255, 255)
                                ESPObjects[p].Health.Center = true; ESPObjects[p].Health.Outline = true; ESPObjects[p].Health.Size = 14; ESPObjects[p].Health.Color = Color3.fromRGB(0, 255, 150)
                                ESPObjects[p].Line.Thickness = 1; ESPObjects[p].Line.Transparency = 0.5; ESPObjects[p].Line.Color = Color3.fromRGB(255, 255, 255)
                            end
                            local screenPos, onScreen = camera:WorldToViewportPoint(head.Position + Vector3.new(0, 1.5, 0)); local espData = ESPObjects[p]
                            if onScreen then
                                espData.Name.Visible = true; espData.Name.Text = p.Name; espData.Name.Position = Vector2.new(screenPos.X, screenPos.Y - 20)
                                espData.Health.Visible = true; espData.Health.Text = math.floor(hum.Health) .. " HP"; espData.Health.Position = Vector2.new(screenPos.X, screenPos.Y)
                                espData.Line.Visible = true; local topPos = camera:WorldToViewportPoint(head.Position + Vector3.new(0, 1.5, 0)); local bottomPos = camera:WorldToViewportPoint(hrp.Position - Vector3.new(0, 2.5, 0)); espData.Line.From = Vector2.new(topPos.X, topPos.Y); espData.Line.To = Vector2.new(bottomPos.X, bottomPos.Y)
                            else espData.Name.Visible = false; espData.Health.Visible = false; espData.Line.Visible = false end
                        end
                    else if ESPObjects[p] then ESPObjects[p].Name:Remove(); ESPObjects[p].Health:Remove(); ESPObjects[p].Line:Remove(); ESPObjects[p] = nil end end
                end
            end
            if Config.AimlockAtivo and not Config.MiraPausada and not Config.PausarAoArrastar then
                local alvo = getClosestTarget()
                if alvo then UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter; camera.CFrame = CFrame.new(camera.CFrame.Position, alvo.Position)
                else UserInputService.MouseBehavior = Enum.MouseBehavior.Default end
            else UserInputService.MouseBehavior = Enum.MouseBehavior.Default end
        end)
        
    else
        VerificarBtn.Text = "Key Incorreta!"
        VerificarBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        task.wait(1.5)
        VerificarBtn.Text = "Verificar e Entrar"
        VerificarBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    end
end)
