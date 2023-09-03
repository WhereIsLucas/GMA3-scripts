function print (msg)
    -- gma.feedback(msg)
    Echo(msg)
end


function generateGroups()
    local groupList = {'L1','L2','L3','L4','L5','L6'}

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

function generateAppearances()
    local White = {R= 255, G= 255, B= 255, Gel= 'MA.white'}
    local CTO = {R= 255, G= 210, B= 159, Gel= "Cinegel.Roscosun 1/2 CTO"}
    local CTB = {R= 173, G= 255, B= 246, Gel= "Cinegel.Half Blue CTB"}
    local Red = {R= 255, G= 0, B= 0, Gel= "MA.red"}
    local Orange = {R= 255, G= 127, B= 0, Gel= "MA.orange"}
    local Yellow = {R= 255, G= 255, B= 0, Gel= "MA.yellow"}
    local FernGreen = {R= 0, G= 255, B= 0, Gel= "MA.Fern Green"}
    local Green = {R= 0, G= 127, B= 0, Gel= "MA.Green"}
    local SeaGreen = {R= 0, G= 255, B= 127, Gel= "MA.Sea Green"}
    local Cyan = {R= 0, G= 255, B= 255, Gel= "MA.Cyan"}
    local Lavender = {R= 127, G= 0, B= 255, Gel= "MA.Lavender"}
    local Blue = {R= 0, G= 0, B= 255, Gel= "MA.Blue"}
    local Violet = {R= 127, G= 0, B= 255, Gel= "MA.Violet"}
    local Magenta = {R= 255, G= 0, B= 255, Gel= "MA.Magenta"}
    local Pink = {R= 255, G= 0, B= 127, Gel= "MA.Pink"}

    generateColorAppearance('White', White, 1)
    generateColorAppearance('CTO', CTO, 2)
    generateColorAppearance('CTB', CTB, 3)
    generateColorAppearance('Red', Red, 4)
    generateColorAppearance('Orange', Orange, 5)
    generateColorAppearance('Yellow', Yellow, 6)
    generateColorAppearance('Fern Green', FernGreen, 7)
    generateColorAppearance('Green', Green, 8)
    generateColorAppearance('Sea Green', SeaGreen, 9)
    generateColorAppearance('Cyan', Cyan, 10)
    generateColorAppearance('Lavender', Lavender, 11)
    generateColorAppearance('Blue', Blue, 12)
    generateColorAppearance('Violet', Violet, 13)
    generateColorAppearance('Magenta', Magenta, 14)
    generateColorAppearance('Pink', Pink, 15)
end

function generateColorAppearance(label, color, i)
    Cmd('Store Appearance '..100+i..' /Overwrite')
    Cmd('Label Appearance '..100+i..' "'..label..'"')
    Cmd('Set Appearance '..100+i..' "BackR" '..color.R)
    Cmd('Set Appearance '..100+i..' "BackG" '..color.G)
    Cmd('Set Appearance '..100+i..' "BackB" '..color.B)
    Cmd('Set Appearance '..100+i..' "BackAlpha" 255')

    Cmd('Store Appearance '..200+i..' /Overwrite')
    Cmd('Label Appearance '..200+i..' "'..label..' Active"')
    Cmd('Set Appearance '..200+i..' "BackR" '..color.R)
    Cmd('Set Appearance '..200+i..' "BackG" '..color.G)
    Cmd('Set Appearance '..200+i..' "BackB" '..color.B)
    Cmd('Set Appearance '..200+i..' "BackAlpha" 255')
end


function main()
    generateGroups()
    generateAppearances()
end

return main