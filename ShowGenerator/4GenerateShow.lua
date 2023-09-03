function print (msg)
    -- gma.feedback(msg)
    -- Hello Lucas from laptop
    Echo(msg)
end

function generateColorPresets()
    Cmd('ClearAll')
    Cmd('Group 1 thru')

    local White = { R = 255, G = 255, B = 255, GelCategory = 'MA', GelName = 'white' }
    local CTO = { R = 255, G = 210, B = 159, GelCategory = "Cinegel", GelName = "Roscosun 1/2 CTO" }
    local CTB = { R = 173, G = 255, B = 246, GelCategory = "Cinegel", GelName = "Half Blue CTB" }
    local Red = { R = 255, G = 0, B = 0, GelCategory = "MA", GelName = "red" }
    local Orange = { R = 255, G = 127, B = 0, GelCategory = "MA", GelName = "orange" }
    local Yellow = { R = 255, G = 255, B = 0, GelCategory = "MA", GelName = "yellow" }
    local FernGreen = { R = 0, G = 255, B = 0, GelCategory = "MA", GelName = "Fern Green" }
    local Green = { R = 0, G = 127, B = 0, GelCategory = "MA", GelName = "Green" }
    local SeaGreen = { R = 0, G = 255, B = 127, GelCategory = "MA", GelName = "Sea Green" }
    local Cyan = { R = 0, G = 255, B = 255, GelCategory = "MA", GelName = "Cyan" }
    local Lavender = { R = 127, G = 0, B = 255, GelCategory = "MA", GelName = "Lavender" }
    local Blue = { R = 0, G = 0, B = 255, GelCategory = "MA", GelName = "Blue" }
    local Violet = { R = 127, G = 0, B = 255, GelCategory = "MA", GelName = "Violet" }
    local Magenta = { R = 255, G = 0, B = 255, GelCategory = "MA", GelName = "Magenta" }
    local Pink = { R = 255, G = 0, B = 127, GelCategory = "MA", GelName = "Pink" }

    generateColorPreset('White', White, 1)
    generateColorPreset('CTO', CTO, 2)
    generateColorPreset('CTB', CTB, 3)
    generateColorPreset('Red', Red, 4)
    generateColorPreset('Orange', Orange, 5)
    generateColorPreset('Yellow', Yellow, 6)
    generateColorPreset('Fern Green', FernGreen, 7)
    generateColorPreset('Green', Green, 8)
    generateColorPreset('Sea Green', SeaGreen, 9)
    generateColorPreset('Cyan', Cyan, 10)
    generateColorPreset('Lavender', Lavender, 11)
    generateColorPreset('Blue', Blue, 12)
    generateColorPreset('Violet', Violet, 13)
    generateColorPreset('Magenta', Magenta, 14)
    generateColorPreset('Pink', Pink, 15)

end

function generateColorPreset(label, data, i)
    Cmd('At Gel "' .. data.GelCategory .. '."' .. data.GelName .. '"')
    Cmd('Store Preset 4.' .. i .. ' /Overwrite')
    Cmd('Label Preset 4.' .. i .. ' "' .. label .. '"')
    Cmd('Assign Appearance "' .. label .. '" At Preset 4.' .. i)
end

function generateDimmerPresets()
    Cmd('ClearAll')
    Cmd('Group 1 At 100')
    Cmd('Store Preset 1.1 /Overwrite')
    Cmd('Label Preset 1.1 "100%"')

    Cmd('Group 1 At 75')
    Cmd('Store Preset 1.2 /Overwrite')
    Cmd('Label Preset 1.2 "75%"')

    Cmd('Group 1 At 50')
    Cmd('Store Preset 1.3 /Overwrite')
    Cmd('Label Preset 1.3 "50%"')

    Cmd('Group 1 At 25')
    Cmd('Store Preset 1.4 /Overwrite')
    Cmd('Label Preset 1.4 "25%"')

    Cmd('Group 1 At 0')
    Cmd('Store Preset 1.5 /Overwrite')
    Cmd('Label Preset 1.5 "0%"')
