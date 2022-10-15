////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  "Point VS Axis-Aligned Rectangle"
FUNCTION PointVsAar( Pnt_Pos REF AS Vec2,
                     Rct_Pos REF AS Vec2,  // TopLeft.
                     Rct_Siz REF AS Vec2 ) // Width, Height.
    IF (Pnt_Pos.x < Rct_Pos.x+Rct_Siz.x AND Pnt_Pos.x >= Rct_Pos.x AND Pnt_Pos.y < Rct_Pos.y+Rct_Siz.y AND Pnt_Pos.y >= Rct_Pos.y) THEN EXITFUNCTION 1
ENDFUNCTION 0


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  "Axis-Aligned Rectangle VS Axis-Aligned Rectangle"
FUNCTION AarVsAar( Rect1_Pos REF AS Vec2,  // TopLeft.
                   Rect1_Siz REF AS Vec2,  // Width, Height.
                   Rect2_Pos REF AS Vec2,  // TopLeft.
                   Rect2_Siz REF AS Vec2 ) // Width, Height.
    IF (Rect1_Pos.x < Rect2_Pos.x+Rect2_Siz.x AND Rect1_Pos.x+Rect1_Siz.x >= Rect2_Pos.x AND Rect1_Pos.y < Rect2_Pos.y+Rect2_Siz.y AND Rect1_Pos.y+Rect1_Siz.y >= Rect2_Pos.y) THEN EXITFUNCTION 1
ENDFUNCTION 0


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  "Point VS Circle"
FUNCTION PointVsCircle( Pnt_Pos REF AS Vec2,
                        Cir_Pos REF AS Vec2,
                        Cir_Rds AS FLOAT )
    //==============================================================================================================================================================================
    Delta_X AS FLOAT : Delta_X = Pnt_Pos.x - Cir_Pos.x
    Delta_Y AS FLOAT : Delta_Y = Pnt_Pos.y - Cir_Pos.y
    IF (Delta_X*Delta_X + Delta_Y*Delta_Y < Cir_Rds*Cir_Rds) THEN EXITFUNCTION 1
    //==============================================================================================================================================================================
ENDFUNCTION 0


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  "Circle VS Circle"
FUNCTION CircleVsCircle( Cir1_Pos REF AS Vec2,
                         Cir1_Rds AS FLOAT,
                         Cir2_Pos REF AS Vec2,
                         Cir2_Rds AS FLOAT )
    //==============================================================================================================================================================================
    Delta_X AS FLOAT : Delta_X = Cir1_Pos.x - Cir2_Pos.x
    Delta_Y AS FLOAT : Delta_Y = Cir1_Pos.y - Cir2_Pos.y
    IF (sqrt(Delta_X*Delta_X + Delta_Y*Delta_Y) < Cir1_Rds + Cir2_Rds) THEN EXITFUNCTION 1
    //==============================================================================================================================================================================
