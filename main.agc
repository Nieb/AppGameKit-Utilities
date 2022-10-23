///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#Option_Explicit
SetErrorMode(2)
SetFolder("")

SetWindowTitle("Framework Libraries Build Test")
SetWindowAllowResize(0)

       SetWindowSize(1536, 1280, 0)
SetVirtualResolution(1536, 1280)

SetClearColor(74,50,75)

LoadFont(1, "media/ui/font/Hack-Regular.ttf")
SetPrintFont(1)
SetPrintSize(24)

//  Garbage in, garbage out.
//      There are no safety checks and no validity checks.
//      Use this library at your own peril.

//  Name?
//      Module
//      Library
//      Utility
//      Framework
//      ...


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
InitializeColor()
InitializeVector2()
InitializeVector3()

CurrentTest AS INTEGER = 0


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
DO
    IF GetRawKeyPressed(KEY_Escape) THEN END
    SetPrintColor(240, 240, 240)

    Print( "          FPS: "+str(ScreenFPS(),0))
    PrintC("  CurrentTest: "+str(CurrentTest)+": ")

    IF     GetRawKeyPressed(KEY_PageDown) : DEC CurrentTest : IF CurrentTest <  0 THEN CurrentTest = 23
    ELSEIF GetRawKeyPressed(KEY_PageUp)   : INC CurrentTest : IF CurrentTest > 23 THEN CurrentTest =  0
    ENDIF

    IF     CurrentTest =  0 : TEST_Collision1()
    ELSEIF CurrentTest =  1 : TEST_Collision2()
    ELSEIF CurrentTest =  2 : TEST_Collision3()
    ELSEIF CurrentTest =  3 : TEST_ColorGamma()
    ELSEIF CurrentTest =  4 : TEST_Data()
    ELSEIF CurrentTest =  5 : TEST_Draw2()
    ELSEIF CurrentTest =  6 : TEST_Draw3()
    ELSEIF CurrentTest =  7 : TEST_Input_Const()
    ELSEIF CurrentTest =  8 : TEST_Input_Mouse()
    ELSEIF CurrentTest =  9 : TEST_Interpolation()
    ELSEIF CurrentTest = 10 : TEST_Math()
    ELSEIF CurrentTest = 11 : TEST_Shader()
    ELSEIF CurrentTest = 12 : TEST_Signeddistance()
    ELSEIF CurrentTest = 13 : TEST_Time()
    ELSEIF CurrentTest = 14 : TEST_Type_Array()
    ELSEIF CurrentTest = 15 : TEST_Type_Color()
    ELSEIF CurrentTest = 16 : TEST_Type_Float()
    ELSEIF CurrentTest = 17 : TEST_Type_Integer()
    ELSEIF CurrentTest = 18 : TEST_Type_Ray()
    ELSEIF CurrentTest = 19 : TEST_Type_String()
    ELSEIF CurrentTest = 20 : TEST_Type_Vector1()
    ELSEIF CurrentTest = 21 : TEST_Type_Vector2()
    ELSEIF CurrentTest = 22 : TEST_Type_Vector3()
    ELSEIF CurrentTest = 23 : TEST_Type_Vector4()
    ELSE                    : Print("-----")
    ENDIF

    Sync()
LOOP
END


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#Include "source/framework/AGK_const.agc"         : #Include "source/test/AGK_const.agc"
#Include "source/framework/collision1.agc"        : #Include "source/test/collision1.agc"
#Include "source/framework/collision2.agc"        : #Include "source/test/collision2.agc"
#Include "source/framework/collision3.agc"        : #Include "source/test/collision3.agc"
#Include "source/framework/color_gamma.agc"       : #Include "source/test/color_gamma.agc"
#Include "source/framework/data.agc"              : #Include "source/test/data.agc"
#Include "source/framework/draw2.agc"             : #Include "source/test/draw2.agc"
#Include "source/framework/draw3.agc"             : #Include "source/test/draw3.agc"
#Include "source/framework/input_const.agc"       : #Include "source/test/input_const.agc"
#Include "source/framework/input_mouse.agc"       : #Include "source/test/input_mouse.agc"
#Include "source/framework/interpolation.agc"     : #Include "source/test/interpolation.agc"
#Include "source/framework/math.agc"              : #Include "source/test/math.agc"
#Include "source/framework/math_const.agc"        : #Include "source/test/math_const.agc"
#Include "source/framework/shader.agc"            : #Include "source/test/shader.agc"
#Include "source/framework/signeddistance.agc"    : #Include "source/test/signeddistance.agc"
#Include "source/framework/time.agc"              : #Include "source/test/time.agc"
#Include "source/framework/type_array.agc"        : #Include "source/test/type_array.agc"
#Include "source/framework/type_color.agc"        : #Include "source/test/type_color.agc"
#Include "source/framework/type_float.agc"        : #Include "source/test/type_float.agc"
#Include "source/framework/type_integer.agc"      : #Include "source/test/type_integer.agc"
#Include "source/framework/type_ray.agc"          : #Include "source/test/type_ray.agc"
#Include "source/framework/type_string.agc"       : #Include "source/test/type_string.agc"
#Include "source/framework/type_vector1.agc"      : #Include "source/test/type_vector1.agc"
#Include "source/framework/type_vector2.agc"      : #Include "source/test/type_vector2.agc"
#Include "source/framework/type_vector3.agc"      : #Include "source/test/type_vector3.agc"
#Include "source/framework/type_vector4.agc"      : #Include "source/test/type_vector4.agc"
#Include "source/framework/type_vector_const.agc"

