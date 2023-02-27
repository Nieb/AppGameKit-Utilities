///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#Option_Explicit
SetErrorMode(2)
SetFolder("")

SetWindowTitle("Utility Build Test")
SetWindowAllowResize(0)

       SetWindowSize(1024, 768, 0)
SetVirtualResolution(1024, 768)

SetClearColor(74,50,75)

LoadFont(1, "media/ui/font/Hack-Regular.ttf")
SetPrintFont(1)
SetPrintSize(24)
SetPrintColor(240, 240, 240)

//  Garbage in, garbage out.
//      There are typically no safety or validity checks.
//      Use this library at your own peril.


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//InitializeColor()
InitializeFloat()
InitializeVector2()
InitializeVector3()

InitializeCollision3()

InitializePrintA() : SetPrintAFont(1)


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
DO
    IF GetRawKeyPressed(KEY_Escape) THEN END

    Print("")
    Print("")
    Print("        FPS: "+str(ScreenFPS(),0))
    Print("")
    Print("")
    Print("            It works!")
    Print("")
    Print("")

    //Print(GetRawLastKey())

    //print(INT_Max)
    //print(INT_Min)
    //print(FLT_NaN    )
    //print(FLT_Inf    )
    //print(FLT_InfNeg )
    //print(FLT_ZeroNeg)

    Clr AS INTEGER : Clr = 0xFF000000
    Millis AS INTEGER : Millis = GetMilliseconds()
    Clr = Clr + (round( (sin(Millis*1.6) * 0.5 + 0.5) * 255 )<<16)
    Clr = Clr + (round( (sin(Millis*0.7) * 0.5 + 0.5) * 255 )<< 8)
    Clr = Clr +  round( (sin(Millis*1.0) * 0.5 + 0.5) * 255 )
    PrintA("BLARG!", 0, cos(Millis*0.1)*250+512, sin(Millis*0.2)*250+384, 32, Clr)

    DrawPrintA()
    Sync()
LOOP
END


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#Include "source/utility/AGK_const.agc"
#Include "source/utility/AGK_imgui.agc"
#Include "source/utility/AGK_print_anywhere.agc"
#Include "source/utility/camera.agc"
#Include "source/utility/camera_firstperson.agc"
#Include "source/utility/camera_pivot.agc"
#Include "source/utility/canvas.agc"
#Include "source/utility/collision1.agc"
#Include "source/utility/collision2.agc"
#Include "source/utility/collision3.agc"
#Include "source/utility/color.agc"
#Include "source/utility/data.agc"
#Include "source/utility/draw2.agc"
#Include "source/utility/draw3.agc"
#Include "source/utility/input_const.agc"
#Include "source/utility/input_mouse.agc"
#Include "source/utility/interpolation.agc"
#Include "source/utility/math.agc"
#Include "source/utility/math_const.agc"
#Include "source/utility/shader.agc"
#Include "source/utility/signeddistance2.agc"
#Include "source/utility/signeddistance3.agc"
#Include "source/utility/time.agc"
#Include "source/utility/type_array.agc"
#Include "source/utility/type_color.agc"
#Include "source/utility/type_fixed.agc"
#Include "source/utility/type_float.agc"
#Include "source/utility/type_integer.agc"
#Include "source/utility/type_ray.agc"
#Include "source/utility/type_string.agc"
#Include "source/utility/type_vector2.agc"
#Include "source/utility/type_vector3.agc"
#Include "source/utility/type_vector4.agc"
#Include "source/utility/type_vector_const.agc"

