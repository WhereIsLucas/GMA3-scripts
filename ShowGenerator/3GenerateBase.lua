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
    local White = { id = 1, R = 255, G = 255, B = 255, GelCategory = 'MA', GelName = 'white' }
    local CTO = { id = 2, R = 255, G = 210, B = 159, GelCategory = "Cinegel", GelName = "Roscosun 1/2 CTO" }
    local CTB = { id = 3, R = 173, G = 255, B = 246, GelCategory = "Cinegel", GelName = "Half Blue CTB" }
    local Red = { id = 4, R = 255, G = 0, B = 0, GelCategory = "MA", GelName = "red" }
    local Orange = { id = 5, R = 255, G = 127, B = 0, GelCategory = "MA", GelName = "orange" }
    local Yellow = { id = 6, R = 255, G = 255, B = 0, GelCategory = "MA", GelName = "yellow" }
    local FernGreen = { id = 7, R = 0, G = 255, B = 0, GelCategory = "MA", GelName = "Fern Green" }
    local Green = { id = 8, R = 0, G = 127, B = 0, GelCategory = "MA", GelName = "Green" }
    local SeaGreen = { id = 9, R = 0, G = 255, B = 127, GelCategory = "MA", GelName = "Sea Green" }
    local Cyan = { id = 10, R = 0, G = 255, B = 255, GelCategory = "MA", GelName = "Cyan" }
    local Lavender = { id = 11, R = 127, G = 0, B = 255, GelCategory = "MA", GelName = "Lavender" }
    local Blue = { id = 12, R = 0, G = 0, B = 255, GelCategory = "MA", GelName = "Blue" }
    local Violet = { id = 13, R = 127, G = 0, B = 255, GelCategory = "MA", GelName = "Violet" }
    local Magenta = { id = 14, R = 255, G = 0, B = 255, GelCategory = "MA", GelName = "Magenta" }
    local Pink = { id = 15, R = 255, G = 0, B = 127, GelCategory = "MA", GelName = "Pink" }

    generateColorAppearance('White', White)
    generateColorAppearance('CTO', CTO)
    generateColorAppearance('CTB', CTB)
    generateColorAppearance('Red', Red)
    generateColorAppearance('Orange', Orange)
    generateColorAppearance('Yellow', Yellow)
    generateColorAppearance('Fern Green', FernGreen)
    generateColorAppearance('Green', Green)
    generateColorAppearance('Sea Green', SeaGreen)
    generateColorAppearance('Cyan', Cyan)
    generateColorAppearance('Lavender', Lavender)
    generateColorAppearance('Blue', Blue)
    generateColorAppearance('Violet', Violet)
    generateColorAppearance('Magenta', Magenta)
    generateColorAppearance('Pink', Pink)
end

function generateColorAppearance(label, data)
    Cmd('Store Appearance '..100+data.id..' /Overwrite')
    Cmd('Label Appearance '..100+data.id..' "'..label..'"')
    Cmd('Set Appearance '..100+data.id..' "BackR" '.. data.R)
    Cmd('Set Appearance '..100+data.id..' "BackG" '.. data.G)
    Cmd('Set Appearance '..100+data.id..' "BackB" '.. data.B)
    Cmd('Set Appearance '..100+data.id..' "BackAlpha" 255')

    Cmd('Store Appearance '..200+data.id..' /Overwrite')
    Cmd('Label Appearance '..200+data.id..' "'..label..' Active"')
    Cmd('Set Appearance '..200+data.id..' "BackR" '.. data.R)
    Cmd('Set Appearance '..200+data.id..' "BackG" '.. data.G)
    Cmd('Set Appearance '..200+data.id..' "BackB" '.. data.B)
    Cmd('Set Appearance '..200+data.id..' "BackAlpha" 255')
end


function main()
    generateGroups()
    generateAppearances()
end

return main