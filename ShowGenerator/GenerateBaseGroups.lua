function print (msg)
    -- gma.feedback(msg)
    Echo(msg)
end


function groups()
    Cmd('Store Group 1 /Overwrite')
    Cmd('Label Group 1 "Wash 1 Grid"')

    Cmd('Store Group 2 /Overwrite')
    Cmd('Label Group 2 "Wash 2 Grid"')

    Cmd('Store Group 3 /Overwrite')
    Cmd('Label Group 3 "Spots 1 Grid"')

    Cmd('Store Group 4 /Overwrite')
    Cmd('Label Group 4 "Spots 2 Grid"')

    Cmd('Store Group 5 /Overwrite')
    Cmd('Label Group 5 "Extra 1 Grid"')

    Cmd('Store Group 6 /Overwrite')
    Cmd('Label Group 6 "Extra 2 Grid"')

    Cmd('Store Group 11 /Overwrite')
    Cmd('Label Group 11 "Wash 1"')

    Cmd('Store Group 12 /Overwrite')
    Cmd('Label Group 12 "Wash 2"')

    Cmd('Store Group 13 /Overwrite')
    Cmd('Label Group 13 "Spots 1"')

    Cmd('Store Group 14 /Overwrite')
    Cmd('Label Group 14 "Spots 2"')

    Cmd('Store Group 15 /Overwrite')
    Cmd('Label Group 15 "Extra 1"')

    Cmd('Store Group 16 /Overwrite')
    Cmd('Label Group 16 "Extra 2"')
end


function views()
    Cmd('Delete ScreenContent Default."*" /Screen "2"')
    Cmd('Store ViewButton 2.10 "SHOW" /Screen "2" /Overwrite')
    Cmd('Call ViewButton 2.10')
end


function main()
    views()
    groups()
end

return main