end

function generateColorSequences()
    Cmd('ClearAll')
    SeqNum = 3000
    for k = 1, 6, 1 do
        for i = 1, 15, 1 do
            local colorNum = i
            Cmd('Group ' .. k)
            SeqNum = SeqNum + 1
            Cmd('At Preset 4.' .. colorNum)
            Cmd('Store Sequence ' .. k .. '/C')
            Cmd('Label Sequence ' .. k .. ' \" "Colors L' .. k .. '"\"')
            Cmd('Assign Sequence ' .. k .. ' At Page 1.40' .. k .. ' /O')
        end

    end
end

function generateDimmerSequences()
    Cmd('ClearAll')
    SeqNum = 2000
    for k = 1, 6, 1 do
        SeqNum = SeqNum + 1
        Cmd('Group ' .. k)
        Cmd('At Preset 1.1')
        Cmd('Delete Sequence ' .. SeqNum)
        Cmd('Store Sequence ' .. SeqNum .. ' /O')
        Cmd('Assign Sequence ' .. SeqNum .. ' At Page 1.20' .. k .. ' /O')
        Cmd('Label Sequence ' .. SeqNum .. ' \"Dim L\"' .. k)
        Cmd('Set Page 1.20' .. k .. ' "Key" "Flash"')
    end
end

function generatePositionsPresets()
    Cmd('ClearAll')
    for k = 1, 6, 1 do
        Cmd('Group ' .. k)
        Cmd('Group ' .. k + 18)
        Cmd('Attribute "Pan" At Absolute Physical 0')
        Cmd('Attribute "Tilt" At Absolute Physical -45')
        Cmd('Store Preset 2. "Straight" /Merge')
        Cmd('Attribute "Pan" At Absolute Physical 30 Thru -30')
        Cmd('Store Preset 2. "Fan In" /Merge')
        Cmd('Attribute "Pan" At Absolute Physical -30 Thru 30')
        Cmd('Store Preset 2. "Fan Out" /Merge')

        Cmd('ClearAll')
        Cmd('Group ' .. k + 36) -- this is the group for the even
        Cmd('Attribute "Pan" At Absolute Physical -30')
        Cmd('Group ' .. k + 54) -- this is the group for the odds
        Cmd('Attribute "Pan" At Absolute Physical 30')

        Cmd('Group ' .. k)
        Cmd('Group ' .. k + 18)
        Cmd('Store Preset 2. "Cross" /Merge')
        Cmd('Attribute "Tilt" At Absolute Physical -95')
        Cmd('Attribute "Pan" At Preset 2. "Straight"')
        Cmd('Store Preset 2."UP Straight" /Merge')
        Cmd('At Preset 2. "UP Straight"')
        Cmd('Attribute "Pan" At Preset 2. "Fan In"')
        Cmd('Store Preset 2. "UP Fan In" /Merge')
        Cmd('At Preset 2. "UP Fan In"')
        Cmd('Attribute "Pan" At Preset 2. "Fan Out"')
        Cmd('Store Preset 2. "UP Fan Out" /Merge')
        Cmd('At Preset 2. "UP Fan Out"')
        Cmd('Attribute "Pan" At Preset 2. "Cross"')
        Cmd('Store Preset 2."UP Cross" /Merge')
        Cmd('Attribute "Tilt" At Absolute Physical -60')
        Cmd('Attribute "Pan" At Preset 2. "Straight"')
        Cmd('Store Preset 2. "Blind" /Merge')
        Cmd('ClearAll')
    end
end

function main()
    Cmd('blind')
    Cmd('Set Preset 1 Property "PresetMode" "Universal"')
    generateDimmerPresets()
    generateDimmerSequences()

    Cmd('Set Preset 2 Property "PresetMode" "Selective"')
    generatePositionsPresets()

    Cmd('Set Preset 4 Property "PresetMode" "Universal"')
    generateColorPresets()

    generateColorSequences()
    Cmd('blind off')
end

return main