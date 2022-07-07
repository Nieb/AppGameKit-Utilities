

FUNCTION TEST_collision1()
    Print("collision1.agc")
    Print("")

    Clr_Mouse AS INTEGER : Clr_Mouse = 0xFFAAFFFF
    Clr_Thing AS INTEGER : Clr_Thing = 0xFFFFFFAA

    Mouse_PosX AS FLOAT : Mouse_PosX = GetRawMouseX()

    RangeM_Pos AS FLOAT : RangeM_Pos = 300.0 + Mouse_PosX
    RangeM_Len AS FLOAT : RangeM_Len = 150.0

    Range1_Pos AS FLOAT : Range1_Pos = 600.0
    Range1_Len AS FLOAT : Range1_Len = 250.0


    DrawLine(    Mouse_PosX, 195.0,               Mouse_PosX, 205.0,    Clr_Mouse,Clr_Mouse ) // Mouse Point

    DrawLine(    RangeM_Pos, 201.0,    RangeM_Pos+RangeM_Len, 201.0,    Clr_Mouse,Clr_Mouse ) // Mouse Range
    DrawLine(    Range1_Pos, 200.0,    Range1_Pos+Range1_Len, 200.0,    Clr_Thing,Clr_Thing ) // Range


    Print("  PointvsRange() = " + str(PointvsRange( Mouse_PosX-1.0,              Range1_Pos, Range1_Len )) )
    Print("  RangevsRange() = " + str(RangevsRange( RangeM_Pos, RangeM_Len,   Range1_Pos, Range1_Len )) )


ENDFUNCTION