ENDFUNCTION 0


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  "Circle VS Axis-Aligned Rectangle"
FUNCTION CircleVsAar( Cir_Pos REF AS Vec2,
                      Cir_Rds AS FLOAT,
                      Rct_Pos REF AS Vec2,  // TopLeft.
                      Rct_Siz REF AS Vec2 ) // Width, Height.
    //==============================================================================================================================================================================
    Cir_Lf AS FLOAT : Cir_Lf = Cir_Pos.x - Cir_Rds // "Circle-Left"
    Cir_Tp AS FLOAT : Cir_Tp = Cir_Pos.y - Cir_Rds // "Circle-Top"
    Cir_Rt AS FLOAT : Cir_Rt = Cir_Pos.x + Cir_Rds // "Circle-Right"
    Cir_Bm AS FLOAT : Cir_Bm = Cir_Pos.y + Cir_Rds // "Circle-Bottom"
    //==============================================================================================================================================================================
    Rct_Rt AS FLOAT : Rct_Rt = Rct_Pos.x + Rct_Siz.x // "Rectangle-Right"
    Rct_Bm AS FLOAT : Rct_Bm = Rct_Pos.y + Rct_Siz.y // "Rectangle-Bottom"
    //==============================================================================================================================================================================
    IF (Cir_Lf > Rct_Rt OR Cir_Tp > Rct_Bm OR Cir_Rt < Rct_Pos.x OR Cir_Bm < Rct_Pos.y) THEN EXITFUNCTION 0
    //==============================================================================================================================================================================
    IF     (Cir_Pos.y >= Rct_Pos.y AND Cir_Pos.y < Rct_Bm) : IF (Cir_Lf < Rct_Rt AND Cir_Rt > Rct_Pos.x) THEN EXITFUNCTION 1
    ELSEIF (Cir_Pos.x >= Rct_Pos.x AND Cir_Pos.x < Rct_Rt) : IF (Cir_Tp < Rct_Bm AND Cir_Bm > Rct_Pos.y) THEN EXITFUNCTION 1
    ENDIF
    //==============================================================================================================================================================================
    Delta_X AS FLOAT
    IF     (Cir_Pos.x < Rct_Pos.x) : Delta_X = Cir_Pos.x - Rct_Pos.x
    ELSEIF (Cir_Pos.x > Rct_Rt   ) : Delta_X = Cir_Pos.x - Rct_Rt
    ENDIF
    Delta_Y AS FLOAT
    IF     (Cir_Pos.y < Rct_Pos.y) : Delta_Y = Cir_Pos.y - Rct_Pos.y
    ELSEIF (Cir_Pos.y > Rct_Bm   ) : Delta_Y = Cir_Pos.y - Rct_Bm
    ENDIF
    IF (Delta_X*Delta_X + Delta_Y*Delta_Y <= Cir_Rds*Cir_Rds) THEN EXITFUNCTION 1
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
FUNCTION PointVsLine( Pnt_Pos   REF AS Vec2,
                      Lin_PosA  REF AS Vec2,
                      Lin_PosB  REF AS Vec2,
                      Tolerance AS FLOAT )

    DeltaPA_X AS FLOAT : DeltaPA_X = Lin_PosA.x - Pnt_Pos.x
    DeltaPA_Y AS FLOAT : DeltaPA_Y = Lin_PosA.y - Pnt_Pos.y
    DeltaPB_X AS FLOAT : DeltaPB_X = Lin_PosB.x - Pnt_Pos.x
    DeltaPB_Y AS FLOAT : DeltaPB_Y = Lin_PosB.y - Pnt_Pos.y
    Pnt_Len   AS FLOAT : Pnt_Len   = sqrt(DeltaPA_X*DeltaPA_X + DeltaPA_Y*DeltaPA_Y) + sqrt(DeltaPB_X*DeltaPB_X + DeltaPB_Y*DeltaPB_Y)

    DeltaAB_X AS FLOAT : DeltaAB_X = Lin_PosB.x - Lin_PosA.x
    DeltaAB_Y AS FLOAT : DeltaAB_Y = Lin_PosB.y - Lin_PosA.y
    Lin_Len   AS FLOAT : Lin_Len   = sqrt(DeltaAB_X*DeltaAB_X + DeltaAB_Y*DeltaAB_Y)

    IF (Pnt_Len < Lin_Len + Tolerance AND Pnt_Len > Lin_Len - Tolerance) THEN EXITFUNCTION 1

