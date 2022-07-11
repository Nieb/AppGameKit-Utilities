////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  "Point VS Axis-Aligned Rectangle"
FUNCTION PointvsAAR( PntPos REF AS Vec2,
                     RctPos REF AS Vec2,  // TopLeft.
                     RctSiz REF AS Vec2 ) // Width, Height.
    IF PntPos.x < RctPos.x+RctSiz.x AND PntPos.x >= RctPos.x AND PntPos.y < RctPos.y+RctSiz.y AND PntPos.y >= RctPos.y THEN EXITFUNCTION 1
ENDFUNCTION 0


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  "Axis-Aligned Rectangle VS Axis-Aligned Rectangle"
FUNCTION AARvsAAR( Rect1Pos REF AS Vec2,  // TopLeft.
                   Rect1Siz REF AS Vec2,  // Width, Height.
                   Rect2Pos REF AS Vec2,  // TopLeft.
                   Rect2Siz REF AS Vec2 ) // Width, Height.
    IF Rect1Pos.x < Rect2Pos.x+Rect2Siz.x AND Rect1Pos.x+Rect1Siz.x >= Rect2Pos.x AND Rect1Pos.y < Rect2Pos.y+Rect2Siz.y AND Rect1Pos.y+Rect1Siz.y >= Rect2Pos.y THEN EXITFUNCTION 1
ENDFUNCTION 0


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  "Axis-Aligned Line VS Axis-Aligned Rectangle"
FUNCTION AALvsAAR()

    // TODO.

    // PointvsRange    Perpendicular of Line
    // THEN
    // RangevsRange    Parallel of Line
ENDFUNCTION 0


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  "Circle VS Axis-Aligned Rectangle"
FUNCTION CirclevsAAR( CirPos REF AS Vec2,
                      CirRad AS FLOAT,
                      RctPos REF AS Vec2,  // TopLeft.
                      RctSiz REF AS Vec2 ) // Width, Height.
    //==============================================================================================================================================================================
    Cir_Lf AS FLOAT : Cir_Lf = CirPos.x - CirRad // "Circle-Left"
    Cir_Tp AS FLOAT : Cir_Tp = CirPos.y - CirRad // "Circle-Top"
    Cir_Rt AS FLOAT : Cir_Rt = CirPos.x + CirRad // "Circle-Right"
    Cir_Bm AS FLOAT : Cir_Bm = CirPos.y + CirRad // "Circle-Bottom"
    //==============================================================================================================================================================================
    Rct_Rt AS FLOAT : Rct_Rt = RctPos.x + RctSiz.x // "Rectangle-Right"
    Rct_Bm AS FLOAT : Rct_Bm = RctPos.y + RctSiz.y // "Rectangle-Bottom"
    //==============================================================================================================================================================================
    IF (Cir_Lf > Rct_Rt OR Cir_Tp > Rct_Bm OR Cir_Rt < RctPos.x OR Cir_Bm < RctPos.y) THEN EXITFUNCTION 0
    //==============================================================================================================================================================================
    IF     (CirPos.y >= RctPos.y AND CirPos.y < Rct_Bm) : IF (Cir_Lf < Rct_Rt AND Cir_Rt > RctPos.x) THEN EXITFUNCTION 1
    ELSEIF (CirPos.x >= RctPos.x AND CirPos.x < Rct_Rt) : IF (Cir_Tp < Rct_Bm AND Cir_Bm > RctPos.y) THEN EXITFUNCTION 1
    ENDIF
    //==============================================================================================================================================================================
    Delta_X AS FLOAT
    IF     (CirPos.x < RctPos.x) : Delta_X = CirPos.x - RctPos.x
    ELSEIF (CirPos.x > Rct_Rt  ) : Delta_X = CirPos.x - Rct_Rt
    ENDIF
    Delta_Y AS FLOAT
    IF     (CirPos.y < RctPos.y) : Delta_Y = CirPos.y - RctPos.y
    ELSEIF (CirPos.y > Rct_Bm  ) : Delta_Y = CirPos.y - Rct_Bm
    ENDIF
    IF (Delta_X*Delta_X + Delta_Y*Delta_Y) <= (CirRad*CirRad) THEN EXITFUNCTION 1
    //==============================================================================================================================================================================
