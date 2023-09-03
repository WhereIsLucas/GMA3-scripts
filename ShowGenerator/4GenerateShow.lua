function print (msg)
    -- gma.feedback(msg)
    Echo(msg)
end

function generateColorPresets()
    Cmd('ClearAll')
    Cmd('Group 1 thru')

    Cmd('At Gel "MA"."white"')
    Cmd('Store Preset 4.1 /Overwrite')
    Cmd('Label Preset 4.1 "White"')

    Cmd('At Gel "Cinegel"."Roscosun 1/2 CTO"')
    Cmd('Store Preset 4.2 /Overwrite')
    Cmd('Label Preset 4.2 "CTO"')

    Cmd('At Gel "Cinegel"."Half Blue CTB"')
    Cmd('Store Preset 4.3 /Overwrite')
    Cmd('Label Preset 4.3 "CTB"')

    Cmd('At Gel "MA"."red"')
    Cmd('Store Preset 4.4 /Overwrite')
    Cmd('Label Preset 4.4 "Red"')

    Cmd('At Gel "MA"."orange"')
    Cmd('Store Preset 4.5 /Overwrite')
    Cmd('Label Preset 4.5 "Orange"')

    Cmd('At Gel "MA"."yellow"')
    Cmd('Store Preset 4.6 /Overwrite')
    Cmd('Label Preset 4.6 "Yellow"')

    Cmd('At Gel "MA"."Fern Green"')
    Cmd('Store Preset 4.7 /Overwrite')
    Cmd('Label Preset 4.7 "Fern Green"')

    Cmd('At Gel "MA"."Green"')
    Cmd('Store Preset 4.8 /Overwrite')
    Cmd('Label Preset 4.8 "Green"')

    Cmd('At Gel "MA"."Sea Green"')
    Cmd('Store Preset 4.9 /Overwrite')
    Cmd('Label Preset 4.9 "Sea Green"')

    Cmd('At Gel "MA"."Cyan"')
    Cmd('Store Preset 4.10 /Overwrite')
    Cmd('Label Preset 4.10 "Cyan"')

    Cmd('At Gel "MA"."Lavender"')
    Cmd('Store Preset 4.11 /Overwrite')
    Cmd('Label Preset 4.11 "Lavender"')

    Cmd('At Gel "MA"."Blue"')
    Cmd('Store Preset 4.12 /Overwrite')
    Cmd('Label Preset 4.12 "Blue"')

    Cmd('At Gel "MA"."Violet"')
    Cmd('Store Preset 4.13 /Overwrite')
    Cmd('Label Preset 4.13 "Violet"')

    Cmd('At Gel "MA"."Magenta"')
    Cmd('Store Preset 4.14 /Overwrite')
    Cmd('Label Preset 4.14 "Magenta"')

    Cmd('At Gel "MA"."Pink"')
    Cmd('Store Preset 4.15 /Overwrite')
    Cmd('Label Preset 4.15 "Pink"')
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
    local colorList = {
                'White',
                'CTO',
                'CTB',
                'Red',
                'Orange',
                'Yellow',
                'Fern Green',
                'Green',
                'Sea Green',
                'Cyan',
                'Lavender',
                'Blue',
                'Violet',
                'Magenta',
                'Pink'
            }
    SeqNum = 3000
    for k = 1, 6, 1 do
        for i = 1, 15, 1 do
            local colorNum = i
            Cmd('Group '.. k)
            SeqNum = SeqNum + 1
            Cmd('At Preset 4.'..colorNum)

            Cmd('Store Sequence '..k.. '/C')
            Cmd('Label Sequence '..k..' \"'..colorList[i]..'\"')
        end
    end
end

function generateDimmerSequences()
    Cmd('ClearAll')
    SeqNum = 2000
    for k = 1, 6, 1 do
        SeqNum = SeqNum + 1
        Cmd('Group '.. k)
        Cmd('At Preset 1.1')
        Cmd('Delete Sequence '..SeqNum)
        Cmd('Store Sequence '..SeqNum.. ' /O')
        Cmd('Assign Sequence '..SeqNum.. ' At Page 1.20'..k..' /O')
        Cmd('Label Sequence '..SeqNum..' \"Dim Group\"')
        Cmd('Edit Page 1.20'..k..' At Flash')
    end
end

function generatePositionsPresets()
    Cmd('ClearAll')
    for k = 1, 6, 1 do
        Cmd('Group '.. k)
        Cmd('Group '.. k+18)
        Cmd('Attribute "Pan" At Absolute Physical 0')
        Cmd('Attribute "Tilt" At Absolute Physical -45')
        Cmd('Store Preset 2. "Straight" /Merge')
        Cmd('Attribute "Pan" At Absolute Physical 30 Thru -30')
        Cmd('Store Preset 2. "Fan In" /Merge')
        Cmd('Attribute "Pan" At Absolute Physical -30 Thru 30')
        Cmd('Store Preset 2. "Fan Out" /Merge')

        Cmd('Group '.. k+36)
        Cmd('Attribute "Pan" At Absolute Physical -30')
        Cmd('Group '.. k+72)
        Cmd('Attribute "Pan" At Absolute Physical 30')

        Cmd('Group '.. k)
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

    Cmd('Set Preset 2 Property "PresetMode" "Universal"')
    generatePositionsPresets()

    Cmd('Set Preset 4 Property "PresetMode" "Universal"')
    generateColorPresets()

    generateColorSequences()
    Cmd('blind off')
    print('End of plugin')
end

return main