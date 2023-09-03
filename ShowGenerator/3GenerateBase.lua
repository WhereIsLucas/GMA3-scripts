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
    local colorList = {
                {
                    'Name': 'White', 'R': 255, 'G': 255, 'B': 255, 'Gel': 'MA.white',
                },
                {
                    "Name": "CTO", "R": 255, "G": 180, "B": 0, "Gel": "Cinegel.Roscosun 1/2 CTO",
                },
                {
                    "Name": "CTB", "R": 0, "G": 0, "B": 255, "Gel": "Cinegel.Half Blue CTB",
                }
            }
    for i, color in ipairs(colorList) do
        Cmd('Store Appearance '..100+i..' /Overwrite')
        Cmd('Label Appearance '..100+i..' "'..color.Name..'"')
        Cmd('Set Appearance '..100+i..' "BackR" '..color.R)
        Cmd('Set Appearance '..100+i..' "BackG" '..color.G)
        Cmd('Set Appearance '..100+i..' "BackB" '..color.B)
        Cmd('Set Appearance '..100+i..' "BackAlpha" 255')
end

function main()
    generateGroups()
    generateApparences()
end

return main