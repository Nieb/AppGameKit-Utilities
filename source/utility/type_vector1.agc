///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION avg1_2(FltA AS FLOAT, FltB AS FLOAT) // Average of 2 Vectors
ENDFUNCTION (FltA + FltB) * 0.5


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION avg1_3(FltA AS FLOAT, FltB AS FLOAT, FltC AS FLOAT) // Average of 3 Vectors
ENDFUNCTION (FltA + FltB + FltC) * OneThird


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION avg1_4(FltA AS FLOAT, FltB AS FLOAT, FltC AS FLOAT, FltD AS FLOAT) // Average of 4 Vectors
ENDFUNCTION (FltA + FltB + FltC + FltD) * 0.25


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION ByteToUnit(Byte AS INTEGER)
    Unit AS FLOAT : Unit = Byte * 0.00392156862745098039215686274509803921568627450980

    //IF     Flt >= 255.0 : Flt = 1.0
    //ELSEIF Flt <=   0.0 : Flt = 0.0
    //ELSE                : Flt =
    //ENDIF
ENDFUNCTION Unit
//#Constant ByteUnitBit = 0.00392156862745098039215686274509803921568627450980

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION UnitToByte(Unit AS FLOAT)
    Byte AS INTEGER : Byte = round(Unit * 255.0)
ENDFUNCTION Byte
