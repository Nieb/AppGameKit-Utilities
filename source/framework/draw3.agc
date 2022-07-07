///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawVert(Vert REF AS Vec3, Size AS FLOAT, ClrABGR AS INTEGER)
    CamLook AS Vec3
    CamLook.y =              cos( GetCameraAngleX(1) ) // Length of XZ.
    CamLook.x =  CamLook.y * sin( GetCameraAngleY(1) )
    CamLook.z = -CamLook.y * cos( GetCameraAngleY(1) ) // Z is inverted.
    CamLook.y =             -sin( GetCameraAngleX(1) ) // Actual Y value.
    CamPos AS Vec3
    CamPos = add3(vec3(GetCameraX(1), GetCameraY(1), -GetCameraZ(1)), mul3f(CamLook, 0.0625+0.001))

    IF dot3(CamLook, sub3(Vert, CamPos)) <= 0.0 THEN EXITFUNCTION // Is Vert behind Camera?

    DrawEllipse( GetScreenXFrom3D(Vert.x,Vert.y,-Vert.z), GetScreenYFrom3D(Vert.x,Vert.y,-Vert.z), Size,Size, ClrABGR,ClrABGR, 1 )
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawVert2(Vert REF AS Vec3, Size AS FLOAT, Clr REF AS RGBA)
    ClrABGR AS INTEGER : ClrABGR = (Clr.a << 24) + (Clr.b << 16) + (Clr.g <<  8) + Clr.r
    DrawEllipse( GetScreenXFrom3D(Vert.x,Vert.y,-Vert.z), GetScreenYFrom3D(Vert.x,Vert.y,-Vert.z), Size,Size, ClrABGR,ClrABGR, 1 )
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawEdge(VertA AS Vec3, VertB AS Vec3, ClrABGR AS INTEGER)
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

    DrawLine( GetScreenXFrom3D(VertA.x,VertA.y,-VertA.z),GetScreenYFrom3D(VertA.x,VertA.y,-VertA.z),  GetScreenXFrom3D(VertB.x,VertB.y,-VertB.z),GetScreenYFrom3D(VertB.x,VertB.y,-VertB.z),  ClrABGR,ClrABGR )
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawEdge2(VertA REF AS Vec3, VertB REF AS Vec3, Clr REF AS RGBA)
    ClrABGR AS INTEGER : ClrABGR = (Clr.a << 24) + (Clr.b << 16) + (Clr.g <<  8) + Clr.r
    DrawLine( GetScreenXFrom3D(VertA.x,VertA.y,-VertA.z),GetScreenYFrom3D(VertA.x,VertA.y,-VertA.z),  GetScreenXFrom3D(VertB.x,VertB.y,-VertB.z),GetScreenYFrom3D(VertB.x,VertB.y,-VertB.z),  ClrABGR,ClrABGR )
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//FUNCTION DrawCircle(CirPos REF AS Vec3, CirRot REF AS Vec3, CirRad AS FLOAT, Segments AS INTEGER, Clr REF AS RGBA)

// Todo.
// Produce draw points, then rotate them.