ENDFUNCTION 0


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  "Point VS Circle"
FUNCTION PointvsCircle( PntPos REF AS Vec2,
                        CirPos REF AS Vec2,
                        CirRad AS FLOAT )
    //==============================================================================================================================================================================
    Delta_X AS FLOAT : Delta_X = PntPos.x - CirPos.x
    Delta_Y AS FLOAT : Delta_Y = PntPos.y - CirPos.y
    IF (Delta_X*Delta_X + Delta_Y*Delta_Y) < (CirRad*CirRad) THEN EXITFUNCTION 1
    //==============================================================================================================================================================================
ENDFUNCTION 0


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  "Circle VS Circle"
FUNCTION CirclevsCircle( Circle1_X AS FLOAT, Circle1_Y AS FLOAT, Circle1_Radius AS FLOAT,
                         Circle2_X AS FLOAT, Circle2_Y AS FLOAT, Circle2_Radius AS FLOAT )
    //==============================================================================================================================================================================
    Delta_C1_C2_X AS FLOAT : Delta_C1_C2_X = Circle1_X - Circle2_X
    Delta_C1_C2_Y AS FLOAT : Delta_C1_C2_Y = Circle1_Y - Circle2_Y
    IF sqrt( Delta_C1_C2_X*Delta_C1_C2_X + Delta_C1_C2_Y*Delta_C1_C2_Y ) < Circle1_Radius + Circle2_Radius THEN EXITFUNCTION 1
    //==============================================================================================================================================================================
ENDFUNCTION 0


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  "Point VS Line"
FUNCTION PointVsLine( PointX AS INTEGER, PointY AS INTEGER,                                        // "Line" not to be confused with "Ray"
                      LineAX AS INTEGER, LineAY AS INTEGER, LineBX AS INTEGER, LineBY AS INTEGER ) // "tolerance" Parameter?
    // Is this ever useful?

    // DeltaPA = Pythagorean
    // DeltaPB = Pythagorean
    // DeltaAB = Pythagorean
    // IF DeltaPA + DeltaPB ≈ DeltaAB

ENDFUNCTION


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  "Line VS Line"
FUNCTION LineVsLine( LinPos1A REF AS Vec2,  // Overlapping parallel Lines will not test positive as a collision.
                     LinPos1B REF AS Vec2,
                     LinPos2A REF AS Vec2,
                     LinPos2B REF AS Vec2 )
    //==============================================================================================================================================================================
    LineDelta1_X AS FLOAT : LineDelta1_X = LinPos1B.x - LinPos1A.x // Line1 in LocalSpace.   A = (0,0)  B = (#,#)
    LineDelta1_Y AS FLOAT : LineDelta1_Y = LinPos1B.y - LinPos1A.y

    LineDelta2_X AS FLOAT : LineDelta2_X = LinPos2B.x - LinPos2A.x // Line2 in LocalSpace.   A = (0,0)  B = (#,#)
    LineDelta2_Y AS FLOAT : LineDelta2_Y = LinPos2B.y - LinPos2A.y

    LinePosDelta_X AS FLOAT : LinePosDelta_X = LinPos1A.x - LinPos2A.x
    LinePosDelta_Y AS FLOAT : LinePosDelta_Y = LinPos1A.y - LinPos2A.y
    //==============================================================================================================================================================================
    n1 AS FLOAT : n1 = (LineDelta1_X * LinePosDelta_Y) - (LineDelta1_Y * LinePosDelta_X) // LineDelta1  cross  LinePosDelta
    n2 AS FLOAT : n2 = (LineDelta2_X * LinePosDelta_Y) - (LineDelta2_Y * LinePosDelta_X) // LineDelta2  cross  LinePosDelta
    d  AS FLOAT : d  = (LineDelta1_X * LineDelta2_Y)     - (LineDelta1_Y * LineDelta2_X) // LineDelta1  cross  LineDelta2
    r AS FLOAT : r = n1 / d
    s AS FLOAT : s = n2 / d
    IF (r >= 0.0 AND r <= 1.0) AND (s >= 0.0 AND s <= 1.0) THEN EXITFUNCTION 1
    //==============================================================================================================================================================================
