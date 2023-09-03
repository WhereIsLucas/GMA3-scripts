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

end

function main()
    generateGroups()
    generateApparences()
end

return main