//    ClrABGR AS INTEGER : ClrABGR = (Clr.a << 24) + (Clr.b << 16) + (Clr.g <<  8) + Clr.r
//    aX AS FLOAT : aX = CirRad
//    aZ AS FLOAT : aZ = 0.0
//    bX AS FLOAT
//    bZ AS FLOAT
//    IF Segments > 1
//        StepSize AS FLOAT : StepSize = PiH / Segments
//        iSeg AS INTEGER
//        FOR iSeg = 1 TO Segments-1 // xpos = x-CirRad TO xpos <= x+CirRad STEP 0.1
//            bX = cosrad(StepSize * iSeg)*CirRad
//            bZ = sinrad(StepSize * iSeg)*CirRad
//            DrawLine(GetScreenXFrom3D(CirPos.x+aX,CirPos.y,-CirPos.z-aZ), GetScreenYFrom3D(CirPos.x+aX,CirPos.y,-CirPos.z-aZ), GetScreenXFrom3D(CirPos.x+bX,CirPos.y,-CirPos.z-bZ), GetScreenYFrom3D(CirPos.x+bX,CirPos.y,-CirPos.z-bZ), ClrABGR,ClrABGR)
//            DrawLine(GetScreenXFrom3D(CirPos.x-aX,CirPos.y,-CirPos.z-aZ), GetScreenYFrom3D(CirPos.x-aX,CirPos.y,-CirPos.z-aZ), GetScreenXFrom3D(CirPos.x-bX,CirPos.y,-CirPos.z-bZ), GetScreenYFrom3D(CirPos.x-bX,CirPos.y,-CirPos.z-bZ), ClrABGR,ClrABGR)
//            DrawLine(GetScreenXFrom3D(CirPos.x-aX,CirPos.y,-CirPos.z+aZ), GetScreenYFrom3D(CirPos.x-aX,CirPos.y,-CirPos.z+aZ), GetScreenXFrom3D(CirPos.x-bX,CirPos.y,-CirPos.z+bZ), GetScreenYFrom3D(CirPos.x-bX,CirPos.y,-CirPos.z+bZ), ClrABGR,ClrABGR)
//            DrawLine(GetScreenXFrom3D(CirPos.x+aX,CirPos.y,-CirPos.z+aZ), GetScreenYFrom3D(CirPos.x+aX,CirPos.y,-CirPos.z+aZ), GetScreenXFrom3D(CirPos.x+bX,CirPos.y,-CirPos.z+bZ), GetScreenYFrom3D(CirPos.x+bX,CirPos.y,-CirPos.z+bZ), ClrABGR,ClrABGR)
//            aX = bX
//            aZ = bZ
//        NEXT iSeg
//    ENDIF
//    bX = 0.0
//    bZ = CirRad
//    DrawLine(GetScreenXFrom3D(CirPos.x+aX,CirPos.y,-CirPos.z-aZ), GetScreenYFrom3D(CirPos.x+aX,CirPos.y,-CirPos.z-aZ), GetScreenXFrom3D(CirPos.x+bX,CirPos.y,-CirPos.z-bZ), GetScreenYFrom3D(CirPos.x+bX,CirPos.y,-CirPos.z-bZ), ClrABGR,ClrABGR)
//    DrawLine(GetScreenXFrom3D(CirPos.x-aX,CirPos.y,-CirPos.z-aZ), GetScreenYFrom3D(CirPos.x-aX,CirPos.y,-CirPos.z-aZ), GetScreenXFrom3D(CirPos.x-bX,CirPos.y,-CirPos.z-bZ), GetScreenYFrom3D(CirPos.x-bX,CirPos.y,-CirPos.z-bZ), ClrABGR,ClrABGR)
//    DrawLine(GetScreenXFrom3D(CirPos.x-aX,CirPos.y,-CirPos.z+aZ), GetScreenYFrom3D(CirPos.x-aX,CirPos.y,-CirPos.z+aZ), GetScreenXFrom3D(CirPos.x-bX,CirPos.y,-CirPos.z+bZ), GetScreenYFrom3D(CirPos.x-bX,CirPos.y,-CirPos.z+bZ), ClrABGR,ClrABGR)
//    DrawLine(GetScreenXFrom3D(CirPos.x+aX,CirPos.y,-CirPos.z+aZ), GetScreenYFrom3D(CirPos.x+aX,CirPos.y,-CirPos.z+aZ), GetScreenXFrom3D(CirPos.x+bX,CirPos.y,-CirPos.z+bZ), GetScreenYFrom3D(CirPos.x+bX,CirPos.y,-CirPos.z+bZ), ClrABGR,ClrABGR)
//ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawCircleX(CirPos REF AS Vec3, CirRad AS FLOAT, Segments AS INTEGER, Clr REF AS RGBA) // Circle drawn on plane that spans Z & Y.
    ClrABGR AS INTEGER : ClrABGR = (Clr.a << 24) + (Clr.b << 16) + (Clr.g <<  8) + Clr.r

    //VertX AS FLOAT[Segments] : VertX[0] =
    //VertY AS FLOAT[Segments] : VertY[0] = CirRad
    //VertZ AS FLOAT[Segments] : VertZ[0] = 0.0

    aY AS FLOAT : aY = CirRad
    aZ AS FLOAT : aZ = 0.0
    bY AS FLOAT
    bZ AS FLOAT
    IF Segments > 1
        StepSize AS FLOAT : StepSize = PiH / Segments
        iSeg AS INTEGER
        FOR iSeg = 1 TO Segments-1
            bY = cosrad(StepSize*iSeg) * CirRad
            bZ = sinrad(StepSize*iSeg) * CirRad
            DrawLine(GetScreenXFrom3D(CirPos.x,CirPos.y+aY,-CirPos.z-aZ), GetScreenYFrom3D(CirPos.x,CirPos.y+aY,-CirPos.z-aZ), GetScreenXFrom3D(CirPos.x,CirPos.y+bY,-CirPos.z-bZ), GetScreenYFrom3D(CirPos.x,CirPos.y+bY,-CirPos.z-bZ), ClrABGR,ClrABGR)
            DrawLine(GetScreenXFrom3D(CirPos.x,CirPos.y-aY,-CirPos.z-aZ), GetScreenYFrom3D(CirPos.x,CirPos.y-aY,-CirPos.z-aZ), GetScreenXFrom3D(CirPos.x,CirPos.y-bY,-CirPos.z-bZ), GetScreenYFrom3D(CirPos.x,CirPos.y-bY,-CirPos.z-bZ), ClrABGR,ClrABGR)
            DrawLine(GetScreenXFrom3D(CirPos.x,CirPos.y-aY,-CirPos.z+aZ), GetScreenYFrom3D(CirPos.x,CirPos.y-aY,-CirPos.z+aZ), GetScreenXFrom3D(CirPos.x,CirPos.y-bY,-CirPos.z+bZ), GetScreenYFrom3D(CirPos.x,CirPos.y-bY,-CirPos.z+bZ), ClrABGR,ClrABGR)
            DrawLine(GetScreenXFrom3D(CirPos.x,CirPos.y+aY,-CirPos.z+aZ), GetScreenYFrom3D(CirPos.x,CirPos.y+aY,-CirPos.z+aZ), GetScreenXFrom3D(CirPos.x,CirPos.y+bY,-CirPos.z+bZ), GetScreenYFrom3D(CirPos.x,CirPos.y+bY,-CirPos.z+bZ), ClrABGR,ClrABGR)
            aY = bY
            aZ = bZ
        NEXT iSeg
    ENDIF
    bY = 0.0
    bZ = CirRad
    DrawLine(GetScreenXFrom3D(CirPos.x,CirPos.y+aY,-CirPos.z-aZ), GetScreenYFrom3D(CirPos.x,CirPos.y+aY,-CirPos.z-aZ), GetScreenXFrom3D(CirPos.x,CirPos.y+bY,-CirPos.z-bZ), GetScreenYFrom3D(CirPos.x,CirPos.y+bY,-CirPos.z-bZ), ClrABGR,ClrABGR)
    DrawLine(GetScreenXFrom3D(CirPos.x,CirPos.y-aY,-CirPos.z-aZ), GetScreenYFrom3D(CirPos.x,CirPos.y-aY,-CirPos.z-aZ), GetScreenXFrom3D(CirPos.x,CirPos.y-bY,-CirPos.z-bZ), GetScreenYFrom3D(CirPos.x,CirPos.y-bY,-CirPos.z-bZ), ClrABGR,ClrABGR)
    DrawLine(GetScreenXFrom3D(CirPos.x,CirPos.y-aY,-CirPos.z+aZ), GetScreenYFrom3D(CirPos.x,CirPos.y-aY,-CirPos.z+aZ), GetScreenXFrom3D(CirPos.x,CirPos.y-bY,-CirPos.z+bZ), GetScreenYFrom3D(CirPos.x,CirPos.y-bY,-CirPos.z+bZ), ClrABGR,ClrABGR)
    DrawLine(GetScreenXFrom3D(CirPos.x,CirPos.y+aY,-CirPos.z+aZ), GetScreenYFrom3D(CirPos.x,CirPos.y+aY,-CirPos.z+aZ), GetScreenXFrom3D(CirPos.x,CirPos.y+bY,-CirPos.z+bZ), GetScreenYFrom3D(CirPos.x,CirPos.y+bY,-CirPos.z+bZ), ClrABGR,ClrABGR)
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawCircleY(CirPos REF AS Vec3, CirRad AS FLOAT, Segments AS INTEGER, Clr REF AS RGBA) // Circle drawn on plane that spans X & Z.
    ClrABGR AS INTEGER : ClrABGR = (Clr.a << 24) + (Clr.b << 16) + (Clr.g <<  8) + Clr.r
    aX AS FLOAT : aX = CirRad
    aZ AS FLOAT : aZ = 0.0
    bX AS FLOAT
    bZ AS FLOAT
    IF Segments > 1
        StepSize AS FLOAT : StepSize = PiH / Segments
        iSeg AS INTEGER
        FOR iSeg = 1 TO Segments-1
            bX = cosrad(StepSize*iSeg) * CirRad
            bZ = sinrad(StepSize*iSeg) * CirRad
            DrawLine(GetScreenXFrom3D(CirPos.x+aX,CirPos.y,-CirPos.z-aZ), GetScreenYFrom3D(CirPos.x+aX,CirPos.y,-CirPos.z-aZ), GetScreenXFrom3D(CirPos.x+bX,CirPos.y,-CirPos.z-bZ), GetScreenYFrom3D(CirPos.x+bX,CirPos.y,-CirPos.z-bZ), ClrABGR,ClrABGR)
            DrawLine(GetScreenXFrom3D(CirPos.x-aX,CirPos.y,-CirPos.z-aZ), GetScreenYFrom3D(CirPos.x-aX,CirPos.y,-CirPos.z-aZ), GetScreenXFrom3D(CirPos.x-bX,CirPos.y,-CirPos.z-bZ), GetScreenYFrom3D(CirPos.x-bX,CirPos.y,-CirPos.z-bZ), ClrABGR,ClrABGR)
            DrawLine(GetScreenXFrom3D(CirPos.x-aX,CirPos.y,-CirPos.z+aZ), GetScreenYFrom3D(CirPos.x-aX,CirPos.y,-CirPos.z+aZ), GetScreenXFrom3D(CirPos.x-bX,CirPos.y,-CirPos.z+bZ), GetScreenYFrom3D(CirPos.x-bX,CirPos.y,-CirPos.z+bZ), ClrABGR,ClrABGR)
            DrawLine(GetScreenXFrom3D(CirPos.x+aX,CirPos.y,-CirPos.z+aZ), GetScreenYFrom3D(CirPos.x+aX,CirPos.y,-CirPos.z+aZ), GetScreenXFrom3D(CirPos.x+bX,CirPos.y,-CirPos.z+bZ), GetScreenYFrom3D(CirPos.x+bX,CirPos.y,-CirPos.z+bZ), ClrABGR,ClrABGR)
            aX = bX
            aZ = bZ
        NEXT iSeg
    ENDIF
    bX = 0.0
    bZ = CirRad
    DrawLine(GetScreenXFrom3D(CirPos.x+aX,CirPos.y,-CirPos.z-aZ), GetScreenYFrom3D(CirPos.x+aX,CirPos.y,-CirPos.z-aZ), GetScreenXFrom3D(CirPos.x+bX,CirPos.y,-CirPos.z-bZ), GetScreenYFrom3D(CirPos.x+bX,CirPos.y,-CirPos.z-bZ), ClrABGR,ClrABGR)
    DrawLine(GetScreenXFrom3D(CirPos.x-aX,CirPos.y,-CirPos.z-aZ), GetScreenYFrom3D(CirPos.x-aX,CirPos.y,-CirPos.z-aZ), GetScreenXFrom3D(CirPos.x-bX,CirPos.y,-CirPos.z-bZ), GetScreenYFrom3D(CirPos.x-bX,CirPos.y,-CirPos.z-bZ), ClrABGR,ClrABGR)
    DrawLine(GetScreenXFrom3D(CirPos.x-aX,CirPos.y,-CirPos.z+aZ), GetScreenYFrom3D(CirPos.x-aX,CirPos.y,-CirPos.z+aZ), GetScreenXFrom3D(CirPos.x-bX,CirPos.y,-CirPos.z+bZ), GetScreenYFrom3D(CirPos.x-bX,CirPos.y,-CirPos.z+bZ), ClrABGR,ClrABGR)
    DrawLine(GetScreenXFrom3D(CirPos.x+aX,CirPos.y,-CirPos.z+aZ), GetScreenYFrom3D(CirPos.x+aX,CirPos.y,-CirPos.z+aZ), GetScreenXFrom3D(CirPos.x+bX,CirPos.y,-CirPos.z+bZ), GetScreenYFrom3D(CirPos.x+bX,CirPos.y,-CirPos.z+bZ), ClrABGR,ClrABGR)
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawCircleZ(CirPos REF AS Vec3, CirRad AS FLOAT, Segments AS INTEGER, Clr REF AS RGBA) // Circle drawn on plane that spans X & Y.
    ClrABGR AS INTEGER : ClrABGR = (Clr.a << 24) + (Clr.b << 16) + (Clr.g <<  8) + Clr.r
    aX AS FLOAT : aX = CirRad
    aY AS FLOAT : aY = 0.0
    bX AS FLOAT
    bY AS FLOAT
    IF Segments > 1
        StepSize AS FLOAT : StepSize = PiH / Segments
        iSeg AS INTEGER
        FOR iSeg = 1 TO Segments-1
            bX = cosrad(StepSize*iSeg) * CirRad
            bY = sinrad(StepSize*iSeg) * CirRad
            DrawLine(GetScreenXFrom3D(CirPos.x+aX,CirPos.y-aY,-CirPos.z), GetScreenYFrom3D(CirPos.x+aX,CirPos.y-aY,-CirPos.z), GetScreenXFrom3D(CirPos.x+bX,CirPos.y-bY,-CirPos.z), GetScreenYFrom3D(CirPos.x+bX,CirPos.y-bY,-CirPos.z), ClrABGR,ClrABGR)
            DrawLine(GetScreenXFrom3D(CirPos.x-aX,CirPos.y-aY,-CirPos.z), GetScreenYFrom3D(CirPos.x-aX,CirPos.y-aY,-CirPos.z), GetScreenXFrom3D(CirPos.x-bX,CirPos.y-bY,-CirPos.z), GetScreenYFrom3D(CirPos.x-bX,CirPos.y-bY,-CirPos.z), ClrABGR,ClrABGR)
            DrawLine(GetScreenXFrom3D(CirPos.x-aX,CirPos.y+aY,-CirPos.z), GetScreenYFrom3D(CirPos.x-aX,CirPos.y+aY,-CirPos.z), GetScreenXFrom3D(CirPos.x-bX,CirPos.y+bY,-CirPos.z), GetScreenYFrom3D(CirPos.x-bX,CirPos.y+bY,-CirPos.z), ClrABGR,ClrABGR)
            DrawLine(GetScreenXFrom3D(CirPos.x+aX,CirPos.y+aY,-CirPos.z), GetScreenYFrom3D(CirPos.x+aX,CirPos.y+aY,-CirPos.z), GetScreenXFrom3D(CirPos.x+bX,CirPos.y+bY,-CirPos.z), GetScreenYFrom3D(CirPos.x+bX,CirPos.y+bY,-CirPos.z), ClrABGR,ClrABGR)
            aX = bX
            aY = bY
        NEXT iSeg
    ENDIF
    bX = 0.0
    bY = CirRad
    DrawLine(GetScreenXFrom3D(CirPos.x+aX,CirPos.y-aY,-CirPos.z), GetScreenYFrom3D(CirPos.x+aX,CirPos.y-aY,-CirPos.z), GetScreenXFrom3D(CirPos.x+bX,CirPos.y-bY,-CirPos.z), GetScreenYFrom3D(CirPos.x+bX,CirPos.y-bY,-CirPos.z), ClrABGR,ClrABGR)
    DrawLine(GetScreenXFrom3D(CirPos.x-aX,CirPos.y-aY,-CirPos.z), GetScreenYFrom3D(CirPos.x-aX,CirPos.y-aY,-CirPos.z), GetScreenXFrom3D(CirPos.x-bX,CirPos.y-bY,-CirPos.z), GetScreenYFrom3D(CirPos.x-bX,CirPos.y-bY,-CirPos.z), ClrABGR,ClrABGR)
    DrawLine(GetScreenXFrom3D(CirPos.x-aX,CirPos.y+aY,-CirPos.z), GetScreenYFrom3D(CirPos.x-aX,CirPos.y+aY,-CirPos.z), GetScreenXFrom3D(CirPos.x-bX,CirPos.y+bY,-CirPos.z), GetScreenYFrom3D(CirPos.x-bX,CirPos.y+bY,-CirPos.z), ClrABGR,ClrABGR)
    DrawLine(GetScreenXFrom3D(CirPos.x+aX,CirPos.y+aY,-CirPos.z), GetScreenYFrom3D(CirPos.x+aX,CirPos.y+aY,-CirPos.z), GetScreenXFrom3D(CirPos.x+bX,CirPos.y+bY,-CirPos.z), GetScreenYFrom3D(CirPos.x+bX,CirPos.y+bY,-CirPos.z), ClrABGR,ClrABGR)
ENDFUNCTION

