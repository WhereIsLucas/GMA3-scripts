function print (msg)
    Echo(msg)
end

function generateColorPresets()
    Cmd('ClearAll')
    Cmd('Group 1 thru')

    local White = { id = 1, R = 255, G = 255, B = 255, GelCategory = 'MA', GelName = 'white' }
    local CTO = { id = 2, R = 255, G = 210, B = 159, GelCategory = "Cinegel", GelName = "Roscosun 1/2 CTO" }
    local CTB = { id = 3, R = 173, G = 255, B = 246, GelCategory = "Cinegel", GelName = "Half Blue CTB" }
    local Red = { id = 4, R = 255, G = 0, B = 0, GelCategory = "MA", GelName = "red" }
    local Orange = { id = 5, R = 255, G = 127, B = 0, GelCategory = "MA", GelName = "orange" }
    local Yellow = { id = 6, R = 255, G = 255, B = 0, GelCategory = "MA", GelName = "yellow" }
    local FernGreen = { id = 7, R = 0, G = 255, B = 0, GelCategory = "MA", GelName = "Fern Green" }
    local Green = { id = 8, R = 0, G = 127, B = 0, GelCategory = "MA", GelName = "Green" }
    local SeaGreen = { id = 9, R = 0, G = 255, B = 127, GelCategory = "MA", GelName = "Sea Green" }
    local Cyan = { id = 10, R = 0, G = 255, B = 255, GelCategory = "MA", GelName = "Cyan" }
    local Lavender = { id = 11, R = 127, G = 0, B = 255, GelCategory = "MA", GelName = "Lavender" }
    local Blue = { id = 12, R = 0, G = 0, B = 255, GelCategory = "MA", GelName = "Blue" }
    local Violet = { id = 13, R = 127, G = 0, B = 255, GelCategory = "MA", GelName = "Violet" }
    local Magenta = { id = 14, R = 255, G = 0, B = 255, GelCategory = "MA", GelName = "Magenta" }
    local Pink = { id = 15, R = 255, G = 0, B = 127, GelCategory = "MA", GelName = "Pink" }

    generateColorPreset('White', White)
    generateColorPreset('CTO', CTO)
    generateColorPreset('CTB', CTB)
    generateColorPreset('Red', Red)
    generateColorPreset('Orange', Orange)
    generateColorPreset('Yellow', Yellow)
    generateColorPreset('Fern Green', FernGreen)
    generateColorPreset('Green', Green)
    generateColorPreset('Sea Green', SeaGreen)
    generateColorPreset('Cyan', Cyan)
    generateColorPreset('Lavender', Lavender)
    generateColorPreset('Blue', Blue)
    generateColorPreset('Violet', Violet)
    generateColorPreset('Magenta', Magenta)
    generateColorPreset('Pink', Pink)

end

function generateColorPreset(label, data)
    Cmd('At Gel "' .. data.GelCategory .. '"."' .. data.GelName .. '"')
    Cmd('Store Preset 4.' .. data.id .. ' /Overwrite')
    Cmd('Label Preset 4.' .. data.id .. ' "' .. label .. '"')
    Cmd('Assign Appearance "' .. label .. '" At Preset 4.' .. data.id)
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

    local SingleSeqNum = 1000
    for k = 1, 6, 1 do
        for i = 1, 15, 1 do
            local colorNum = i
            Cmd('ClearAll')
            Cmd('Group ' .. k)
            Cmd('At Preset 4.' .. colorNum)
            Cmd('Store Sequence ' .. 100+k .. '/C')
            Cmd('Label Sequence ' .. 100+k .. ' "Colors L"' .. k)
            Cmd('Assign Sequence ' .. 100+k .. ' At Page 1.30' .. k .. ' /O')

            Cmd('ClearAll')
            Cmd('Group ' .. k)
            Cmd('At Preset 4.' .. colorNum)
            Cmd('Delete Sequence ' .. SingleSeqNum)
            Cmd('Store Sequence ' .. SingleSeqNum .. '/C')
            Cmd('Label Sequence ' .. SingleSeqNum .. ' \"Color L\"'.. k .." ".. colorNum)
            Cmd('Assign Appearance ' .. 100 + colorNum .. ' At Sequence ' .. SingleSeqNum .. ' /O')
            SingleSeqNum = SingleSeqNum + 1
        end
    end
end

function generateDimmerSequences()
    Cmd('ClearAll')
    local SeqNum = 2000
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