ENDFUNCTION 0


/////FUNCTION dot2(VecA REF AS Vec2, VecB REF AS Vec2) // 'VecA' "dot" 'VecB'
/////    Result = VecA.x * VecB.x + VecA.y * VecB.y
/////
/////FUNCTION crs2(VecA REF AS Vec2, VecB REF AS Vec2) // 'VecA' "cross" 'VecB'
/////    Result = VecA.x * VecB.y - VecA.y * VecB.x // This is Z of a 3D CrossProduct. X & Y would be Zero.


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  "Line VS Axis-Aligned Box"
FUNCTION LineVsAAB( LinPosA REF AS Vec2,
                    LinPosB REF AS Vec2,
                    RctPos  REF AS Vec2,  // RctPos = TopLeft                      @FIX   Origin = Center
                    RctSiz  REF AS Vec2 ) // RctSiz = Width, Height
////    //==============================================================================================================================================================================
////    BoxRadius AS FLOAT : BoxRadius = Box_Diameter * 0.5
////    Box_X_Lft AS FLOAT : Box_X_Lft = Box_X - BoxRadius
////    Box_X_Rit AS FLOAT : Box_X_Rit = Box_X + BoxRadius
////    Box_Y_Top AS FLOAT : Box_Y_Top = Box_Y - BoxRadius
////    Box_Y_Btm AS FLOAT : Box_Y_Btm = Box_Y + BoxRadius
////    //==============================================================================================================================================================================
////    // Is Area of line over Area of Box?
////    Lin_X_Lft AS FLOAT
////    Lin_X_Rit AS FLOAT
////    Lin_Y_Top AS FLOAT
////    Lin_Y_Btm AS FLOAT
////    IF LinPosA.x <= LinPosB.x : Lin_X_Lft = LinPosA.x : Lin_X_Rit = LinPosB.x
////    ELSE                      : Lin_X_Lft = LinPosB.x : Lin_X_Rit = LinPosA.x
////    ENDIF
////    IF LinPosA.y <= LinPosB.y : Lin_Y_Top = LinPosA.y : Lin_Y_Btm = LinPosB.y
////    ELSE                      : Lin_Y_Top = LinPosB.y : Lin_Y_Btm = LinPosA.y
////    ENDIF
////    IF (Box_X_Lft > Lin_X_Rit OR Box_Y_Top > Lin_Y_Btm OR Box_X_Rit < Lin_X_Lft OR Box_Y_Btm < Lin_Y_Top) THEN EXITFUNCTION 0  //@fix      Test >= Start, Test < End
////    //==============================================================================================================================================================================
////    // Is PointB in Box?                 Check PointB first, it's typically used as the destination of a movement vector.
////    IF LinPosB.x < Box_X_Rit AND LinPosB.x >= Box_X_Lft AND LinPosB.y < Box_Y_Btm AND LinPosB.y >= Box_Y_Top THEN EXITFUNCTION 101
////    //==============================================================================================================================================================================
////    // Is PointA in Box?
////    IF LinPosA.x < Box_X_Rit AND LinPosA.x >= Box_X_Lft AND LinPosA.y < Box_Y_Btm AND LinPosA.y >= Box_Y_Top THEN EXITFUNCTION 102
////    //==============================================================================================================================================================================
////    // Are any of the 4 Box lines colliding?
////    Delta_LineA_LineB_X AS FLOAT : Delta_LineA_LineB_X = LinPosB.x - LinPosA.x
////    Delta_LineA_LineB_Y AS FLOAT : Delta_LineA_LineB_Y = LinPosB.y - LinPosA.y
////    Delta_LineA_BoxA_X AS FLOAT
////    Delta_LineA_BoxA_Y AS FLOAT
////    //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
////    n1 AS FLOAT
////    n2 AS FLOAT
////    d AS FLOAT
////    r AS FLOAT
////    s AS FLOAT
////    //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
////    Delta_LineA_BoxA_X = LinPosA.x - Box_X_Lft
////    Delta_LineA_BoxA_Y = LinPosA.y - Box_Y_Top
////    n1 = (Delta_LineA_BoxA_Y * Delta_LineA_LineB_X) - (Delta_LineA_BoxA_X * Delta_LineA_LineB_Y)
////    n2 = (Delta_LineA_BoxA_Y * Box_Diameter)
////    d  = -(Delta_LineA_LineB_Y * Box_Diameter)
////    r = n1 / d
////    s = n2 / d
////    IF (r >= 0.0 AND r <= 1.0) AND (s >= 0.0 AND s <= 1.0) THEN EXITFUNCTION 201
////    //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
////    Delta_LineA_BoxA_X = LinPosA.x - Box_X_Rit
////    Delta_LineA_BoxA_Y = LinPosA.y - Box_Y_Top
////    n1 = (Delta_LineA_BoxA_Y * Delta_LineA_LineB_X) - (Delta_LineA_BoxA_X * Delta_LineA_LineB_Y)
////    n2 = -(Delta_LineA_BoxA_X * Box_Diameter)
////    d  = (Delta_LineA_LineB_X * Box_Diameter)
////    r = n1 / d
////    s = n2 / d
////    IF (r >= 0.0 AND r <= 1.0) AND (s >= 0.0 AND s <= 1.0) THEN EXITFUNCTION 202
////    //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
////    Delta_LineA_BoxA_X = LinPosA.x - Box_X_Rit
////    Delta_LineA_BoxA_Y = LinPosA.y - Box_Y_Btm
////    n1 = (Delta_LineA_BoxA_Y * Delta_LineA_LineB_X) - (Delta_LineA_BoxA_X * Delta_LineA_LineB_Y)
////    n2 = (Delta_LineA_BoxA_Y * -Box_Diameter)
////    d  = -(Delta_LineA_LineB_Y * -Box_Diameter)
////    r = n1 / d
////    s = n2 / d
////    IF (r >= 0.0 AND r <= 1.0) AND (s >= 0.0 AND s <= 1.0) THEN EXITFUNCTION 203
////    //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
////    // The function will never make it here.
////    Delta_LineA_BoxA_X = LinPosA.x - Box_X_Lft
////    Delta_LineA_BoxA_Y = LinPosA.y - Box_Y_Btm
////    n1 = (Delta_LineA_BoxA_Y * Delta_LineA_LineB_X) - (Delta_LineA_BoxA_X * Delta_LineA_LineB_Y)
////    n2 = -(Delta_LineA_BoxA_X * -Box_Diameter)
////    d  = (Delta_LineA_LineB_X * -Box_Diameter)
////    r = n1 / d
////    s = n2 / d
////    IF (r >= 0.0 AND r <= 1.0) AND (s >= 0.0 AND s <= 1.0) THEN EXITFUNCTION 204
////    //==============================================================================================================================================================================
ENDFUNCTION 0


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  "Line VS Axis-Aligned Rectangle"
FUNCTION LineVsAAR( LinPosA REF AS Vec2,
                    LinPosB REF AS Vec2,
                    RctPos  REF AS Vec2,  // RctPos = TopLeft
                    RctSiz  REF AS Vec2 ) // RctSiz = Width, Height
    //==============================================================================================================================================================================
    Rct_Rt AS FLOAT : Rct_Rt = RctPos.x + RctSiz.x
    Rct_Bm AS FLOAT : Rct_Bm = RctPos.y + RctSiz.y
    //==============================================================================================================================================================================
    // Is Area of Line over Area of Rectangle?
    Lin_Lf AS FLOAT
    Lin_Rt AS FLOAT
    IF     (LinPosA.x <= LinPosB.x) : Lin_Lf = LinPosA.x : Lin_Rt = LinPosB.x
    ELSEIF (LinPosA.x >  LinPosB.x) : Lin_Lf = LinPosB.x : Lin_Rt = LinPosA.x
    ENDIF
    Lin_Tp AS FLOAT
    Lin_Bm AS FLOAT
    IF     (LinPosA.y <= LinPosB.y) : Lin_Tp = LinPosA.y : Lin_Bm = LinPosB.y
    ELSEIF (LinPosA.y >  LinPosB.y) : Lin_Tp = LinPosB.y : Lin_Bm = LinPosA.y
    ENDIF
    IF RctPos.x > Lin_Rt OR RctPos.y > Lin_Bm OR Rct_Rt < Lin_Lf OR Rct_Bm < Lin_Tp THEN EXITFUNCTION 0
    //==============================================================================================================================================================================
    // Is PointB in Rectangle?                 Check PointB first, it's typically used as the destination of a movement vector.
    IF (LinPosB.x < Rct_Rt AND LinPosB.x >= RctPos.x AND LinPosB.y < Rct_Bm AND LinPosB.y >= RctPos.y) THEN EXITFUNCTION 1
    //==============================================================================================================================================================================
    // Is PointA in Rectangle?
    IF (LinPosA.x < Rct_Rt AND LinPosA.x >= RctPos.x AND LinPosA.y < Rct_Bm AND LinPosA.y >= RctPos.y) THEN EXITFUNCTION 1
    //==============================================================================================================================================================================
    // Are any of the 4 Rectangle lines colliding?
    Delta_1A_1B_X AS FLOAT : Delta_1A_1B_X = LinPosB.x - LinPosA.x
    Delta_1A_1B_Y AS FLOAT : Delta_1A_1B_Y = LinPosB.y - LinPosA.y
    Delta_2A_2B_X AS FLOAT
    Delta_2A_2B_Y AS FLOAT
    Delta_1A_2A_X AS FLOAT
    Delta_1A_2A_Y AS FLOAT
    //==============================================================================================================================================================================
    n1 AS FLOAT
    n2 AS FLOAT
    d AS FLOAT
    r AS FLOAT
    s AS FLOAT
    //==============================================================================================================================================================================
    Delta_2A_2B_X = Rct_Rt - RctPos.x
    Delta_2A_2B_Y = RctPos.y     - RctPos.y
    Delta_1A_2A_X = LinPosA.x - RctPos.x
    Delta_1A_2A_Y = LinPosA.y - RctPos.y
    n1 = (Delta_1A_2A_Y * Delta_1A_1B_X) - (Delta_1A_2A_X * Delta_1A_1B_Y)
    n2 = (Delta_1A_2A_Y * Delta_2A_2B_X) - (Delta_1A_2A_X * Delta_2A_2B_Y)
    d  = (Delta_1A_1B_X * Delta_2A_2B_Y) - (Delta_1A_1B_Y * Delta_2A_2B_X)
    r = n1 / d
    s = n2 / d
    IF (r >= 0.0 AND r <= 1.0) AND (s >= 0.0 AND s <= 1.0) THEN EXITFUNCTION 1
    //==============================================================================================================================================================================
    Delta_2A_2B_X = Rct_Rt  - Rct_Rt
    Delta_2A_2B_Y = Rct_Bm - RctPos.y
    Delta_1A_2A_X = LinPosA.x - Rct_Rt
    Delta_1A_2A_Y = LinPosA.y - RctPos.y
    n1 = (Delta_1A_2A_Y * Delta_1A_1B_X) - (Delta_1A_2A_X * Delta_1A_1B_Y)
    n2 = (Delta_1A_2A_Y * Delta_2A_2B_X) - (Delta_1A_2A_X * Delta_2A_2B_Y)
    d  = (Delta_1A_1B_X * Delta_2A_2B_Y) - (Delta_1A_1B_Y * Delta_2A_2B_X)
    r = n1 / d
    s = n2 / d
    IF (r >= 0.0 AND r <= 1.0) AND (s >= 0.0 AND s <= 1.0) THEN EXITFUNCTION 1
    //==============================================================================================================================================================================
    Delta_2A_2B_X = RctPos.x      - Rct_Rt
    Delta_2A_2B_Y = Rct_Bm - Rct_Bm
    Delta_1A_2A_X = LinPosA.x - Rct_Rt
    Delta_1A_2A_Y = LinPosA.y - Rct_Bm
    n1 = (Delta_1A_2A_Y * Delta_1A_1B_X) - (Delta_1A_2A_X * Delta_1A_1B_Y)
    n2 = (Delta_1A_2A_Y * Delta_2A_2B_X) - (Delta_1A_2A_X * Delta_2A_2B_Y)
    d  = (Delta_1A_1B_X * Delta_2A_2B_Y) - (Delta_1A_1B_Y * Delta_2A_2B_X)
    r = n1 / d
    s = n2 / d
    IF (r >= 0.0 AND r <= 1.0) AND (s >= 0.0 AND s <= 1.0) THEN EXITFUNCTION 1
    //==============================================================================================================================================================================
    Delta_2A_2B_X = RctPos.x - RctPos.x
    Delta_2A_2B_Y = RctPos.y - Rct_Bm
    Delta_1A_2A_X = LinPosA.x - RctPos.x
    Delta_1A_2A_Y = LinPosA.y - Rct_Bm
    n1 = (Delta_1A_2A_Y * Delta_1A_1B_X) - (Delta_1A_2A_X * Delta_1A_1B_Y)
    n2 = (Delta_1A_2A_Y * Delta_2A_2B_X) - (Delta_1A_2A_X * Delta_2A_2B_Y)
    d  = (Delta_1A_1B_X * Delta_2A_2B_Y) - (Delta_1A_1B_Y * Delta_2A_2B_X)
    r = n1 / d
    s = n2 / d
    IF (r >= 0.0 AND r <= 1.0) AND (s >= 0.0 AND s <= 1.0) THEN EXITFUNCTION 1
    //==============================================================================================================================================================================
