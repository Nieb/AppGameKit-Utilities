

GLOBAL TEST_TypeStr_Which AS INTEGER = 0


FUNCTION TEST_type_string()
    Print("string.agc    page:"+str(TEST_TypeStr_Which))
    Print("")
    //##################################################################################################################################################################################
    //##################################################################################################################################################################################
    IF     GetRawKeyPressed(KEY_Arrow_Down) : DEC TEST_TypeStr_Which : IF TEST_TypeStr_Which < 0 THEN TEST_TypeStr_Which = 2
    ELSEIF GetRawKeyPressed(KEY_Arrow_Up)   : INC TEST_TypeStr_Which : IF TEST_TypeStr_Which > 2 THEN TEST_TypeStr_Which = 0
    ENDIF
    //##################################################################################################################################################################################
    //##################################################################################################################################################################################
    IF TEST_TypeStr_Which = 0

        Print("--------  PadStr()  ------------------------")
        Print("")
        Print("  PadStr( 1.1,   "+chr(34)+" "+chr(34)+", 12, 12 ) = " + PadStr( 1.1,   " ", 12, 12 ))
        Print("  PadStr( 1.1, "+chr(34)+"ab "+chr(34)+", 12, 12 ) = " + PadStr( 1.1, "ab ", 12, 12 ))
        Print("  PadStr( 1.1,   "+chr(34)+" "+chr(34)+",  1,  1 ) = " + PadStr( 1.1,   " ",  1,  1 ))
        Print("  PadStr( 1.1,   "+chr(34)+" "+chr(34)+",  1,  0 ) = " + PadStr( 1.1,   " ",  1,  0 ))
        Print("  PadStr( 1.1,   "+chr(34)+" "+chr(34)+",  0,  0 ) = " + PadStr( 1.1,   " ",  0,  0 ))
        Print("  PadStr( 1.1,   "+chr(34)+" "+chr(34)+", -3,  0 ) = " + PadStr( 1.1,   " ", -3,  0 ))
        Print("  PadStr( 1.1,   "+chr(34)+" "+chr(34)+",  0, -1 ) = " + PadStr( 1.1,   " ",  0, -1 ))
        Print("")
        Print("  PadStr( 1234.567,   "+chr(34)+" "+chr(34)+", 12, 12 ) = " + PadStr( 1234.567,   " ", 12, 12 ))
        Print("  PadStr( 1234.567, "+chr(34)+"ab "+chr(34)+", 12, 12 ) = " + PadStr( 1234.567, "ab ", 12, 12 ))
        Print("  PadStr( 1234.567,   "+chr(34)+" "+chr(34)+",  3,  3 ) = " + PadStr( 1234.567,   " ",  3,  3 ))
        Print("  PadStr( 1234.567,   "+chr(34)+" "+chr(34)+",  1,  0 ) = " + PadStr( 1234.567,   " ",  1,  0 ))
        Print("  PadStr( 1234.567,   "+chr(34)+" "+chr(34)+",  0,  0 ) = " + PadStr( 1234.567,   " ",  0,  0 ))
        Print("  PadStr( 1234.567,   "+chr(34)+" "+chr(34)+", -3,  0 ) = " + PadStr( 1234.567,   " ", -3,  0 ))
        Print("  PadStr( 1234.567,   "+chr(34)+" "+chr(34)+",  0, -1 ) = " + PadStr( 1234.567,   " ",  0, -1 ))
        Print("")
        Print("  PadStr( 123456,   "+chr(34)+"0"+chr(34)+", 12, 0 ) = " + PadStr( 123456,   "0", 12, 0 ))
        Print("  PadStr( 123456, "+chr(34)+"ab0"+chr(34)+", 12, 0 ) = " + PadStr( 123456, "ab0", 12, 0 ))
        Print("  PadStr( 123456,   "+chr(34)+"0"+chr(34)+",  9, 0 ) = " + PadStr( 123456,   "0",  9, 0 ))
        Print("  PadStr( 123456,   "+chr(34)+"0"+chr(34)+",  6, 0 ) = " + PadStr( 123456,   "0",  6, 0 ))
        Print("  PadStr( 123456,   "+chr(34)+"0"+chr(34)+",  3, 0 ) = " + PadStr( 123456,   "0",  3, 0 ))
        Print("  PadStr( 123456,   "+chr(34)+"0"+chr(34)+",  0, 0 ) = " + PadStr( 123456,   "0",  0, 0 ))
        Print("  PadStr( 123456,   "+chr(34)+"0"+chr(34)+", -3, 0 ) = " + PadStr( 123456,   "0", -3, 0 ))
        Print("")
        Print("  PadStr( 123456, "+chr(34)+" "+chr(34)+", 3, -1 ) = " + PadStr( 123456, " ", 3, -1 ))
        Print("  PadStr( 123456, "+chr(34)+" "+chr(34)+", 4, -1 ) = " + PadStr( 123456, " ", 4, -1 ))
        Print("  PadStr( 123456, "+chr(34)+" "+chr(34)+", 5, -1 ) = " + PadStr( 123456, " ", 5, -1 ))
        Print("  PadStr( 123456, "+chr(34)+" "+chr(34)+", 6, -1 ) = " + PadStr( 123456, " ", 6, -1 ))
        Print("  PadStr( 123456, "+chr(34)+" "+chr(34)+", 7, -1 ) = " + PadStr( 123456, " ", 7, -1 ))
        Print("  PadStr( 123456, "+chr(34)+" "+chr(34)+", 8, -1 ) = " + PadStr( 123456, " ", 8, -1 ))
        Print("  PadStr( 123456, "+chr(34)+" "+chr(34)+", 9, -1 ) = " + PadStr( 123456, " ", 9, -1 ))
        Print("")
        Print("  PadStr( 123.456, "+chr(34)+" "+chr(34)+", 3, -1 ) = " + PadStr( 123.456, " ", 3, -1 ))
        Print("  PadStr( 123.456, "+chr(34)+" "+chr(34)+", 4, -1 ) = " + PadStr( 123.456, " ", 4, -1 ))
        Print("  PadStr( 123.456, "+chr(34)+" "+chr(34)+", 5, -1 ) = " + PadStr( 123.456, " ", 5, -1 ))
        Print("  PadStr( 123.456, "+chr(34)+" "+chr(34)+", 6, -1 ) = " + PadStr( 123.456, " ", 6, -1 ))
        Print("  PadStr( 123.456, "+chr(34)+" "+chr(34)+", 7, -1 ) = " + PadStr( 123.456, " ", 7, -1 ))
        Print("  PadStr( 123.456, "+chr(34)+" "+chr(34)+", 8, -1 ) = " + PadStr( 123.456, " ", 8, -1 ))
        Print("  PadStr( 123.456, "+chr(34)+" "+chr(34)+", 9, -1 ) = " + PadStr( 123.456, " ", 9, -1 ))
        Print("")

    //##################################################################################################################################################################################
    //##################################################################################################################################################################################
    ELSEIF TEST_TypeStr_Which = 1

        Print("--------  Hex2()  ------------------------")
        Print("")
        Print("  Hex2(       0xDD,  8 ) = " + Hex2( 0xDD,  8 ))
        Print("  Hex2(       0xDD,  4 ) = " + Hex2( 0xDD,  4 ))
        Print("  Hex2(       0xDD,  2 ) = " + Hex2( 0xDD,  2 ))
        Print("  Hex2(       0xDD,  0 ) = " + Hex2( 0xDD,  0 ))
        Print("  Hex2(       0xDD, -2 ) = " + Hex2( 0xDD, -2 ))
        Print("")
        Print("  Hex2(     0xCCDD,  8 ) = " + Hex2( 0xCCDD,  8 ))
        Print("  Hex2(     0xCCDD,  4 ) = " + Hex2( 0xCCDD,  4 ))
        Print("  Hex2(     0xCCDD,  2 ) = " + Hex2( 0xCCDD,  2 ))
        Print("  Hex2(     0xCCDD,  0 ) = " + Hex2( 0xCCDD,  0 ))
        Print("  Hex2(     0xCCDD, -2 ) = " + Hex2( 0xCCDD, -2 ))
        Print("")
        Print("  Hex2(   0xBBCCDD,  8 ) = " + Hex2( 0xBBCCDD,  8 ))
        Print("  Hex2(   0xBBCCDD,  4 ) = " + Hex2( 0xBBCCDD,  4 ))
        Print("  Hex2(   0xBBCCDD,  2 ) = " + Hex2( 0xBBCCDD,  2 ))
        Print("  Hex2(   0xBBCCDD,  0 ) = " + Hex2( 0xBBCCDD,  0 ))
        Print("  Hex2(   0xBBCCDD, -2 ) = " + Hex2( 0xBBCCDD, -2 ))
        Print("")
        Print("  Hex2( 0xAABBCCDD,  8 ) = " + Hex2( 0xAABBCCDD,  8 ))
        Print("  Hex2( 0xAABBCCDD,  4 ) = " + Hex2( 0xAABBCCDD,  4 ))
        Print("  Hex2( 0xAABBCCDD,  2 ) = " + Hex2( 0xAABBCCDD,  2 ))
        Print("  Hex2( 0xAABBCCDD,  0 ) = " + Hex2( 0xAABBCCDD,  0 ))
        Print("  Hex2( 0xAABBCCDD, -2 ) = " + Hex2( 0xAABBCCDD, -2 ))


    //##################################################################################################################################################################################
    //##################################################################################################################################################################################
    ELSEIF TEST_TypeStr_Which = 2

        Print("--------  CommaDelimit()  ------------------------")
        Print("")
        Print("  CommaDelimit(         12 ) = "+CommaDelimit(         12 ))
        Print("  CommaDelimit(        123 ) = "+CommaDelimit(        123 ))
        Print("  CommaDelimit(       1234 ) = "+CommaDelimit(       1234 ))
        Print("  CommaDelimit(     123456 ) = "+CommaDelimit(     123456 ))
        Print("  CommaDelimit(  123456789 ) = "+CommaDelimit(  123456789 ))
        Print("")
        Print("  CommaDelimit(        -12 ) = "+CommaDelimit(        -12 ))
        Print("  CommaDelimit(       -123 ) = "+CommaDelimit(       -123 ))
        Print("  CommaDelimit(      -1234 ) = "+CommaDelimit(      -1234 ))
        Print("  CommaDelimit(    -123456 ) = "+CommaDelimit(    -123456 ))
        Print("  CommaDelimit(  -12345678 ) = "+CommaDelimit(  -12345678 ))
        Print("  CommaDelimit( -123456789 ) = "+CommaDelimit( -123456789 ))
        Print("")
        Print("")
        Print("--------  PadCommaDelimit()  ------------------------")
        Print("")
        //Print("                                      210987654321")
        Print("  PadCommaDelimit(         12, 12 ) = "+PadCommaDelimit(         12, 12 ))
        Print("  PadCommaDelimit(        123, 12 ) = "+PadCommaDelimit(        123, 12 ))
        Print("  PadCommaDelimit(       1234, 12 ) = "+PadCommaDelimit(       1234, 12 ))
        Print("  PadCommaDelimit(     123456, 12 ) = "+PadCommaDelimit(     123456, 12 ))
        Print("  PadCommaDelimit(  123456789, 12 ) = "+PadCommaDelimit(  123456789, 12 ))
        Print("")
        Print("  PadCommaDelimit(        -12, 12 ) = "+PadCommaDelimit(        -12, 12 ))
        Print("  PadCommaDelimit(       -123, 12 ) = "+PadCommaDelimit(       -123, 12 ))
        Print("  PadCommaDelimit(      -1234, 12 ) = "+PadCommaDelimit(      -1234, 12 ))
        Print("  PadCommaDelimit(    -123456, 12 ) = "+PadCommaDelimit(    -123456, 12 ))
        Print("  PadCommaDelimit(  -12345678, 12 ) = "+PadCommaDelimit(  -12345678, 12 ))
        Print("  PadCommaDelimit( -123456789, 12 ) = "+PadCommaDelimit( -123456789, 12 ))

    //##################################################################################################################################################################################
    //##################################################################################################################################################################################
    ENDIF
ENDFUNCTION

