///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawVert(Vrt REF AS Vec3, Siz AS FLOAT, ClrABGR AS INTEGER)
    DrawEllipse( GetScreenXFrom3D(Vrt.x,Vrt.y,-Vrt.z), GetScreenYFrom3D(Vrt.x,Vrt.y,-Vrt.z), Siz,Siz, ClrABGR,ClrABGR, 1 )
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawVertC(Vrt REF AS Vec3, Siz AS FLOAT, Clr REF AS RGBA)
    ClrABGR AS INTEGER : ClrABGR = (Clr.a << 24) + (Clr.b << 16) + (Clr.g <<  8) + Clr.r
    DrawEllipse( GetScreenXFrom3D(Vrt.x,Vrt.y,-Vrt.z), GetScreenYFrom3D(Vrt.x,Vrt.y,-Vrt.z), Siz,Siz, ClrABGR,ClrABGR, 1 )
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawVertZ(Vrt    AS Vec3, Siz    AS FLOAT, ClrABGR AS INTEGER,
                   CamPos AS Vec3, CamLok AS Vec3 )

    //  Push CamPos slightly forward:
    CamPos = add3(vec3(GetCameraX(1), GetCameraY(1), -GetCameraZ(1)), mul3f(CamLok, 0.0625+0.001)) // (CamNearDist + Offset)     @@ Compute all of this once then pass to function.

    //  Prevent GetScreenPosFrom3D() from barfing because of positions behind Camera_NearPlane:
    IF dot3(CamLok, sub3(Vrt, CamPos)) <= 0.0 THEN EXITFUNCTION // Is Vertex behind Camera?

    DrawEllipse( GetScreenXFrom3D(Vrt.x,Vrt.y,-Vrt.z), GetScreenYFrom3D(Vrt.x,Vrt.y,-Vrt.z), Siz,Siz, ClrABGR,ClrABGR, 1 )
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawEdge(EdgA AS Vec3, EdgB AS Vec3, ClrABGR AS INTEGER)
    DrawLine( GetScreenXFrom3D(EdgA.x,EdgA.y,-EdgA.z),GetScreenYFrom3D(EdgA.x,EdgA.y,-EdgA.z),  GetScreenXFrom3D(EdgB.x,EdgB.y,-EdgB.z),GetScreenYFrom3D(EdgB.x,EdgB.y,-EdgB.z),  ClrABGR,ClrABGR )
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawEdgeC(EdgA REF AS Vec3, EdgB REF AS Vec3, Clr REF AS RGBA)
    ClrABGR AS INTEGER : ClrABGR = (Clr.a << 24) + (Clr.b << 16) + (Clr.g <<  8) + Clr.r
    DrawLine( GetScreenXFrom3D(EdgA.x,EdgA.y,-EdgA.z),GetScreenYFrom3D(EdgA.x,EdgA.y,-EdgA.z),  GetScreenXFrom3D(EdgB.x,EdgB.y,-EdgB.z),GetScreenYFrom3D(EdgB.x,EdgB.y,-EdgB.z),  ClrABGR,ClrABGR )
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawEdgeZ(EdgA   AS Vec3, EdgB   AS Vec3, ClrABGR AS INTEGER,
                   CamPos AS Vec3, CamLok AS Vec3 )
    //  Push CamPos slightly forward:
    CamPos = add3(vec3(GetCameraX(1),GetCameraY(1),-GetCameraZ(1)), mul3f(CamLok, 0.0625+0.001)) // (CamNearDist + Offset)     @@ Compute all of this once then pass to function.

    VertA_IsBehindCamera AS INTEGER = 0
    VertB_IsBehindCamera AS INTEGER = 0
    IF dot3(CamLok, sub3(EdgA, CamPos)) <= 0.0 THEN VertA_IsBehindCamera = 1
    IF dot3(CamLok, sub3(EdgB, CamPos)) <= 0.0 THEN VertB_IsBehindCamera = 1

    IF     VertA_IsBehindCamera AND VertB_IsBehindCamera : EXITFUNCTION
    ELSEIF VertA_IsBehindCamera                          : EdgA = IRayVsIPlane( EdgA, nrm3(sub3(EdgB,EdgA)), CamPos, CamLok )
    ELSEIF VertB_IsBehindCamera                          : EdgB = IRayVsIPlane( EdgB, nrm3(sub3(EdgA,EdgB)), CamPos, CamLok )
    ENDIF

    DrawLine( GetScreenXFrom3D(EdgA.x,EdgA.y,-EdgA.z),GetScreenYFrom3D(EdgA.x,EdgA.y,-EdgA.z),  GetScreenXFrom3D(EdgB.x,EdgB.y,-EdgB.z),GetScreenYFrom3D(EdgB.x,EdgB.y,-EdgB.z),  ClrABGR,ClrABGR )
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//FUNCTION DrawCircle(Cir_Pos REF AS Vec3, Cir_Rot REF AS Vec3    CirPch AS FLOAT, CirYaw AS FLOAT,    , Cir_Rds AS FLOAT, Segments AS INTEGER, Clr REF AS RGBA)