ENDFUNCTION 0


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  "Line VS Circle"
FUNCTION LineVsCircle( LinPosA AS Vec2,
                       LinPosB AS Vec2,
                       CirPos  AS Vec2,
                       CirRad  AS FLOAT )
    //==============================================================================================================================================================================
    Cir_Lf AS FLOAT : Cir_Lf = CirPos.x - CirRad
    Cir_Tp AS FLOAT : Cir_Tp = CirPos.y - CirRad
    Cir_Rt AS FLOAT : Cir_Rt = CirPos.x + CirRad
    Cir_Bm AS FLOAT : Cir_Bm = CirPos.y + CirRad
    //==============================================================================================================================================================================
    // Is Area-of-Line over Area-of-Circle?
    Lin_Lf AS FLOAT
    Lin_Rt AS FLOAT
    IF     (LinPosA.x <= LinPosB.x) : Lin_Lf = LinPosA.x : Lin_Rt = LinPosB.x
    ELSEIF (LinPosA.x >  LinPosB.x) : Lin_Lf = LinPosB.x : Lin_Rt = LinPosA.x
    ENDIF
    Lin_Tp AS FLOAT
    Lin_Bm AS FLOAT
    IF     (LinPosA.y <= LinPosB.y) : Lin_Tp = LinPosA.y : Lin_Bm = LinPosB.y
    ELSEIF (LinPosA.y >  LinPosB.y) : Lin_Tp = LinPosB.y : Lin_Bm = LinPosA.y
    ENDIF
    IF (Cir_Lf > Lin_Rt OR Cir_Tp > Lin_Bm OR Cir_Rt < Lin_Lf OR Cir_Bm < Lin_Tp) THEN EXITFUNCTION 0
    //==============================================================================================================================================================================
    CirRad_Sqrd AS FLOAT : CirRad_Sqrd = CirRad * CirRad
    //==============================================================================================================================================================================
    // Is PointB in Circle?                 Check PointB first, it's typically used as the destination of a movement vector.
    DeltaBC_X AS FLOAT : DeltaBC_X = CirPos.x - LinPosB.x
    DeltaBC_Y AS FLOAT : DeltaBC_Y = CirPos.y - LinPosB.y
    IF (DeltaBC_X*DeltaBC_X + DeltaBC_Y*DeltaBC_Y) < CirRad_Sqrd THEN EXITFUNCTION 1
    //==============================================================================================================================================================================
    // Is PointA in Circle?
    DeltaAC_X AS FLOAT : DeltaAC_X = CirPos.x - LinPosA.x
    DeltaAC_Y AS FLOAT : DeltaAC_Y = CirPos.y - LinPosA.y
    IF (DeltaAC_X*DeltaAC_X + DeltaAC_Y*DeltaAC_Y) < CirRad_Sqrd THEN EXITFUNCTION 1
    //==============================================================================================================================================================================
    // PointD = Point Projected on Line from CircleCenter.
    DeltaAB_X AS FLOAT : DeltaAB_X = LinPosB.x - LinPosA.x
    DeltaAB_Y AS FLOAT : DeltaAB_Y = LinPosB.y - LinPosA.y
    DeltaAD_L AS FLOAT : DeltaAD_L = (DeltaAC_X*DeltaAB_X + DeltaAC_Y*DeltaAB_Y) / (DeltaAB_X*DeltaAB_X + DeltaAB_Y*DeltaAB_Y)
    PointDX AS FLOAT : PointDX = LinPosA.x + DeltaAB_X * DeltaAD_L
    PointDY AS FLOAT : PointDY = LinPosA.y + DeltaAB_Y * DeltaAD_L
    //==============================================================================================================================================================================
    // Is PointD between PointA and PointB?
    IF (PointDX > Lin_Rt OR PointDY > Lin_Bm OR PointDX < Lin_Lf OR PointDY < Lin_Tp) THEN EXITFUNCTION 0
    //==============================================================================================================================================================================
    // Is PointD in Circle?
    DeltaDC_X AS FLOAT : DeltaDC_X = PointDX - CirPos.x
    DeltaDC_Y AS FLOAT : DeltaDC_Y = PointDY - CirPos.y
    IF (DeltaDC_X*DeltaDC_X + DeltaDC_Y*DeltaDC_Y) < CirRad_Sqrd THEN EXITFUNCTION 1
    //==============================================================================================================================================================================