ENDFUNCTION 0


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  "Line VS Line"
FUNCTION LineVsLine( Lin1_PosA REF AS Vec2,  // Overlapping parallel Lines will not test positive as a collision.
                     Lin1_PosB REF AS Vec2,
                     Lin2_PosA REF AS Vec2,
                     Lin2_PosB REF AS Vec2 )
    //==============================================================================================================================================================================
    Line1_Delta_X AS FLOAT : Line1_Delta_X = Lin1_PosB.x - Lin1_PosA.x // Line1 in LocalSpace.   A = (0,0)  B = (#,#)
    Line1_Delta_Y AS FLOAT : Line1_Delta_Y = Lin1_PosB.y - Lin1_PosA.y

    Line2_Delta_X AS FLOAT : Line2_Delta_X = Lin2_PosB.x - Lin2_PosA.x // Line2 in LocalSpace.   A = (0,0)  B = (#,#)
    Line2_Delta_Y AS FLOAT : Line2_Delta_Y = Lin2_PosB.y - Lin2_PosA.y

    LinePos_Delta_X AS FLOAT : LinePos_Delta_X = Lin1_PosA.x - Lin2_PosA.x
    LinePos_Delta_Y AS FLOAT : LinePos_Delta_Y = Lin1_PosA.y - Lin2_PosA.y
    //==============================================================================================================================================================================
    n1 AS FLOAT : n1 = Line1_Delta_X*LinePos_Delta_Y - Line1_Delta_Y*LinePos_Delta_X // LineDelta1  cross  LinePosDelta
    n2 AS FLOAT : n2 = Line2_Delta_X*LinePos_Delta_Y - Line2_Delta_Y*LinePos_Delta_X // LineDelta2  cross  LinePosDelta
    d  AS FLOAT : d  = Line1_Delta_X*Line2_Delta_Y   - Line1_Delta_Y*Line2_Delta_X   // LineDelta1  cross  LineDelta2
    r AS FLOAT : r = n1 / d
    s AS FLOAT : s = n2 / d
    IF (r >= 0.0 AND r <= 1.0) AND (s >= 0.0 AND s <= 1.0) THEN EXITFUNCTION 1
    //==============================================================================================================================================================================
