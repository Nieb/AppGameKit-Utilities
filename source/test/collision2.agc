
GLOBAL TEST_Col2_Which AS INTEGER = 0
//  0 = Rectangle
//  1 = Circle
//  2 = CircRect
//  3 = Line

GLOBAL TEST_Col2_Mouse1_X AS FLOAT =   0.0
GLOBAL TEST_Col2_Mouse1_Y AS FLOAT =   0.0
GLOBAL TEST_Col2_Mouse2_X AS FLOAT = 640.0
GLOBAL TEST_Col2_Mouse2_Y AS FLOAT = 512.0

FUNCTION TEST_collision2()
    PrintC("collision2.agc    "+str(TEST_Col2_Which)+" ")
    //##################################################################################################################################################################################
    //##################################################################################################################################################################################
    IF     GetRawKeyPressed(KEY_Arrow_Down) : DEC TEST_Col2_Which : IF TEST_Col2_Which < 0 THEN TEST_Col2_Which = 3
    ELSEIF GetRawKeyPressed(KEY_Arrow_Up)   : INC TEST_Col2_Which : IF TEST_Col2_Which > 3 THEN TEST_Col2_Which = 0
    ENDIF

    TEST_Col2_Mouse1_X = GetRawMouseX()
    TEST_Col2_Mouse1_Y = GetRawMouseY()
    IF GetRawMouseRightPressed()
        TEST_Col2_Mouse2_X = GetRawMouseX()
        TEST_Col2_Mouse2_Y = GetRawMouseY()
    ENDIF
    //##################################################################################################################################################################################
    //##################################################################################################################################################################################
    IF TEST_Col2_Which = 0
        Print("(* VS Rectangle)")
        Print("") : Print("")

        Clr_Mouse AS INTEGER : Clr_Mouse = 0xFFAAFFFF
        Clr_Thing AS INTEGER : Clr_Thing = 0xFFFFFFAA

        RectM_Pos_X AS FLOAT : RectM_Pos_X = TEST_Col2_Mouse1_X+100.0
        RectM_Pos_Y AS FLOAT : RectM_Pos_Y = TEST_Col2_Mouse1_Y+100.0
        RectM_Siz_X AS FLOAT = 192.0
        RectM_Siz_Y AS FLOAT = 233.0

        Rect1_Pos_X AS FLOAT = 600.0
        Rect1_Pos_Y AS FLOAT = 450.0
        Rect1_Siz_X AS FLOAT = 200.0
        Rect1_Siz_Y AS FLOAT = 144.0

        DrawEllipse( TEST_Col2_Mouse1_X, TEST_Col2_Mouse1_Y, 3.0, 3.0, Clr_Mouse, Clr_Mouse, 1 )
        Print("    PointvsAAR() = " + str(PointvsAAR( TEST_Col2_Mouse1_X, TEST_Col2_Mouse1_Y,             Rect1_Pos_X, Rect1_Pos_Y, Rect1_Siz_X, Rect1_Siz_Y )) )

        DrawBox(  RectM_Pos_X, RectM_Pos_Y, RectM_Pos_X+RectM_Siz_X, RectM_Pos_Y+RectM_Siz_Y,   Clr_Mouse, Clr_Mouse, Clr_Mouse, Clr_Mouse, 0 )
        DrawBox(  Rect1_Pos_X, Rect1_Pos_Y, Rect1_Pos_X+Rect1_Siz_X, Rect1_Pos_Y+Rect1_Siz_Y,   Clr_Thing, Clr_Thing, Clr_Thing, Clr_Thing, 0 )
        Print("      AARvsAAR() = " + str(  AARvsAAR( RectM_Pos_X, RectM_Pos_Y, RectM_Siz_X, RectM_Siz_Y, Rect1_Pos_X, Rect1_Pos_Y, Rect1_Siz_X, Rect1_Siz_Y )) )

    //##################################################################################################################################################################################
    //##################################################################################################################################################################################
    ELSEIF TEST_Col2_Which = 1
        Print("(* VS Circle)")
        Print("") : Print("")

    //##################################################################################################################################################################################
    //##################################################################################################################################################################################
    ELSEIF TEST_Col2_Which = 2
        Print("(Circle VS Rectangle)")
        Print("") : Print("")

    //##################################################################################################################################################################################
    //##################################################################################################################################################################################
    ELSEIF TEST_Col2_Which = 3
        Print("(Line VS *)")
        Print("") : Print("")

    //##################################################################################################################################################################################
    //##################################################################################################################################################################################
    ENDIF
ENDFUNCTION

