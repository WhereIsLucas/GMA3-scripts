local White = { id = 1, R = 255, G = 255, B = 255, GelCategory = 'MA', GelName = 'white' , Name= 'White'}
local CTO = { id = 2, R = 255, G = 210, B = 159, GelCategory = "Cinegel", GelName = "Roscosun 1/2 CTO" , Name= 'CTO'}
local CTB = { id = 3, R = 173, G = 255, B = 246, GelCategory = "Cinegel", GelName = "Half Blue CTB" , Name= 'CTB'}
local Red = { id = 4, R = 255, G = 0, B = 0, GelCategory = "MA", GelName = "red" , Name= 'Red'}
local Orange = { id = 5, R = 255, G = 127, B = 0, GelCategory = "MA", GelName = "orange" , Name= 'Orange'}
local Yellow = { id = 6, R = 255, G = 255, B = 0, GelCategory = "MA", GelName = "yellow" , Name= 'Yellow'}
local FernGreen = { id = 7, R = 0, G = 255, B = 0, GelCategory = "MA", GelName = "Fern Green" , Name= 'Fern Green'}
local Green = { id = 8, R = 0, G = 127, B = 0, GelCategory = "MA", GelName = "Green" , Name= 'Green'}
local SeaGreen = { id = 9, R = 0, G = 255, B = 127, GelCategory = "MA", GelName = "Sea Green" , Name= 'Sea Green'}
local Cyan = { id = 10, R = 0, G = 255, B = 255, GelCategory = "MA", GelName = "Cyan" , Name= 'Cyan'}
local Lavender = { id = 11, R = 127, G = 0, B = 255, GelCategory = "MA", GelName = "Lavender" , Name= 'Lavender'}
local Blue = { id = 12, R = 0, G = 0, B = 255, GelCategory = "MA", GelName = "Blue" , Name= 'Blue'}
local Violet = { id = 13, R = 127, G = 0, B = 255, GelCategory = "MA", GelName = "Violet" , Name= 'Violet'}
local Magenta = { id = 14, R = 255, G = 0, B = 255, GelCategory = "MA", GelName = "Magenta" , Name= 'Magenta'}
local Pink = { id = 15, R = 255, G = 0, B = 127, GelCategory = "MA", GelName = "Pink" , Name= 'Pink'}

local colors = {White,CTO,CTB,Red,Orange,Yellow,FernGreen,Green,SeaGreen,Cyan,Lavender,Blue,Violet,Magenta,Pink}

local dimmerStops = {100, 75, 50, 25, 0}

local Straight = { id = 1, Pan = 0, Tilt = 45, Name = 'Straight'}
local FanIn = { id = 2, Pan = 30, Tilt = 45, Name = 'Fan In'}
local FanOut = { id = 3, Pan = -30, Tilt = 45, Name = 'Fan Out'}
local Cross1 = { id = 4, Pan = 0, Tilt = 45, Name = 'Cross 1'}
local Cross2 = { id = 4, Pan = 0, Tilt = 45, Name = 'Cross 2'}
local Cross3 = { id = 4, Pan = 0, Tilt = 45, Name = 'Cross 3'}
local Blind = { id = 5, Pan = 0, Tilt = 60, Name = 'Blind'}
local Sky = { id = 6, Pan = 0, Tilt = 0, Name = 'Sky'}
local Custom1 = { id = 7, Pan = 0, Tilt = 0, Name = 'Custom 1'}
local Custom2 = { id = 8, Pan = 0, Tilt = 0, Name = 'Custom 2'}
local Custom3 = { id = 9, Pan = 0, Tilt = 0, Name = 'Custom 3'}

local positions = {Straight, FanIn, FanOut, Cross1, Cross2, Cross3, Blind, Sky, Custom1, Custom2, Custom3}

function generateColorPresets()
    Cmd('ClearAll')
    Cmd('Group 1 thru')
    for i, color in pairs(colors) do
        generateColorPreset(color.Name, color)
    end

end

function generateColorPreset(label, data)
    Cmd('At Gel "' .. data.GelCategory .. '"."' .. data.GelName .. '"')
    Cmd('Store Preset 4.' .. data.id .. ' /Overwrite')
    Cmd('Label Preset 4.' .. data.id .. ' "' .. label .. '"')
    Cmd('Assign Appearance "' .. label .. '" At Preset 4.' .. data.id)
end

function generateDimmerPresets()
    Cmd('ClearAll')
    for i, dimmerVal in ipairs(dimmerStops) do
        Cmd('Group 1 At '..dimmerVal)
        Cmd('Store Preset 1.'..i..' /Overwrite')
        Cmd('Label Preset 1.'..i..' "'..dimmerVal..'%"')
    end
end

function generateColorSequences()
    Cmd('ClearAll')

    local SingleSeqNum = 1000
    for k = 1, 6, 1 do
        Cmd('Delete Sequence ' .. 100+k .. '/C')
        for i, color in ipairs(colors) do
            Cmd('ClearAll')
            Cmd('Group ' .. k)
            Cmd('At Preset 4.' .. color.id)
            Cmd('Store Sequence ' .. 100+k .. '/C')
            Cmd('Label Sequence ' .. 100+k .. ' "Colors L' .. k..'"')
            Cmd('Assign Sequence ' .. 100+k .. ' At Page 1.30' .. k .. ' /O')

            Cmd('ClearAll')
            Cmd('Group ' .. k)
            Cmd('At Preset 4.' .. color.id)
            Cmd('Delete Sequence ' .. SingleSeqNum)
            Cmd('Store Sequence ' .. SingleSeqNum .. '/C')
            Cmd('Label Sequence ' .. SingleSeqNum .. ' \"L'.. k ..' '.. color.Name..'\"')
            Cmd('Assign Appearance ' .. 100 + color.id .. ' At Sequence ' .. SingleSeqNum .. ' /O')
            SingleSeqNum = SingleSeqNum + 1
        end
    end
