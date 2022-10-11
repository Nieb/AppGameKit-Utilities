

FUNCTION TEST_data()
    Print("data.agc")
    Print("")

TEST AS INTEGER

TEST = SetShort(TEST, 0, 0xAAAA) || SetShort(TEST, 1, 0xFFFF)

Print(hex(GetShort(TEST,0)))
Print(hex(GetShort(TEST,1)))


ENDFUNCTION

