
GLOBAL Thedar AS INTEGER = 0




FUNCTION TEST_type_vector3()
    Print("vector3.agc")
    Print("")


    ClrABGR AS INTEGER : ClrABGR = 0xFF00DD44

    ClrRed AS INTEGER : ClrRed = 0xFF0000FF
    ClrYlw AS INTEGER : ClrYlw = 0xFF00FFFF
    ClrGrn AS INTEGER : ClrGrn = 0xFF00FF00
    ClrCyn AS INTEGER : ClrCyn = 0xFFFFFF00
    ClrBlu AS INTEGER : ClrBlu = 0xFFFF0000
    ClrVlt AS INTEGER : ClrVlt = 0xFFFF00FF


        INC Thedar : IF Thedar >= 360 THEN Thedar = 0

        DrawEdge(vec3(0,0,0), AngleToVec3( Thedar    , 0 ), ClrRed)
        DrawEdge(vec3(0,0,0), AngleToVec3( Thedar+180, 0 ), ClrRed)
        DrawEdge(vec3(0,0,0), AngleToVec3( Thedar    , 1 ), ClrGrn)
        DrawEdge(vec3(0,0,0), AngleToVec3( Thedar+180, 1 ), ClrGrn)
        DrawEdge(vec3(0,0,0), AngleToVec3( Thedar    , 2 ), ClrBlu)
        DrawEdge(vec3(0,0,0), AngleToVec3( Thedar+180, 2 ), ClrBlu)

        DrawVert(vec3(0,0,0),1.333,0xFFFFFFFF)
        DrawVert(AngleToVec3( Thedar,     0 ),1.333,ClrRed)
        DrawVert(AngleToVec3( Thedar+180, 0 ),1.333,ClrYlw)
        DrawVert(AngleToVec3( Thedar,     1 ),1.333,ClrGrn)
        DrawVert(AngleToVec3( Thedar+180, 1 ),1.333,ClrCyn)
        DrawVert(AngleToVec3( Thedar,     2 ),1.333,ClrBlu)
        DrawVert(AngleToVec3( Thedar+180, 2 ),1.333,ClrVlt)


ENDFUNCTION

