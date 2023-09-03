function print (msg)
    -- gma.feedback(msg)
    Echo(msg)
end


function generateGroups()
    local groupList = {
    'L 1',
    'L 2',
    'L 3',
    'L 4',
    'L 5',
    'L 6',
    }

    Cmd('ClearAll')

    for i, groupName in ipairs(groupList) do
        Cmd('Store Group '..i..' /Overwrite')
        Cmd('Label Group '..i..' "'..groupName..' Grid"')

        Cmd('Store Group '..(i+18)..' /Overwrite')
        Cmd('Label Group '..(i+18)..' "'..groupName)

       Cmd('Store Group '..(i+36)..' /Overwrite')
       Cmd('Label Group '..(i+36)..' "'..groupName..' Odd"')

       Cmd('Store Group '..(i+72)..' /Overwrite')
       Cmd('Label Group '..(i+72)..' "'..groupName..' Even"')
    end
end


function main()
    generateGroups()
end

return main