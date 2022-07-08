
GLOBAL TEST_ClrGamma_Which AS INTEGER = 0

FUNCTION TEST_ColorGamma()
    //==================================================================================================================
    Print("color_gamma.agc")

    //==================================================================================================================
    IF     GetRawKeyPressed(KEY_Arrow_Down) : DEC TEST_ClrGamma_Which : IF TEST_ClrGamma_Which < 0 THEN TEST_ClrGamma_Which = 3
    ELSEIF GetRawKeyPressed(KEY_Arrow_Up)   : INC TEST_ClrGamma_Which : IF TEST_ClrGamma_Which > 3 THEN TEST_ClrGamma_Which = 0
    ENDIF

    IF     TEST_ClrGamma_Which = 0 : Print("               "+str(TEST_ClrGamma_Which)+": sRGB")                 : SetPrintColor(255,  64,  64)
    ELSEIF TEST_ClrGamma_Which = 1 : Print("               "+str(TEST_ClrGamma_Which)+": sRGB_To_Linear(sRGB)") : SetPrintColor( 64, 255,  64)
    ELSEIF TEST_ClrGamma_Which = 2 : Print("               "+str(TEST_ClrGamma_Which)+": Linear_To_sRGB(sRGB)") : SetPrintColor(  0,  32, 192)
    ELSEIF TEST_ClrGamma_Which = 3 : Print("               "+str(TEST_ClrGamma_Which)+": Mix")                  : SetPrintColor(192, 128, 192)
    ENDIF

    //==================================================================================================================
    ScrnY__0_3 AS INTEGER : ScrnY__0_3 = 0.0
    ScrnY__1_3 AS INTEGER : ScrnY__1_3 = GetScreenBoundsBottom() / 3.0
    ScrnY__2_3 AS INTEGER : ScrnY__2_3 = GetScreenBoundsBottom() / 3.0 * 2.0
    ScrnY__3_3 AS INTEGER : ScrnY__3_3 = GetScreenBoundsBottom()

    //==================================================================================================================
    iX AS INTEGER

    sRGB   AS FLOAT
    InputWhy AS FLOAT
    ColorInp AS INTEGER

    GamToLin AS FLOAT
    ToLinWhy AS FLOAT
    ColorLin AS INTEGER

    LinToGam AS FLOAT
    ToGamWhy AS FLOAT
    ColorGam AS INTEGER

    FOR iX = GetScreenBoundsLeft() TO GetScreenBoundsRight()
        sRGB     = iX/GetScreenBoundsRight()
        InputWhy = GetScreenBoundsBottom()-sRGB*GetScreenBoundsBottom()
        ColorInp = round(sRGB * 255.0)
        ColorInp = 0xFF000000 + (ColorInp << 16) + (ColorInp << 8) + ColorInp

        GamToLin = sRGB_To_Linear(sRGB)
        ToLinWhy = GetScreenBoundsBottom()-GamToLin*GetScreenBoundsBottom()
        ColorLin = round(GamToLin * 255.0)
        ColorLin = 0xFF000000 + (ColorLin << 16) + (ColorLin << 8) + ColorLin

        LinToGam = Linear_To_sRGB(sRGB)
        ToGamWhy = GetScreenBoundsBottom()-LinToGam*GetScreenBoundsBottom()
        ColorGam = round(LinToGam * 255.0)
        ColorGam = 0xFF000000 + (ColorGam << 16) + (ColorGam << 8) + ColorGam

        // Draw Gradients:
        IF     TEST_ClrGamma_Which = 0 : DrawLine(iX, ScrnY__0_3, iX, ScrnY__3_3, ColorInp, ColorInp)
        ELSEIF TEST_ClrGamma_Which = 1 : DrawLine(iX, ScrnY__0_3, iX, ScrnY__3_3, ColorLin, ColorLin)
        ELSEIF TEST_ClrGamma_Which = 2 : DrawLine(iX, ScrnY__0_3, iX, ScrnY__3_3, ColorGam, ColorGam)
        ELSEIF TEST_ClrGamma_Which = 3
            DrawLine(iX, ScrnY__0_3, iX, ScrnY__1_3, ColorInp, ColorInp)
            DrawLine(iX, ScrnY__1_3, iX, ScrnY__2_3, ColorLin, ColorLin)
            DrawLine(iX, ScrnY__2_3, iX, ScrnY__3_3, ColorGam, ColorGam)
        ENDIF

        // Draw Graphs:
        DrawLine(iX, ToGamWhy, iX, ToGamWhy, 0xFFFF0000, 0xFFFF0000)
        DrawLine(iX, ToLinWhy, iX, ToLinWhy, 0xFF00FF00, 0xFF00FF00)
        DrawLine(iX, InputWhy, iX, InputWhy, 0xFF0000FF, 0xFF0000FF)
    NEXT iX
ENDFUNCTION