ENDFUNCTION 0


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  "Point VS Axis-Aligned Right-Triangle"
////FUNCTION PointvsAART( RiseOrFall      AS INTEGER,  // Triangulation Direction
////                      Point_X         AS INTEGER,
////                      Point_Y         AS INTEGER,
////                      Triangle_X      AS INTEGER,  // X,Y = TopLeft
////                      Triangle_Y      AS INTEGER,  // X,Y = TopLeft
////                      Triangle_Width  AS INTEGER,  // Triangle Width
////                      Triangle_Height AS INTEGER ) // Triangle Height
////    //==============================================================================================================================================================================
////    // First check if Point is in Rectangle with PointvsAAR() before using this function, it will not work properly otherwise.
////
////    // do this internally ???
////    //      Might make sense to keep it external for this one.
////
////    // make which triangle you are testing for an argument?
////    // along with RiseOrFall ?
////
////    //==============================================================================================================================================================================
////    Point_X = Point_X - TriangleX // convert Point to local space
////    Point_Y = Point_Y - TriangleY // convert Point to local space
////    IF RiseOrFall = 0 // Rise
////        // ******
////        // *1  **
////        // *  * *
////        // * *  *
////        // **  2*
////        // ******
////        //Print( tWidth * Point_Y + tHeight * Point_X - tWidth * tHeight )
////        IF tWidth * Point_Y + tHeight * Point_X - tWidth * tHeight < 0
////            EXITFUNCTION 1
////        ELSE
////            EXITFUNCTION 2
////        ENDIF
////    ELSEIF RiseOrFall = 1 // Fall
////        // ******
////        // **  1*
////        // * *  *
////        // *  * *
////        // *2  **
////        // ******
////        //Print( tHeight * Point_X - tWidth * Point_Y )
////        IF tHeight * Point_X - tWidth * Point_Y > 0
////            EXITFUNCTION 1
////        ELSE
////            EXITFUNCTION 2
////        ENDIF
////    ENDIF
////ENDFUNCTION 0

