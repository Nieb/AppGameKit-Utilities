
GLOBAL Thedar AS INTEGER = 0


FUNCTION TEST_type_vector3()
    //#########################################################################################################################################
    Print("vector3.agc")
    Print("")

    //#########################################################################################################################################
    Print3("    PitchYawToVec3( 0, 0) = ", PitchYawToVec3( 0, 0),2,7)
    Print3("    PitchYawToVec3(90, 0) = ", PitchYawToVec3(90, 0),2,7)
    Print3("    PitchYawToVec3( 0,90) = ", PitchYawToVec3( 0,90),2,7)
    Print("")

    //#########################################################################################################################################
    Print("")
    Print("    Plane spans YZ.")
    Print3("        AngleToVec3_OnPlnX(  0) = ", AngleToVec3_OnPlnX(  0),2,7)
    Print3("        AngleToVec3_OnPlnX( 90) = ", AngleToVec3_OnPlnX( 90),2,7)
    Print3("        AngleToVec3_OnPlnX(180) = ", AngleToVec3_OnPlnX(180),2,7)
    Print3("        AngleToVec3_OnPlnX(270) = ", AngleToVec3_OnPlnX(270),2,7)
    Print("")
    Print("    Plane spans XZ.")
    Print3("        AngleToVec3_OnPlnY(  0) = ", AngleToVec3_OnPlnY(  0),2,7)
    Print3("        AngleToVec3_OnPlnY( 90) = ", AngleToVec3_OnPlnY( 90),2,7)
    Print3("        AngleToVec3_OnPlnY(180) = ", AngleToVec3_OnPlnY(180),2,7)
    Print3("        AngleToVec3_OnPlnY(270) = ", AngleToVec3_OnPlnY(270),2,7)
    Print("")
    Print("    Plane spans XY.")
    Print3("        AngleToVec3_OnPlnZ(  0) = ", AngleToVec3_OnPlnZ(  0),2,7)
    Print3("        AngleToVec3_OnPlnZ( 90) = ", AngleToVec3_OnPlnZ( 90),2,7)
    Print3("        AngleToVec3_OnPlnZ(180) = ", AngleToVec3_OnPlnZ(180),2,7)
    Print3("        AngleToVec3_OnPlnZ(270) = ", AngleToVec3_OnPlnZ(270),2,7)
    Print("")


    IF 0
        ClrABGR AS INTEGER : ClrABGR = 0xFF00DD44

        ClrRed AS INTEGER : ClrRed = 0xFF0000FF
        ClrYlw AS INTEGER : ClrYlw = 0xFF00FFFF
        ClrGrn AS INTEGER : ClrGrn = 0xFF00FF00
        ClrCyn AS INTEGER : ClrCyn = 0xFFFFFF00
        ClrBlu AS INTEGER : ClrBlu = 0xFFFF0000
        ClrVlt AS INTEGER : ClrVlt = 0xFFFF00FF

        INC Thedar : IF Thedar >= 360 THEN Thedar = 0

        DrawEdge(vec3(0,0,0), AngleToVec3_OnPlnX(Thedar    ), ClrRed)
        DrawEdge(vec3(0,0,0), AngleToVec3_OnPlnX(Thedar+180), ClrRed)
        DrawEdge(vec3(0,0,0), AngleToVec3_OnPlnY(Thedar    ), ClrGrn)
        DrawEdge(vec3(0,0,0), AngleToVec3_OnPlnY(Thedar+180), ClrGrn)
        DrawEdge(vec3(0,0,0), AngleToVec3_OnPlnZ(Thedar    ), ClrBlu)
        DrawEdge(vec3(0,0,0), AngleToVec3_OnPlnZ(Thedar+180), ClrBlu)

        DrawVert(vec3(0,0,0),1.333,0xFFFFFFFF)
        DrawVert(AngleToVec3_OnPlnX(Thedar    ),1.0,ClrRed)
        DrawVert(AngleToVec3_OnPlnX(Thedar+180),1.0,ClrYlw)
        DrawVert(AngleToVec3_OnPlnY(Thedar    ),1.0,ClrGrn)
        DrawVert(AngleToVec3_OnPlnY(Thedar+180),1.0,ClrCyn)
        DrawVert(AngleToVec3_OnPlnZ(Thedar    ),1.0,ClrBlu)
        DrawVert(AngleToVec3_OnPlnZ(Thedar+180),1.0,ClrVlt)
    ENDIF
    //#########################################################################################################################################
ENDFUNCTION

