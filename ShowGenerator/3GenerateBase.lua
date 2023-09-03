function print (msg)
    -- gma.feedback(msg)
    Echo(msg)
end


function generateGroups()
    local groupList = {
    'L1',
    'L2',
    'L3',
    'L4',
    'L5',
    'L6',
    }

    Cmd('ClearAll')

    for i, groupName in ipairs(groupList) do
        Cmd('Store Group '..i..' /Overwrite')
        Cmd('Label Group '..i..' "'..groupName..' Grid"')

        Cmd('Store Group '..(i+18)..' /Overwrite')
        Cmd('Label Group '..(i+18)..' "'..groupName)

       Cmd('Store Group '..(i+36)..' /Overwrite')
       Cmd('Label Group '..(i+36)..' "'..groupName..' Odd"')

       Cmd('Store Group '..(i+54)..' /Overwrite')
       Cmd('Label Group '..(i+54)..' "'..groupName..' Even"')
    end
end

function generateApparences()
    Cmd('Store Appearance 100')
    Cmd('Label Appearance 100 "White"')
    Cmd('Assign Appearance BgColor At 101 / 255 0 0 0 100')

    Cmd('Store Appearance 101')
    Cmd('Label Appearance 101 "CTO"')
    Cmd('Set Appearance 101 At 255 255 204')

    Cmd('Store Appearance 102')
    Cmd('Label Appearance 102 "CTB"')
    Cmd('Set Appearance 102 At 204 255 255')

    Cmd('Store Appearance 103')
    Cmd('Label Appearance 103 "Red"')
    Cmd('Store Appearance 104')
    Cmd('Label Appearance 104 "Orange"')
    Cmd('Store Appearance 105')
    Cmd('Label Appearance 105 "Yellow"')
    Cmd('Store Appearance 106')
    Cmd('Label Appearance 106 "Fern Green"')
    Cmd('Store Appearance 107')
    Cmd('Label Appearance 107 "Green"')
    Cmd('Store Appearance 108')
    Cmd('Label Appearance 108 "Sea Green"')
    Cmd('Store Appearance 109')
    Cmd('Label Appearance 109 "Cyan"')
    Cmd('Store Appearance 110')
    Cmd('Label Appearance 110 "Lavender"')
    Cmd('Store Appearance 111')
    Cmd('Label Appearance 111 "Blue"')
    Cmd('Store Appearance 113')
    Cmd('Label Appearance 113 "Violet"')
    Cmd('Store Appearance 114')
    Cmd('Label Appearance 114 "Magenta"')
    Cmd('Store Appearance 115')
    Cmd('Label Appearance 115 "Pink"')
end

function main()
    generateGroups()
    generateApparences()
end

return main