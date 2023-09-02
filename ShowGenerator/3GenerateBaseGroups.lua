function print (msg)
    -- gma.feedback(msg)
    Echo(msg)
end


function generateGroups()
    local groupList = {
    'Wash 1',
    'Wash 2',
    'Spots 1',
    'Spots 2',
    'Extra 1',
    'Extra 2',
    }

    Cmd('ClearAll')

    for i, groupName in ipairs(groupList) do
        Cmd('Store Group '..i..' /Overwrite')
        Cmd('Label Group '..i..' "'..groupName..' Grid"')

        Cmd('Store Group '..(i+10)..' /Overwrite')
        Cmd('Label Group '..(i+10)..' "'..groupName)

       Cmd('Store Group '..(i+20)..' /Overwrite')
       Cmd('Label Group '..(i+20)..' "'..groupName..' Odd"')

       Cmd('Store Group '..(i+30)..' /Overwrite')
       Cmd('Label Group '..(i+30)..' "'..groupName..' Even"')
    end
end


function main()
    generateGroups()
end

return main