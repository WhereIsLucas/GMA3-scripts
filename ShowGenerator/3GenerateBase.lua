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
    Cmd('Store Appearance 101')
    Cmd('Label Appearance 101 "White"')
    Cmd('Set Appearance 101 "BackR" 255')
    Cmd('Set Appearance 101 "BackG" 255')
    Cmd('Set Appearance 101 "BackB" 255')
    Cmd('Set Appearance 101 "BackAlpha" 255')

    Cmd('Store Appearance 102')
    Cmd('Label Appearance 102 "CTO"')
    Cmd('Set Appearance 102 "BackR" 255')
    Cmd('Set Appearance 102 "BackG" 210')
    Cmd('Set Appearance 102 "BackB" 159')
    Cmd('Set Appearance 102 "BackAlpha" 255')

    Cmd('Store Appearance 103')
    Cmd('Label Appearance 103 "CTB"')
    Cmd('Set Appearance 103 "BackR" 159')
    Cmd('Set Appearance 103 "BackG" 210')
    Cmd('Set Appearance 103 "BackB" 255')
    Cmd('Set Appearance 103 "BackAlpha" 255')

    Cmd('Store Appearance 104')
    Cmd('Label Appearance 104 "Red"')
    Cmd('Set Appearance 104 "BackR" 255')
    Cmd('Set Appearance 104 "BackG" 0')
    Cmd('Set Appearance 104 "BackB" 0')
    Cmd('Set Appearance 104 "BackAlpha" 255')

    Cmd('Store Appearance 105')
    Cmd('Label Appearance 105 "Orange"')
    Cmd('Set Appearance 105 "BackR" 255')
    Cmd('Set Appearance 105 "BackG" 127')
    Cmd('Set Appearance 105 "BackB" 0')
    Cmd('Set Appearance 105 "BackAlpha" 255')

    Cmd('Store Appearance 106')
    Cmd('Label Appearance 106 "Yellow"')
    Cmd('Set Appearance 106 "BackR" 255')
    Cmd('Set Appearance 106 "BackG" 255')
    Cmd('Set Appearance 106 "BackB" 0')
    Cmd('Set Appearance 106 "BackAlpha" 255')

    Cmd('Store Appearance 107')
    Cmd('Label Appearance 107 "Fern Green"')
    Cmd('Set Appearance 107 "BackR" 127')
    Cmd('Set Appearance 107 "BackG" 255')
    Cmd('Set Appearance 107 "BackB" 0')

    Cmd('Store Appearance 108')
    Cmd('Label Appearance 108 "Green"')
    Cmd('Set Appearance 108 "BackR" 0')
    Cmd('Set Appearance 108 "BackG" 255')
    Cmd('Set Appearance 108 "BackB" 0')
    Cmd('Set Appearance 108 "BackAlpha" 255')

    Cmd('Store Appearance 109')
    Cmd('Label Appearance 109 "Sea Green"')
    Cmd('Set Appearance 109 "BackR" 0')
    Cmd('Set Appearance 109 "BackG" 255')
    Cmd('Set Appearance 109 "BackB" 127')
    Cmd('Set Appearance 109 "BackAlpha" 255')

    Cmd('Store Appearance 110')
    Cmd('Label Appearance 110 "Cyan"')
    Cmd('Set Appearance 110 "BackR" 0')
    Cmd('Set Appearance 110 "BackG" 255')
    Cmd('Set Appearance 110 "BackB" 255')
    Cmd('Set Appearance 110 "BackAlpha" 255')

    Cmd('Store Appearance 111')
    Cmd('Label Appearance 111 "Lavender"')
    Cmd('Set Appearance 111 "BackR" 127')
    Cmd('Set Appearance 111 "BackG" 0')
    Cmd('Set Appearance 111 "BackB" 255')
    Cmd('Set Appearance 111 "BackAlpha" 255')

    Cmd('Store Appearance 112')
    Cmd('Label Appearance 112 "Blue"')
    Cmd('Set Appearance 112 "BackR" 0')
    Cmd('Set Appearance 112 "BackG" 0')
    Cmd('Set Appearance 112 "BackB" 255')
    Cmd('Set Appearance 112 "BackAlpha" 255')

    Cmd('Store Appearance 113')
    Cmd('Label Appearance 113 "Violet"')
    Cmd('Set Appearance 113 "BackR" 127')
    Cmd('Set Appearance 113 "BackG" 0')
    Cmd('Set Appearance 113 "BackB" 255')
    Cmd('Set Appearance 113 "BackAlpha" 255')

    Cmd('Store Appearance 114')
    Cmd('Label Appearance 114 "Magenta"')
    Cmd('Set Appearance 114 "BackR" 255')
    Cmd('Set Appearance 114 "BackG" 0')
    Cmd('Set Appearance 114 "BackB" 255')
    Cmd('Set Appearance 114 "BackAlpha" 255')

    Cmd('Store Appearance 115')
    Cmd('Label Appearance 115 "Pink"')
    Cmd('Set Appearance 115 "BackR" 255')
    Cmd('Set Appearance 115 "BackG" 0')
    Cmd('Set Appearance 115 "BackB" 127')
    Cmd('Set Appearance 115 "BackAlpha" 255')





end

function main()
    generateGroups()
    generateApparences()
end

return main