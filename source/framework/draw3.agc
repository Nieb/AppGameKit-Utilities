///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawVert(Vert REF AS Vec3, Size AS FLOAT, ClrABGR AS INTEGER)
    IF 1 /// Prevent GetScreenPosFrom3D() from barfing.
        CamLook AS Vec3
        CamLook.y =              cos( GetCameraAngleX(1) ) // Length of XZ.
        CamLook.x =  CamLook.y * sin( GetCameraAngleY(1) )
        CamLook.z = -CamLook.y * cos( GetCameraAngleY(1) ) // Z is inverted.
        CamLook.y =             -sin( GetCameraAngleX(1) ) // Actual Y value.
        CamPos AS Vec3
        CamPos = add3(vec3(GetCameraX(1), GetCameraY(1), -GetCameraZ(1)), mul3f(CamLook, 0.0625+0.001))

        IF dot3(CamLook, sub3(Vert, CamPos)) <= 0.0 THEN EXITFUNCTION // Is Vert behind Camera?
    ENDIF

    DrawEllipse( GetScreenXFrom3D(Vert.x,Vert.y,-Vert.z), GetScreenYFrom3D(Vert.x,Vert.y,-Vert.z), Size,Size, ClrABGR,ClrABGR, 1 )
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawVertC(Vert REF AS Vec3, Size AS FLOAT, Clr REF AS RGBA)
    ClrABGR AS INTEGER : ClrABGR = (Clr.a << 24) + (Clr.b << 16) + (Clr.g <<  8) + Clr.r
    DrawEllipse( GetScreenXFrom3D(Vert.x,Vert.y,-Vert.z), GetScreenYFrom3D(Vert.x,Vert.y,-Vert.z), Size,Size, ClrABGR,ClrABGR, 1 )
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawEdge(VertA AS Vec3, VertB AS Vec3, ClrABGR AS INTEGER)
    IF 1 /// Prevent GetScreenPosFrom3D() from barfing.
        CamLook AS Vec3
        CamLook.y =              cos( GetCameraAngleX(1) ) // Length of XZ.
        CamLook.x =  CamLook.y * sin( GetCameraAngleY(1) )
        CamLook.z = -CamLook.y * cos( GetCameraAngleY(1) ) // Z is inverted.
        CamLook.y =             -sin( GetCameraAngleX(1) ) // Actual Y value.
        CamPos AS Vec3
        CamPos = add3(vec3(GetCameraX(1),GetCameraY(1),-GetCameraZ(1)), mul3f(CamLook, 0.0625+0.001))

        VertA_IsBehindCamera AS INTEGER = 0
        VertB_IsBehindCamera AS INTEGER = 0
        IF dot3(CamLook, sub3(VertA, CamPos)) < 0.0 THEN VertA_IsBehindCamera = 1
        IF dot3(CamLook, sub3(VertB, CamPos)) < 0.0 THEN VertB_IsBehindCamera = 1

        IF     VertA_IsBehindCamera AND VertB_IsBehindCamera : EXITFUNCTION
        ELSEIF VertA_IsBehindCamera : VertA = IRayVsIPlane( VertA, nrm3(sub3(VertB,VertA)), CamPos, CamLook )
        ELSEIF VertB_IsBehindCamera : VertB = IRayVsIPlane( VertB, nrm3(sub3(VertA,VertB)), CamPos, CamLook )
        ENDIF
    ENDIF

    DrawLine( GetScreenXFrom3D(VertA.x,VertA.y,-VertA.z),GetScreenYFrom3D(VertA.x,VertA.y,-VertA.z),  GetScreenXFrom3D(VertB.x,VertB.y,-VertB.z),GetScreenYFrom3D(VertB.x,VertB.y,-VertB.z),  ClrABGR,ClrABGR )
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawEdgeC(VertA REF AS Vec3, VertB REF AS Vec3, Clr REF AS RGBA)
    ClrABGR AS INTEGER : ClrABGR = (Clr.a << 24) + (Clr.b << 16) + (Clr.g <<  8) + Clr.r
    DrawLine( GetScreenXFrom3D(VertA.x,VertA.y,-VertA.z),GetScreenYFrom3D(VertA.x,VertA.y,-VertA.z),  GetScreenXFrom3D(VertB.x,VertB.y,-VertB.z),GetScreenYFrom3D(VertB.x,VertB.y,-VertB.z),  ClrABGR,ClrABGR )
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//FUNCTION DrawCircle(Cir_Pos REF AS Vec3, Cir_Rot REF AS Vec3, Cir_Rds AS FLOAT, Segments AS INTEGER, Clr REF AS RGBA)

// Todo.
// Produce draw points, then rotate them.

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


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawCircleX(Cir_Pos REF AS Vec3, Cir_Rds AS FLOAT, Segments AS INTEGER, Clr REF AS RGBA) // Circle drawn on plane that spans Z & Y.
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


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawCircleY(Cir_Pos REF AS Vec3, Cir_Rds AS FLOAT, Segments AS INTEGER, Clr REF AS RGBA) // Circle drawn on plane that spans X & Z.
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


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawCircleZ(Cir_Pos REF AS Vec3, Cir_Rds AS FLOAT, Segments AS INTEGER, Clr REF AS RGBA) // Circle drawn on plane that spans X & Y.
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

