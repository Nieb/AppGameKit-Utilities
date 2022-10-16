

FUNCTION TEST_data()
    Print("data.agc")
    Print("")

    TEST AS INTEGER
    TEST = SetShort(TEST, 1, 0xFFFF) //|| SetShort(TEST, 0, 0xAAAA)
    TEST = SetShort(TEST, 0, 0xAAAA)

    Print(hex(TEST))
    Print(hex(GetShort(TEST,0)))
    Print(hex(GetShort(TEST,1)))


ENDFUNCTION

