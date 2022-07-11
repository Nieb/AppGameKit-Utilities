
GLOBAL TEST_Col2_Which AS INTEGER = 0
//  0 = Rectangle
//  1 = Circle
//  2 = CircRect
//  3 = Line

GLOBAL TEST_Col2_Mouse2_X AS FLOAT = 640.0
GLOBAL TEST_Col2_Mouse2_Y AS FLOAT = 512.0

FUNCTION TEST_collision2()
    PrintC("collision2.agc    page:"+str(TEST_Col2_Which)+" ")
    //##################################################################################################################################################################################
    //##################################################################################################################################################################################
    IF     GetRawKeyPressed(KEY_Arrow_Down) : DEC TEST_Col2_Which : IF TEST_Col2_Which < 0 THEN TEST_Col2_Which = 3
    ELSEIF GetRawKeyPressed(KEY_Arrow_Up)   : INC TEST_Col2_Which : IF TEST_Col2_Which > 3 THEN TEST_Col2_Which = 0
    ENDIF

    MousePos1 AS Vec2
    MousePos1.x = GetRawMouseX()
    MousePos1.y = GetRawMouseY()
    IF GetRawMouseRightPressed()
        TEST_Col2_Mouse2_X = GetRawMouseX()
        TEST_Col2_Mouse2_Y = GetRawMouseY()
    ENDIF
    //##################################################################################################################################################################################
    //##################################################################################################################################################################################
    IF TEST_Col2_Which = 0
        Print("* VS Rectangle")
        Print("")
        Print("")

        Clr_Mouse AS INTEGER : Clr_Mouse = 0xFFAAFFFF
        Clr_Thing AS INTEGER : Clr_Thing = 0xFFFFFFAA

        RectM_Pos AS Vec2
        RectM_Pos.x = 100.0+MousePos1.x
        RectM_Pos.y = 100.0+MousePos1.y
        RectM_Siz AS Vec2
        RectM_Siz.x = 192.0
        RectM_Siz.y = 233.0

        Rect1_Pos AS Vec2
        Rect1_Pos.x = 600.0
        Rect1_Pos.y = 450.0
        Rect1_Siz AS Vec2
        Rect1_Siz.x = 200.0
        Rect1_Siz.y = 144.0

        DrawEllipse( MousePos1.x, MousePos1.y, 3.0, 3.0, Clr_Mouse, Clr_Mouse, 1 )
        Print("    PointvsAAR() = " + str(PointvsAAR( MousePos1,             Rect1_Pos, Rect1_Siz )) )

        DrawBox(  RectM_Pos.x, RectM_Pos.y, RectM_Pos.x+RectM_Siz.x, RectM_Pos.y+RectM_Siz.y,   Clr_Mouse, Clr_Mouse, Clr_Mouse, Clr_Mouse, 0 )
        DrawBox(  Rect1_Pos.x, Rect1_Pos.y, Rect1_Pos.x+Rect1_Siz.x, Rect1_Pos.y+Rect1_Siz.y,   Clr_Thing, Clr_Thing, Clr_Thing, Clr_Thing, 0 )
        Print("      AARvsAAR() = " + str(  AARvsAAR( RectM_Pos, RectM_Siz, Rect1_Pos, Rect1_Siz )) )

    //##################################################################################################################################################################################
    //##################################################################################################################################################################################
    ELSEIF TEST_Col2_Which = 1
        Print("* VS Circle")
        Print("") : Print("")

    //##################################################################################################################################################################################
    //##################################################################################################################################################################################
    ELSEIF TEST_Col2_Which = 2
        Print("Circle VS Rectangle")
        Print("") : Print("")

    //##################################################################################################################################################################################
    //##################################################################################################################################################################################
    ELSEIF TEST_Col2_Which = 3
        Print("Line VS *")
        Print("") : Print("")

    //##################################################################################################################################################################################
    //##################################################################################################################################################################################
    ENDIF
ENDFUNCTION