//@@  Todo.
//      Produce draw-points, then rotate them.    Cache them?
//FUNCTION CreateWireMesh()
//ENDFUNCTION
//FUNCTION DrawWireMesh()
//ENDFUNCTION


//    ClrABGR AS INTEGER : ClrABGR = (Clr.a << 24) + (Clr.b << 16) + (Clr.g <<  8) + Clr.r
//    aX AS FLOAT : aX = Cir_Rds
//    aZ AS FLOAT : aZ = 0.0
//    bX AS FLOAT
//    bZ AS FLOAT
//    IF Segments > 1
//        StepSize AS FLOAT : StepSize = PiH / Segments
//        iSeg AS INTEGER
//        FOR iSeg = 1 TO Segments-1 // xpos = x-Cir_Rds TO xpos <= x+Cir_Rds STEP 0.1
//            bX = cosrad(StepSize * iSeg)*Cir_Rds
//            bZ = sinrad(StepSize * iSeg)*Cir_Rds
//            DrawLine(GetScreenXFrom3D(Cir_Pos.x+aX,Cir_Pos.y,-Cir_Pos.z-aZ), GetScreenYFrom3D(Cir_Pos.x+aX,Cir_Pos.y,-Cir_Pos.z-aZ), GetScreenXFrom3D(Cir_Pos.x+bX,Cir_Pos.y,-Cir_Pos.z-bZ), GetScreenYFrom3D(Cir_Pos.x+bX,Cir_Pos.y,-Cir_Pos.z-bZ), ClrABGR,ClrABGR)
//            DrawLine(GetScreenXFrom3D(Cir_Pos.x-aX,Cir_Pos.y,-Cir_Pos.z-aZ), GetScreenYFrom3D(Cir_Pos.x-aX,Cir_Pos.y,-Cir_Pos.z-aZ), GetScreenXFrom3D(Cir_Pos.x-bX,Cir_Pos.y,-Cir_Pos.z-bZ), GetScreenYFrom3D(Cir_Pos.x-bX,Cir_Pos.y,-Cir_Pos.z-bZ), ClrABGR,ClrABGR)
//            DrawLine(GetScreenXFrom3D(Cir_Pos.x-aX,Cir_Pos.y,-Cir_Pos.z+aZ), GetScreenYFrom3D(Cir_Pos.x-aX,Cir_Pos.y,-Cir_Pos.z+aZ), GetScreenXFrom3D(Cir_Pos.x-bX,Cir_Pos.y,-Cir_Pos.z+bZ), GetScreenYFrom3D(Cir_Pos.x-bX,Cir_Pos.y,-Cir_Pos.z+bZ), ClrABGR,ClrABGR)
//            DrawLine(GetScreenXFrom3D(Cir_Pos.x+aX,Cir_Pos.y,-Cir_Pos.z+aZ), GetScreenYFrom3D(Cir_Pos.x+aX,Cir_Pos.y,-Cir_Pos.z+aZ), GetScreenXFrom3D(Cir_Pos.x+bX,Cir_Pos.y,-Cir_Pos.z+bZ), GetScreenYFrom3D(Cir_Pos.x+bX,Cir_Pos.y,-Cir_Pos.z+bZ), ClrABGR,ClrABGR)
//            aX = bX
//            aZ = bZ
//        NEXT iSeg
//    ENDIF
//    bX = 0.0
//    bZ = Cir_Rds
//    DrawLine(GetScreenXFrom3D(Cir_Pos.x+aX,Cir_Pos.y,-Cir_Pos.z-aZ), GetScreenYFrom3D(Cir_Pos.x+aX,Cir_Pos.y,-Cir_Pos.z-aZ), GetScreenXFrom3D(Cir_Pos.x+bX,Cir_Pos.y,-Cir_Pos.z-bZ), GetScreenYFrom3D(Cir_Pos.x+bX,Cir_Pos.y,-Cir_Pos.z-bZ), ClrABGR,ClrABGR)
//    DrawLine(GetScreenXFrom3D(Cir_Pos.x-aX,Cir_Pos.y,-Cir_Pos.z-aZ), GetScreenYFrom3D(Cir_Pos.x-aX,Cir_Pos.y,-Cir_Pos.z-aZ), GetScreenXFrom3D(Cir_Pos.x-bX,Cir_Pos.y,-Cir_Pos.z-bZ), GetScreenYFrom3D(Cir_Pos.x-bX,Cir_Pos.y,-Cir_Pos.z-bZ), ClrABGR,ClrABGR)
//    DrawLine(GetScreenXFrom3D(Cir_Pos.x-aX,Cir_Pos.y,-Cir_Pos.z+aZ), GetScreenYFrom3D(Cir_Pos.x-aX,Cir_Pos.y,-Cir_Pos.z+aZ), GetScreenXFrom3D(Cir_Pos.x-bX,Cir_Pos.y,-Cir_Pos.z+bZ), GetScreenYFrom3D(Cir_Pos.x-bX,Cir_Pos.y,-Cir_Pos.z+bZ), ClrABGR,ClrABGR)
//    DrawLine(GetScreenXFrom3D(Cir_Pos.x+aX,Cir_Pos.y,-Cir_Pos.z+aZ), GetScreenYFrom3D(Cir_Pos.x+aX,Cir_Pos.y,-Cir_Pos.z+aZ), GetScreenXFrom3D(Cir_Pos.x+bX,Cir_Pos.y,-Cir_Pos.z+bZ), GetScreenYFrom3D(Cir_Pos.x+bX,Cir_Pos.y,-Cir_Pos.z+bZ), ClrABGR,ClrABGR)
//ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawCircleX(Cir_Pos REF AS Vec3, Cir_Rds AS FLOAT, Segments AS INTEGER, Clr REF AS RGBA) // Circle is drawn on plane that spans YZ.
    ClrABGR AS INTEGER : ClrABGR = (Clr.a << 24) + (Clr.b << 16) + (Clr.g <<  8) + Clr.r

    //VertX AS FLOAT[Segments] : VertX[0] =
    //VertY AS FLOAT[Segments] : VertY[0] = Cir_Rds
    //VertZ AS FLOAT[Segments] : VertZ[0] = 0.0

    aY AS FLOAT : aY = Cir_Rds
    aZ AS FLOAT : aZ = 0.0
    bY AS FLOAT
    bZ AS FLOAT
    IF Segments > 1
        StepSize AS FLOAT : StepSize = PiH / Segments
        iSeg AS INTEGER
        FOR iSeg = 1 TO Segments-1
            bY = cosrad(StepSize*iSeg) * Cir_Rds
            bZ = sinrad(StepSize*iSeg) * Cir_Rds
            DrawLine(GetScreenXFrom3D(Cir_Pos.x,Cir_Pos.y+aY,-Cir_Pos.z-aZ), GetScreenYFrom3D(Cir_Pos.x,Cir_Pos.y+aY,-Cir_Pos.z-aZ), GetScreenXFrom3D(Cir_Pos.x,Cir_Pos.y+bY,-Cir_Pos.z-bZ), GetScreenYFrom3D(Cir_Pos.x,Cir_Pos.y+bY,-Cir_Pos.z-bZ), ClrABGR,ClrABGR)
            DrawLine(GetScreenXFrom3D(Cir_Pos.x,Cir_Pos.y-aY,-Cir_Pos.z-aZ), GetScreenYFrom3D(Cir_Pos.x,Cir_Pos.y-aY,-Cir_Pos.z-aZ), GetScreenXFrom3D(Cir_Pos.x,Cir_Pos.y-bY,-Cir_Pos.z-bZ), GetScreenYFrom3D(Cir_Pos.x,Cir_Pos.y-bY,-Cir_Pos.z-bZ), ClrABGR,ClrABGR)
            DrawLine(GetScreenXFrom3D(Cir_Pos.x,Cir_Pos.y-aY,-Cir_Pos.z+aZ), GetScreenYFrom3D(Cir_Pos.x,Cir_Pos.y-aY,-Cir_Pos.z+aZ), GetScreenXFrom3D(Cir_Pos.x,Cir_Pos.y-bY,-Cir_Pos.z+bZ), GetScreenYFrom3D(Cir_Pos.x,Cir_Pos.y-bY,-Cir_Pos.z+bZ), ClrABGR,ClrABGR)
            DrawLine(GetScreenXFrom3D(Cir_Pos.x,Cir_Pos.y+aY,-Cir_Pos.z+aZ), GetScreenYFrom3D(Cir_Pos.x,Cir_Pos.y+aY,-Cir_Pos.z+aZ), GetScreenXFrom3D(Cir_Pos.x,Cir_Pos.y+bY,-Cir_Pos.z+bZ), GetScreenYFrom3D(Cir_Pos.x,Cir_Pos.y+bY,-Cir_Pos.z+bZ), ClrABGR,ClrABGR)
            aY = bY
            aZ = bZ
        NEXT iSeg
    ENDIF
    bY = 0.0
    bZ = Cir_Rds
    DrawLine(GetScreenXFrom3D(Cir_Pos.x,Cir_Pos.y+aY,-Cir_Pos.z-aZ), GetScreenYFrom3D(Cir_Pos.x,Cir_Pos.y+aY,-Cir_Pos.z-aZ), GetScreenXFrom3D(Cir_Pos.x,Cir_Pos.y+bY,-Cir_Pos.z-bZ), GetScreenYFrom3D(Cir_Pos.x,Cir_Pos.y+bY,-Cir_Pos.z-bZ), ClrABGR,ClrABGR)
    DrawLine(GetScreenXFrom3D(Cir_Pos.x,Cir_Pos.y-aY,-Cir_Pos.z-aZ), GetScreenYFrom3D(Cir_Pos.x,Cir_Pos.y-aY,-Cir_Pos.z-aZ), GetScreenXFrom3D(Cir_Pos.x,Cir_Pos.y-bY,-Cir_Pos.z-bZ), GetScreenYFrom3D(Cir_Pos.x,Cir_Pos.y-bY,-Cir_Pos.z-bZ), ClrABGR,ClrABGR)
    DrawLine(GetScreenXFrom3D(Cir_Pos.x,Cir_Pos.y-aY,-Cir_Pos.z+aZ), GetScreenYFrom3D(Cir_Pos.x,Cir_Pos.y-aY,-Cir_Pos.z+aZ), GetScreenXFrom3D(Cir_Pos.x,Cir_Pos.y-bY,-Cir_Pos.z+bZ), GetScreenYFrom3D(Cir_Pos.x,Cir_Pos.y-bY,-Cir_Pos.z+bZ), ClrABGR,ClrABGR)
    DrawLine(GetScreenXFrom3D(Cir_Pos.x,Cir_Pos.y+aY,-Cir_Pos.z+aZ), GetScreenYFrom3D(Cir_Pos.x,Cir_Pos.y+aY,-Cir_Pos.z+aZ), GetScreenXFrom3D(Cir_Pos.x,Cir_Pos.y+bY,-Cir_Pos.z+bZ), GetScreenYFrom3D(Cir_Pos.x,Cir_Pos.y+bY,-Cir_Pos.z+bZ), ClrABGR,ClrABGR)
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawCircleY(Cir_Pos REF AS Vec3, Cir_Rds AS FLOAT, Segments AS INTEGER, Clr REF AS RGBA) // Circle is drawn on plane that spans ZX.
    ClrABGR AS INTEGER : ClrABGR = (Clr.a << 24) + (Clr.b << 16) + (Clr.g <<  8) + Clr.r
    aX AS FLOAT : aX = Cir_Rds
    aZ AS FLOAT : aZ = 0.0
    bX AS FLOAT
    bZ AS FLOAT
    IF Segments > 1
        StepSize AS FLOAT : StepSize = PiH / Segments
        iSeg AS INTEGER
        FOR iSeg = 1 TO Segments-1
            bX = cosrad(StepSize*iSeg) * Cir_Rds
            bZ = sinrad(StepSize*iSeg) * Cir_Rds
            DrawLine(GetScreenXFrom3D(Cir_Pos.x+aX,Cir_Pos.y,-Cir_Pos.z-aZ), GetScreenYFrom3D(Cir_Pos.x+aX,Cir_Pos.y,-Cir_Pos.z-aZ), GetScreenXFrom3D(Cir_Pos.x+bX,Cir_Pos.y,-Cir_Pos.z-bZ), GetScreenYFrom3D(Cir_Pos.x+bX,Cir_Pos.y,-Cir_Pos.z-bZ), ClrABGR,ClrABGR)
            DrawLine(GetScreenXFrom3D(Cir_Pos.x-aX,Cir_Pos.y,-Cir_Pos.z-aZ), GetScreenYFrom3D(Cir_Pos.x-aX,Cir_Pos.y,-Cir_Pos.z-aZ), GetScreenXFrom3D(Cir_Pos.x-bX,Cir_Pos.y,-Cir_Pos.z-bZ), GetScreenYFrom3D(Cir_Pos.x-bX,Cir_Pos.y,-Cir_Pos.z-bZ), ClrABGR,ClrABGR)
            DrawLine(GetScreenXFrom3D(Cir_Pos.x-aX,Cir_Pos.y,-Cir_Pos.z+aZ), GetScreenYFrom3D(Cir_Pos.x-aX,Cir_Pos.y,-Cir_Pos.z+aZ), GetScreenXFrom3D(Cir_Pos.x-bX,Cir_Pos.y,-Cir_Pos.z+bZ), GetScreenYFrom3D(Cir_Pos.x-bX,Cir_Pos.y,-Cir_Pos.z+bZ), ClrABGR,ClrABGR)
            DrawLine(GetScreenXFrom3D(Cir_Pos.x+aX,Cir_Pos.y,-Cir_Pos.z+aZ), GetScreenYFrom3D(Cir_Pos.x+aX,Cir_Pos.y,-Cir_Pos.z+aZ), GetScreenXFrom3D(Cir_Pos.x+bX,Cir_Pos.y,-Cir_Pos.z+bZ), GetScreenYFrom3D(Cir_Pos.x+bX,Cir_Pos.y,-Cir_Pos.z+bZ), ClrABGR,ClrABGR)
            aX = bX
            aZ = bZ
        NEXT iSeg
    ENDIF
    bX = 0.0
    bZ = Cir_Rds
    DrawLine(GetScreenXFrom3D(Cir_Pos.x+aX,Cir_Pos.y,-Cir_Pos.z-aZ), GetScreenYFrom3D(Cir_Pos.x+aX,Cir_Pos.y,-Cir_Pos.z-aZ), GetScreenXFrom3D(Cir_Pos.x+bX,Cir_Pos.y,-Cir_Pos.z-bZ), GetScreenYFrom3D(Cir_Pos.x+bX,Cir_Pos.y,-Cir_Pos.z-bZ), ClrABGR,ClrABGR)
    DrawLine(GetScreenXFrom3D(Cir_Pos.x-aX,Cir_Pos.y,-Cir_Pos.z-aZ), GetScreenYFrom3D(Cir_Pos.x-aX,Cir_Pos.y,-Cir_Pos.z-aZ), GetScreenXFrom3D(Cir_Pos.x-bX,Cir_Pos.y,-Cir_Pos.z-bZ), GetScreenYFrom3D(Cir_Pos.x-bX,Cir_Pos.y,-Cir_Pos.z-bZ), ClrABGR,ClrABGR)
    DrawLine(GetScreenXFrom3D(Cir_Pos.x-aX,Cir_Pos.y,-Cir_Pos.z+aZ), GetScreenYFrom3D(Cir_Pos.x-aX,Cir_Pos.y,-Cir_Pos.z+aZ), GetScreenXFrom3D(Cir_Pos.x-bX,Cir_Pos.y,-Cir_Pos.z+bZ), GetScreenYFrom3D(Cir_Pos.x-bX,Cir_Pos.y,-Cir_Pos.z+bZ), ClrABGR,ClrABGR)
    DrawLine(GetScreenXFrom3D(Cir_Pos.x+aX,Cir_Pos.y,-Cir_Pos.z+aZ), GetScreenYFrom3D(Cir_Pos.x+aX,Cir_Pos.y,-Cir_Pos.z+aZ), GetScreenXFrom3D(Cir_Pos.x+bX,Cir_Pos.y,-Cir_Pos.z+bZ), GetScreenYFrom3D(Cir_Pos.x+bX,Cir_Pos.y,-Cir_Pos.z+bZ), ClrABGR,ClrABGR)
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawCircleZ(Cir_Pos REF AS Vec3, Cir_Rds AS FLOAT, Segments AS INTEGER, Clr REF AS RGBA) // Circle is drawn on plane that spans XY.
    ClrABGR AS INTEGER : ClrABGR = (Clr.a << 24) + (Clr.b << 16) + (Clr.g <<  8) + Clr.r
    aX AS FLOAT : aX = Cir_Rds
    aY AS FLOAT : aY = 0.0
    bX AS FLOAT
    bY AS FLOAT
    IF Segments > 1
        StepSize AS FLOAT : StepSize = PiH / Segments
        iSeg AS INTEGER
        FOR iSeg = 1 TO Segments-1
            bX = cosrad(StepSize*iSeg) * Cir_Rds
            bY = sinrad(StepSize*iSeg) * Cir_Rds
            DrawLine(GetScreenXFrom3D(Cir_Pos.x+aX,Cir_Pos.y-aY,-Cir_Pos.z), GetScreenYFrom3D(Cir_Pos.x+aX,Cir_Pos.y-aY,-Cir_Pos.z), GetScreenXFrom3D(Cir_Pos.x+bX,Cir_Pos.y-bY,-Cir_Pos.z), GetScreenYFrom3D(Cir_Pos.x+bX,Cir_Pos.y-bY,-Cir_Pos.z), ClrABGR,ClrABGR)
            DrawLine(GetScreenXFrom3D(Cir_Pos.x-aX,Cir_Pos.y-aY,-Cir_Pos.z), GetScreenYFrom3D(Cir_Pos.x-aX,Cir_Pos.y-aY,-Cir_Pos.z), GetScreenXFrom3D(Cir_Pos.x-bX,Cir_Pos.y-bY,-Cir_Pos.z), GetScreenYFrom3D(Cir_Pos.x-bX,Cir_Pos.y-bY,-Cir_Pos.z), ClrABGR,ClrABGR)
            DrawLine(GetScreenXFrom3D(Cir_Pos.x-aX,Cir_Pos.y+aY,-Cir_Pos.z), GetScreenYFrom3D(Cir_Pos.x-aX,Cir_Pos.y+aY,-Cir_Pos.z), GetScreenXFrom3D(Cir_Pos.x-bX,Cir_Pos.y+bY,-Cir_Pos.z), GetScreenYFrom3D(Cir_Pos.x-bX,Cir_Pos.y+bY,-Cir_Pos.z), ClrABGR,ClrABGR)
            DrawLine(GetScreenXFrom3D(Cir_Pos.x+aX,Cir_Pos.y+aY,-Cir_Pos.z), GetScreenYFrom3D(Cir_Pos.x+aX,Cir_Pos.y+aY,-Cir_Pos.z), GetScreenXFrom3D(Cir_Pos.x+bX,Cir_Pos.y+bY,-Cir_Pos.z), GetScreenYFrom3D(Cir_Pos.x+bX,Cir_Pos.y+bY,-Cir_Pos.z), ClrABGR,ClrABGR)
            aX = bX
            aY = bY
        NEXT iSeg
    ENDIF
    bX = 0.0
    bY = Cir_Rds
    DrawLine(GetScreenXFrom3D(Cir_Pos.x+aX,Cir_Pos.y-aY,-Cir_Pos.z), GetScreenYFrom3D(Cir_Pos.x+aX,Cir_Pos.y-aY,-Cir_Pos.z), GetScreenXFrom3D(Cir_Pos.x+bX,Cir_Pos.y-bY,-Cir_Pos.z), GetScreenYFrom3D(Cir_Pos.x+bX,Cir_Pos.y-bY,-Cir_Pos.z), ClrABGR,ClrABGR)
    DrawLine(GetScreenXFrom3D(Cir_Pos.x-aX,Cir_Pos.y-aY,-Cir_Pos.z), GetScreenYFrom3D(Cir_Pos.x-aX,Cir_Pos.y-aY,-Cir_Pos.z), GetScreenXFrom3D(Cir_Pos.x-bX,Cir_Pos.y-bY,-Cir_Pos.z), GetScreenYFrom3D(Cir_Pos.x-bX,Cir_Pos.y-bY,-Cir_Pos.z), ClrABGR,ClrABGR)
    DrawLine(GetScreenXFrom3D(Cir_Pos.x-aX,Cir_Pos.y+aY,-Cir_Pos.z), GetScreenYFrom3D(Cir_Pos.x-aX,Cir_Pos.y+aY,-Cir_Pos.z), GetScreenXFrom3D(Cir_Pos.x-bX,Cir_Pos.y+bY,-Cir_Pos.z), GetScreenYFrom3D(Cir_Pos.x-bX,Cir_Pos.y+bY,-Cir_Pos.z), ClrABGR,ClrABGR)
    DrawLine(GetScreenXFrom3D(Cir_Pos.x+aX,Cir_Pos.y+aY,-Cir_Pos.z), GetScreenYFrom3D(Cir_Pos.x+aX,Cir_Pos.y+aY,-Cir_Pos.z), GetScreenXFrom3D(Cir_Pos.x+bX,Cir_Pos.y+bY,-Cir_Pos.z), GetScreenYFrom3D(Cir_Pos.x+bX,Cir_Pos.y+bY,-Cir_Pos.z), ClrABGR,ClrABGR)
ENDFUNCTION