ENDFUNCTION 0


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  "Line VS Axis-Aligned Box"
FUNCTION LineVsAAB( LinPosA REF AS Vec2,
                    LinPosB REF AS Vec2,
                    Rct_Pos REF AS Vec2,  // TopLeft                      @FIX   Origin = Center
                    Rct_Siz REF AS Vec2 ) // Width, Height
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  "Line VS Axis-Aligned Rectangle"
FUNCTION LineVsAar( LinPosA REF AS Vec2,
                    LinPosB REF AS Vec2,
                    Rct_Pos REF AS Vec2,  // TopLeft,
                    Rct_Siz REF AS Vec2 ) // Width, Height,
    //==============================================================================================================================================================================
    Rct_Rt AS FLOAT : Rct_Rt = Rct_Pos.x + Rct_Siz.x
    Rct_Bm AS FLOAT : Rct_Bm = Rct_Pos.y + Rct_Siz.y
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
    IF Rct_Pos.x > Lin_Rt OR Rct_Pos.y > Lin_Bm OR Rct_Rt < Lin_Lf OR Rct_Bm < Lin_Tp THEN EXITFUNCTION 0
    //==============================================================================================================================================================================
    // Is PointB in Rectangle?
    // Check PointB first, it's typically used as the destination of a movement vector.
    IF (LinPosB.x < Rct_Rt AND LinPosB.x >= Rct_Pos.x AND LinPosB.y < Rct_Bm AND LinPosB.y >= Rct_Pos.y) THEN EXITFUNCTION 1
    //==============================================================================================================================================================================
    // Is PointA in Rectangle?
    IF (LinPosA.x < Rct_Rt AND LinPosA.x >= Rct_Pos.x AND LinPosA.y < Rct_Bm AND LinPosA.y >= Rct_Pos.y) THEN EXITFUNCTION 1
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
    d  AS FLOAT
    r  AS FLOAT
    s  AS FLOAT
    //==============================================================================================================================================================================
    Delta_2A_2B_X = Rct_Rt    - Rct_Pos.x
    Delta_2A_2B_Y = Rct_Pos.y - Rct_Pos.y
    Delta_1A_2A_X = LinPosA.x - Rct_Pos.x
    Delta_1A_2A_Y = LinPosA.y - Rct_Pos.y
    n1 = (Delta_1A_2A_Y * Delta_1A_1B_X) - (Delta_1A_2A_X * Delta_1A_1B_Y)
    n2 = (Delta_1A_2A_Y * Delta_2A_2B_X) - (Delta_1A_2A_X * Delta_2A_2B_Y)
    d  = (Delta_1A_1B_X * Delta_2A_2B_Y) - (Delta_1A_1B_Y * Delta_2A_2B_X)
    r = n1 / d
    s = n2 / d
    IF (r >= 0.0 AND r <= 1.0) AND (s >= 0.0 AND s <= 1.0) THEN EXITFUNCTION 1
    //==============================================================================================================================================================================
    Delta_2A_2B_X = Rct_Rt    - Rct_Rt
    Delta_2A_2B_Y = Rct_Bm    - Rct_Pos.y
    Delta_1A_2A_X = LinPosA.x - Rct_Rt
    Delta_1A_2A_Y = LinPosA.y - Rct_Pos.y
    n1 = (Delta_1A_2A_Y * Delta_1A_1B_X) - (Delta_1A_2A_X * Delta_1A_1B_Y)
    n2 = (Delta_1A_2A_Y * Delta_2A_2B_X) - (Delta_1A_2A_X * Delta_2A_2B_Y)
    d  = (Delta_1A_1B_X * Delta_2A_2B_Y) - (Delta_1A_1B_Y * Delta_2A_2B_X)
    r = n1 / d
    s = n2 / d
    IF (r >= 0.0 AND r <= 1.0) AND (s >= 0.0 AND s <= 1.0) THEN EXITFUNCTION 1
    //==============================================================================================================================================================================
    Delta_2A_2B_X = Rct_Pos.x - Rct_Rt
    Delta_2A_2B_Y = Rct_Bm    - Rct_Bm
    Delta_1A_2A_X = LinPosA.x - Rct_Rt
    Delta_1A_2A_Y = LinPosA.y - Rct_Bm
    n1 = (Delta_1A_2A_Y * Delta_1A_1B_X) - (Delta_1A_2A_X * Delta_1A_1B_Y)
    n2 = (Delta_1A_2A_Y * Delta_2A_2B_X) - (Delta_1A_2A_X * Delta_2A_2B_Y)
    d  = (Delta_1A_1B_X * Delta_2A_2B_Y) - (Delta_1A_1B_Y * Delta_2A_2B_X)
    r = n1 / d
    s = n2 / d
    IF (r >= 0.0 AND r <= 1.0) AND (s >= 0.0 AND s <= 1.0) THEN EXITFUNCTION 1
    //==============================================================================================================================================================================
    Delta_2A_2B_X = Rct_Pos.x - Rct_Pos.x
    Delta_2A_2B_Y = Rct_Pos.y - Rct_Bm
    Delta_1A_2A_X = LinPosA.x - Rct_Pos.x
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  "Line VS Circle"
FUNCTION LineVsCircle( LinPosA AS Vec2,
                       LinPosB AS Vec2,
                       Cir_Pos AS Vec2,
                       Cir_Rds AS FLOAT )
    //==============================================================================================================================================================================
    Cir_Lf AS FLOAT : Cir_Lf = Cir_Pos.x - Cir_Rds
    Cir_Tp AS FLOAT : Cir_Tp = Cir_Pos.y - Cir_Rds
    Cir_Rt AS FLOAT : Cir_Rt = Cir_Pos.x + Cir_Rds
    Cir_Bm AS FLOAT : Cir_Bm = Cir_Pos.y + Cir_Rds
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
    CirRds_Sqrd AS FLOAT : CirRds_Sqrd = Cir_Rds*Cir_Rds
    //==============================================================================================================================================================================
    // Is PointB in Circle?                 Check PointB first, it's typically used as the destination of a movement vector.
    DeltaBC_X AS FLOAT : DeltaBC_X = Cir_Pos.x - LinPosB.x
    DeltaBC_Y AS FLOAT : DeltaBC_Y = Cir_Pos.y - LinPosB.y
    IF (DeltaBC_X*DeltaBC_X + DeltaBC_Y*DeltaBC_Y) < CirRds_Sqrd THEN EXITFUNCTION 1
    //==============================================================================================================================================================================
    // Is PointA in Circle?
    DeltaAC_X AS FLOAT : DeltaAC_X = Cir_Pos.x - LinPosA.x
    DeltaAC_Y AS FLOAT : DeltaAC_Y = Cir_Pos.y - LinPosA.y
    IF (DeltaAC_X*DeltaAC_X + DeltaAC_Y*DeltaAC_Y) < CirRds_Sqrd THEN EXITFUNCTION 1
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
    DeltaDC_X AS FLOAT : DeltaDC_X = PointDX - Cir_Pos.x
    DeltaDC_Y AS FLOAT : DeltaDC_Y = PointDY - Cir_Pos.y
    IF (DeltaDC_X*DeltaDC_X + DeltaDC_Y*DeltaDC_Y) < CirRds_Sqrd THEN EXITFUNCTION 1
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
FUNCTION WhichSideOfLine(PntPos  REF AS Vec2,
                         LinPosA REF AS Vec2,
                         LinPosB REF AS Vec2 )

    Dtrmnt AS FLOAT : Dtrmnt = (PntPos.x-LinPosA.x)*(LinPosB.y-LinPosA.y)-(PntPos.y-LinPosA.y)*(LinPosB.x-LinPosA.x)

    //         I
    //
    //  A------J------B
    //
    //         K

    IF     Dtrmnt > 0.0 : EXITFUNCTION  1  // Example I
    ELSEIF Dtrmnt < 0.0 : EXITFUNCTION -1  // Example K
    ELSE                                   // Example J     Point is on Line.
    ENDIF
