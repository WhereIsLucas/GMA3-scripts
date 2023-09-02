function main()
    Cmd("Edit Plugin 1")
    Cmd("Select Drive 2")
    Cmd("Import Library 1 At Plugin 1 /NoConfirmation")

    Cmd("Edit Plugin 2")
    Cmd("Select Drive 2")
    Cmd("Import Library 2 At Plugin 2 /NoConfirmation")

    Cmd("Edit Plugin 3")
    Cmd("Library")
    Cmd("Select Drive 2")
    Cmd("Import Library 3 At Plugin 3 /NoConfirmation")
end

return main