end

function generateAllColorMacros()
    Cmd('ClearAll')
    for i, color in ipairs(colors) do
        Cmd('ChangeDestination Macro')
        Cmd('Store ' .. 100 + color.id .. ' /Overwrite')
        Cmd('ChangeDestination '..100+color.id)
        Cmd('Label Macro ' .. 100 + color.id .. ' "All ' .. color.Name..'"')
        for k = 1, 6, 1 do
            Cmd('Insert')
            Cmd('Set '..k..' Property "Command" ' .. '"Go+ Sequence \'L' .. k .. ' ' .. color.Name .. '\'')
        end
        Cmd('ChangeDestination Root')
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
        Cmd("Set CueFade 0/0.5 Sequence "..SeqNum.." Cue \"OffCue\"")
        Cmd('Assign Sequence ' .. SeqNum .. ' At Page 1.10' .. k .. ' /O')
        Cmd('Label Sequence ' .. SeqNum .. ' \"Dim L\"' .. k)
        Cmd('Set Page 1.10' .. k .. ' "Key" "Flash"')
        Cmd('Set Page 1.20' .. k .. ' "Key" "Temp"')
        Cmd('Set Page 1.20' .. k .. ' "Key" "Temp"')

    end
end

function generatePositionsPresets()
    Cmd('ClearAll')
    for k = 1, 6, 1 do
        Cmd('Group "L' .. k..'"')
        Cmd('Attribute "Pan" At Absolute Physical 0')
        Cmd('Attribute "Tilt" At Absolute Physical -45')
        Cmd('Store Preset 2. "Straight" /Merge')

        Cmd('Group "L' .. k..' Odd" + Group "L' .. k..' Even"')
        Cmd('Attribute "Pan" At Absolute Physical 30 Thru -30')
        Cmd('Clear')
        Cmd('Group "L' .. k..' Ground"')
        Cmd('Attribute "Pan" At Absolute Physical 30 Thru -30')
        Cmd('Group "L' .. k..'"')
        Cmd('Store Preset 2. "Fan In" /Merge')

        Cmd('Group "L' .. k..' Odd" + Group "L' .. k..' Even"')
        Cmd('Attribute "Pan" At Absolute Physical -30 Thru 30')
        Cmd('Clear')
        Cmd('Group "L' .. k..' Ground"')
        Cmd('Attribute "Pan" At Absolute Physical -30 Thru 30')
        Cmd('Group "L' .. k..'"')
        Cmd('Store Preset 2. "Fan Out" /Merge')
        Cmd('ClearAll')

        Cmd('Group "L' .. k..' Odd"')
        Cmd('Attribute "Pan" At Absolute Physical -30')
        Cmd('Group "L' .. k..' Even"')
        Cmd('Attribute "Pan" At Absolute Physical 30')
        Cmd('Group "L' .. k..' Ground"')
        Cmd('Attribute "Pan" At Absolute Physical 0')
        Cmd('Store Preset 2. "Cross" /Merge')

        Cmd('Group "L' .. k..'"')
        Cmd('Attribute "Tilt" At Absolute Physical -60')
        Cmd('Attribute "Pan" At Preset 2. "Straight"')
        Cmd('Store Preset 2. "Blind" /Merge')

        Cmd('ClearAll')
    end
end

function generatePositionsSequences()
    Cmd('ClearAll')

    local SingleSeqNum = 2000
    for k = 1, 6, 1 do
        for i, position in ipairs(positions) do
            Cmd('ClearAll')
            Cmd('Group ' .. k)
            Cmd('At Preset 2.' .. i)
            Cmd('Delete Sequence ' .. SingleSeqNum)
            Cmd('Store Sequence ' .. SingleSeqNum .. '/O')
            Cmd('Label Sequence ' .. SingleSeqNum .. ' \"L'.. k ..' '.. position.Name ..'\"')
            Cmd('Assign Appearance ' .. 1100 + position.id .. ' At Sequence ' .. SingleSeqNum .. ' /O')
            SingleSeqNum = SingleSeqNum + 1
        end
    end
end

function generateZoomPresets()
    Cmd('ClearAll')
    for k = 1, 6, 1 do
        Cmd('Group ' .. k)
        Cmd('Group ' .. k + 18)
        Cmd('Attribute "Zoom 1" At "wide"')
        Cmd('Store Preset 6. "Wide" /Merge')
        Cmd('Attribute "Zoom 1" At "normal"')
        Cmd('Store Preset 6. "Normal" /Merge')
        Cmd('Attribute "Zoom 1" At "narrow"')
        Cmd('Store Preset 6. "Narrow" /Merge')
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
    generatePositionsSequences()

    Cmd('Set Preset 4 Property "PresetMode" "Universal"')
    generateColorPresets()
    generateColorSequences()
    generateAllColorMacros()

    Cmd('Set Preset 6 Property "PresetMode" "Selective"')
    generateZoomPresets()

    Cmd('blind off')
end

return main