ENDFUNCTION 0


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  "Point VS Axis-Aligned Right-Triangle"
////FUNCTION PointVsAart( RiseOrFall      AS INTEGER,  // Triangulation Direction
////                      Point_X         AS INTEGER,
////                      Point_Y         AS INTEGER,
////                      Triangle_X      AS INTEGER,  // X,Y = TopLeft
////                      Triangle_Y      AS INTEGER,  // X,Y = TopLeft
////                      Triangle_Width  AS INTEGER,  // Triangle Width
////                      Triangle_Height AS INTEGER ) // Triangle Height
////    //==============================================================================================================================================================================
////    // First check if Point is in Rectangle with PointvsAar() before using this function, it will not work properly otherwise.
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


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION PointVsTriangle(Pnt_Pos AS Vec2,
                         Tri0_Pos AS Vec2,
                         Tri1_Pos AS Vec2,
                         Tri2_Pos AS Vec2 )

    // Translate Points to LocalSpace.
    L0_X AS FLOAT : L0_X = Tri2_Pos.x - Tri0_Pos.x
    L0_Y AS FLOAT : L0_Y = Tri2_Pos.y - Tri0_Pos.y

    L1_X AS FLOAT : L1_X = Tri1_Pos.x - Tri0_Pos.x
    L1_Y AS FLOAT : L1_Y = Tri1_Pos.y - Tri0_Pos.y

    L2_X AS FLOAT : L2_X =  Pnt_Pos.x - Tri0_Pos.x
    L2_Y AS FLOAT : L2_Y =  Pnt_Pos.y - Tri0_Pos.y

    // Dots...
    Dot00 AS FLOAT : Dot00 = L0_X * L0_X + L0_Y * L0_Y
    Dot01 AS FLOAT : Dot01 = L0_X * L1_X + L0_Y * L1_Y
    Dot02 AS FLOAT : Dot02 = L0_X * L2_X + L0_Y * L2_Y
    Dot11 AS FLOAT : Dot11 = L1_X * L1_X + L1_Y * L1_Y
    Dot12 AS FLOAT : Dot12 = L1_X * L2_X + L1_Y * L2_Y

    // Compute barycentric coordinates.
    DotDotRcp AS FLOAT : DotDotRcp = 1.0 / (dot00 * dot11 - dot01 * dot01)
    u AS FLOAT : u = (dot11 * dot02 - dot01 * dot12) * DotDotRcp
    v AS FLOAT : v = (dot00 * dot12 - dot01 * dot02) * DotDotRcp

    Print("    U = "+str(u))
    Print("    V = "+str(v))
    Print("  U+V = "+str(u + v))
    Print("")


    // Check if point is in triangle.
    IF (u >= 0) AND (v >= 0) AND (u + v < 1) THEN EXITFUNCTION 1

ENDFUNCTION 0

