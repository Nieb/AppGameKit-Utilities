///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  Aar = "Axis-Aligned Rectangle"
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION PointVsAar( Pnt     AS Vec2,
                     Rct_Pos AS Vec2, Rct_Siz AS Vec2 )
ENDFUNCTION (Pnt.x < Rct_Pos.x+Rct_Siz.x AND Pnt.x >= Rct_Pos.x AND Pnt.y < Rct_Pos.y+Rct_Siz.y AND Pnt.y >= Rct_Pos.y)


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION AarVsAar( Rct1_Pos AS Vec2, Rct1_Siz AS Vec2,
                   Rct2_Pos AS Vec2, Rct2_Siz AS Vec2 )
ENDFUNCTION (Rct1_Pos.x < Rct2_Pos.x+Rct2_Siz.x AND Rct1_Pos.x+Rct1_Siz.x >= Rct2_Pos.x AND Rct1_Pos.y < Rct2_Pos.y+Rct2_Siz.y AND Rct1_Pos.y+Rct1_Siz.y >= Rct2_Pos.y)


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION PointVsCircle( Pnt     AS Vec2,
                        Cir_Pos AS Vec2, Cir_Rds AS FLOAT )
    Dlt_X AS FLOAT : Dlt_X = Pnt.x - Cir_Pos.x
    Dlt_Y AS FLOAT : Dlt_Y = Pnt.y - Cir_Pos.y
ENDFUNCTION (Dlt_X*Dlt_X + Dlt_Y*Dlt_Y < Cir_Rds*Cir_Rds)


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION CircleVsCircle( Cir1_Pos AS Vec2, Cir1_Rds AS FLOAT,
                         Cir2_Pos AS Vec2, Cir2_Rds AS FLOAT )
    Dlt_X AS FLOAT : Dlt_X = Cir1_Pos.x - Cir2_Pos.x
    Dlt_Y AS FLOAT : Dlt_Y = Cir1_Pos.y - Cir2_Pos.y
ENDFUNCTION ((Dlt_X*Dlt_X + Dlt_Y*Dlt_Y) < (Cir1_Rds*Cir1_Rds + Cir2_Rds*Cir2_Rds))


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION CircleVsAar( Cir_Pos AS Vec2, Cir_Rds AS FLOAT,
                      Rct_Pos AS Vec2, Rct_Siz AS Vec2 )
    //=====================================================================================================================================
    Cir_Lf AS FLOAT : Cir_Lf = Cir_Pos.x - Cir_Rds // "Circle-Left"
    Cir_Rt AS FLOAT : Cir_Rt = Cir_Pos.x + Cir_Rds // "Circle-Right"
    Cir_Bm AS FLOAT : Cir_Bm = Cir_Pos.y - Cir_Rds // "Circle-Bottom"                   2D Y is inverted in AGK.
    Cir_Tp AS FLOAT : Cir_Tp = Cir_Pos.y + Cir_Rds // "Circle-Top"
    //=====================================================================================================================================
    Rct_Rt AS FLOAT : Rct_Rt = Rct_Pos.x + Rct_Siz.x // "Rectangle-Right"
    Rct_Tp AS FLOAT : Rct_Tp = Rct_Pos.y + Rct_Siz.y // "Rectangle-Top"                 2D Y is inverted in AGK.
    //=====================================================================================================================================
    IF (Cir_Lf > Rct_Rt OR Cir_Bm > Rct_Tp OR Cir_Rt < Rct_Pos.x OR Cir_Tp < Rct_Pos.y) THEN EXITFUNCTION 0
    //=====================================================================================================================================
    IF     (Cir_Pos.y >= Rct_Pos.y AND Cir_Pos.y < Rct_Tp) : IF (Cir_Lf < Rct_Rt AND Cir_Rt > Rct_Pos.x) THEN EXITFUNCTION 1
    ELSEIF (Cir_Pos.x >= Rct_Pos.x AND Cir_Pos.x < Rct_Rt) : IF (Cir_Bm < Rct_Tp AND Cir_Tp > Rct_Pos.y) THEN EXITFUNCTION 1
    ENDIF
    //=====================================================================================================================================
    Dlt_X AS FLOAT
    IF     (Cir_Pos.x < Rct_Pos.x) : Dlt_X = Cir_Pos.x - Rct_Pos.x
    ELSEIF (Cir_Pos.x > Rct_Rt   ) : Dlt_X = Cir_Pos.x - Rct_Rt
    ENDIF
    Dlt_Y AS FLOAT
    IF     (Cir_Pos.y < Rct_Pos.y) : Dlt_Y = Cir_Pos.y - Rct_Pos.y
    ELSEIF (Cir_Pos.y > Rct_Tp   ) : Dlt_Y = Cir_Pos.y - Rct_Tp
    ENDIF
    IF (Dlt_X*Dlt_X + Dlt_Y*Dlt_Y <= Cir_Rds*Cir_Rds) THEN EXITFUNCTION 1
    //=====================================================================================================================================
ENDFUNCTION 0


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION WhichSideOfLine( Pnt  REF AS Vec2,
                          LinA REF AS Vec2, LinB REF AS Vec2 )
    Determinant AS FLOAT : Determinant = (Pnt.x-LinA.x)*(LinB.y-LinA.y) - (Pnt.y-LinA.y)*(LinB.x-LinA.x) // cross(DeltaAP, DeltaAB)
    //         P           1
    //
    //  A──────P──────B    0
    //
    //         P          -1
ENDFUNCTION 0+(Determinant > 0.0)-(Determinant < 0.0)


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION PointVsLine( Pnt  AS Vec2,
                      LinA AS Vec2, LinB AS Vec2,
                      Tolerance AS FLOAT )
    //IF (Pnt.x = LinA.x AND Pnt.y = LinA.y) THEN EXITFUNCTION 1  The occurrence of these is so rare that it is not worth checking for.
    //IF (Pnt.x = LinB.x AND Pnt.y = LinB.y) THEN EXITFUNCTION 1

    DltAP_X AS FLOAT : DltAP_X =  Pnt.x - LinA.x
    DltAP_Y AS FLOAT : DltAP_Y =  Pnt.y - LinA.y

    DltAB_X AS FLOAT : DltAB_X = LinB.x - LinA.x
    DltAB_Y AS FLOAT : DltAB_Y = LinB.y - LinA.y

    DotAP_AB AS FLOAT : DotAP_AB = (DltAP_X * DltAB_X) + (DltAP_Y * DltAB_Y)
    DotAB_AB AS FLOAT : DotAB_AB = (DltAB_X * DltAB_X) + (DltAB_Y * DltAB_Y)

    // Get distance to NearestPointOnLine, from LinA as multiple of DltAB:
    DltAB_Scalar AS FLOAT : DltAB_Scalar = DotAP_AB / DotAB_AB

    // Is ProjectedPoint going to be between A and B:
    IF (DltAB_Scalar < 0.0 OR DltAB_Scalar >= 1.0) THEN EXITFUNCTION 0 // -1

    // Project 'Pnt' onto Line:
    PrjPnt_X AS FLOAT : PrjPnt_X = DltAB_X * DltAB_Scalar
    PrjPnt_Y AS FLOAT : PrjPnt_Y = DltAB_Y * DltAB_Scalar

    // Distance between 'Pnt' and 'PrjPnt':
    DltPPP_X AS FLOAT : DltPPP_X = DltAP_X - PrjPnt_X
    DltPPP_Y AS FLOAT : DltPPP_Y = DltAP_Y - PrjPnt_Y

ENDFUNCTION (DltPPP_X*DltPPP_X + DltPPP_Y*DltPPP_Y < Tolerance*Tolerance)


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION PointVsLine1( Pnt  REF AS Vec2,
                       LinA REF AS Vec2, LinB REF AS Vec2,
                       Tolerance AS FLOAT )
    DltPA_X AS FLOAT : DltPA_X = LinA.x - Pnt.x
    DltPA_Y AS FLOAT : DltPA_Y = LinA.y - Pnt.y

    DltPB_X AS FLOAT : DltPB_X = LinB.x - Pnt.x
    DltPB_Y AS FLOAT : DltPB_Y = LinB.y - Pnt.y

    APB_Len AS FLOAT : APB_Len = sqrt(DltPA_X*DltPA_X + DltPA_Y*DltPA_Y) + sqrt(DltPB_X*DltPB_X + DltPB_Y*DltPB_Y)   //@@  SQRTs can likely be optimized out.

    DltAB_X AS FLOAT : DltAB_X = LinB.x - LinA.x
    DltAB_Y AS FLOAT : DltAB_Y = LinB.y - LinA.y

    AB_Len  AS FLOAT : AB_Len  = sqrt(DltAB_X*DltAB_X + DltAB_Y*DltAB_Y)    //@@  SQRT can likely be optimized out.

ENDFUNCTION (APB_Len < AB_Len + Tolerance) && (APB_Len > AB_Len - Tolerance)


FUNCTION PointVsLine2( Pnt  AS Vec2,
                       LinA AS Vec2, LinB AS Vec2,
                       Tolerance AS FLOAT)
    DltAB_X AS FLOAT : DltAB_X = LinB.x - LinA.x
    DltAB_Y AS FLOAT : DltAB_Y = LinB.y - LinA.y
    LenAB   AS FLOAT : LenAB = DltAB_X*DltAB_X + DltAB_Y*DltAB_Y

    DltPA_X AS FLOAT : DltPA_X = LinA.x - Pnt.x
    DltPA_Y AS FLOAT : DltPA_Y = LinA.y - Pnt.y
    LenPA AS FLOAT : LenPA = DltPA_X*DltPA_X + DltPA_Y*DltPA_Y
    IF LenPA > LenAB THEN EXITFUNCTION 0

    DltPB_X AS FLOAT : DltPB_X = LinB.x - Pnt.x
    DltPB_Y AS FLOAT : DltPB_Y = LinB.y - Pnt.y
    LenPB   AS FLOAT : LenPB = DltPB_X*DltPB_X + DltPB_Y*DltPB_Y
    IF LenPB > LenAB THEN EXITFUNCTION 0

    LenAB = 1.0 / sqrt(LenAB)   //@@ SQRT can likely be optimized out.

    Dtrmnt AS FLOAT
    Dtrmnt = DltPB_X*DltPA_Y - DltPA_X*DltPB_Y
    Dtrmnt = Dtrmnt*LenAB
ENDFUNCTION (Dtrmnt > -Tolerance) && (Dtrmnt < Tolerance)


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION LineVsLine( Lin1A REF AS Vec2, Lin1B REF AS Vec2,  //  Parallel overlapping Lines will not test positive as a collision.
                     Lin2A REF AS Vec2, Lin2B REF AS Vec2 )
    //=====================================================================================================================================
    Dlt_Lin1_X   AS FLOAT : Dlt_Lin1_X   = Lin1B.x - Lin1A.x //  Line1 in LocalSpace.   A = (0,0)  B = (#,#)
    Dlt_Lin1_Y   AS FLOAT : Dlt_Lin1_Y   = Lin1B.y - Lin1A.y
    Dlt_Lin2_X   AS FLOAT : Dlt_Lin2_X   = Lin2B.x - Lin2A.x //  Line2 in LocalSpace.   A = (0,0)  B = (#,#)
    Dlt_Lin2_Y   AS FLOAT : Dlt_Lin2_Y   = Lin2B.y - Lin2A.y
    Dlt_LinPos_X AS FLOAT : Dlt_LinPos_X = Lin1A.x - Lin2A.x
    Dlt_LinPos_Y AS FLOAT : Dlt_LinPos_Y = Lin1A.y - Lin2A.y
    //=====================================================================================================================================
    n1 AS FLOAT : n1 = Dlt_Lin1_X*Dlt_LinPos_Y - Dlt_Lin1_Y*Dlt_LinPos_X //  Dlt_Lin1  cross  Dlt_LinPos
    n2 AS FLOAT : n2 = Dlt_Lin2_X*Dlt_LinPos_Y - Dlt_Lin2_Y*Dlt_LinPos_X //  Dlt_Lin2  cross  Dlt_LinPos
    d  AS FLOAT : d  = Dlt_Lin1_X*Dlt_Lin2_Y   - Dlt_Lin1_Y*Dlt_Lin2_X   //  Dlt_Lin1  cross  Dlt_Lin2
    r  AS FLOAT : r  = n1 / d     //@@  DivByZero possible?
    //@@  EarlyOut?
    s  AS FLOAT : s  = n2 / d
    //=====================================================================================================================================
ENDFUNCTION (r >= 0.0 && r <= 1.0) && (s >= 0.0 && s <= 1.0)


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION LineVsAar( LinA    REF AS Vec2, LinB    REF AS Vec2,
                    Rct_Pos REF AS Vec2, Rct_Siz REF AS Vec2 )  // Pos = BottomLeft     Siz = (Width, Height)
    //=====================================================================================================================================
    Rct_Rt AS FLOAT : Rct_Rt = Rct_Pos.x + Rct_Siz.x
    Rct_Bm AS FLOAT : Rct_Bm = Rct_Pos.y + Rct_Siz.y
    //=====================================================================================================================================
    // Is Area-of-Line over Area-of-Rectangle?
    Lin_Lf AS FLOAT
    Lin_Rt AS FLOAT
    IF     (LinA.x <= LinB.x) : Lin_Lf = LinA.x : Lin_Rt = LinB.x
    ELSEIF (LinA.x >  LinB.x) : Lin_Lf = LinB.x : Lin_Rt = LinA.x
    ENDIF
    Lin_Bm AS FLOAT
    Lin_Tp AS FLOAT
    IF     (LinA.y <= LinB.y) : Lin_Bm = LinB.y : Lin_Tp = LinA.y
    ELSEIF (LinA.y >  LinB.y) : Lin_Bm = LinA.y : Lin_Tp = LinB.y
    ENDIF
    IF Rct_Pos.x >= Lin_Rt OR Rct_Pos.y >= Lin_Bm OR Rct_Rt < Lin_Lf OR Rct_Bm < Lin_Tp THEN EXITFUNCTION 0
    //=====================================================================================================================================
    // Is PointB in Rectangle?
    // Check PointB first, it's typically used as the destination of a movement vector.
    IF (LinB.x < Rct_Rt AND LinB.x >= Rct_Pos.x AND LinB.y < Rct_Bm AND LinB.y >= Rct_Pos.y) THEN EXITFUNCTION 1
    //=====================================================================================================================================
    // Is PointA in Rectangle?
    IF (LinA.x < Rct_Rt AND LinA.x >= Rct_Pos.x AND LinA.y < Rct_Bm AND LinA.y >= Rct_Pos.y) THEN EXITFUNCTION 1
    //=====================================================================================================================================
    // Are any of the 4 Rectangle-Lines colliding with the Line?
    Delta_1A_1B_X AS FLOAT : Delta_1A_1B_X = LinB.x - LinA.x
    Delta_1A_1B_Y AS FLOAT : Delta_1A_1B_Y = LinB.y - LinA.y
    Delta_2A_2B_X AS FLOAT
    Delta_2A_2B_Y AS FLOAT
    Delta_1A_2A_X AS FLOAT
    Delta_1A_2A_Y AS FLOAT
    //=====================================================================================================================================
    n1 AS FLOAT
    n2 AS FLOAT
    d  AS FLOAT
    r  AS FLOAT
    s  AS FLOAT
    //=====================================================================================================================================
    Delta_2A_2B_X = Rct_Rt     - Rct_Pos.x
    Delta_2A_2B_Y = Rct_Pos.y  - Rct_Pos.y
    Delta_1A_2A_X = LinA.x - Rct_Pos.x
    Delta_1A_2A_Y = LinA.y - Rct_Pos.y
    n1 = (Delta_1A_2A_Y * Delta_1A_1B_X) - (Delta_1A_2A_X * Delta_1A_1B_Y)
    n2 = (Delta_1A_2A_Y * Delta_2A_2B_X) - (Delta_1A_2A_X * Delta_2A_2B_Y)
    d  = (Delta_1A_1B_X * Delta_2A_2B_Y) - (Delta_1A_1B_Y * Delta_2A_2B_X)
    r  = n1 / d
    s  = n2 / d
    IF (r >= 0.0 AND r <= 1.0) AND (s >= 0.0 AND s <= 1.0) THEN EXITFUNCTION 1
    //=====================================================================================================================================
    Delta_2A_2B_X = Rct_Rt     - Rct_Rt
    Delta_2A_2B_Y = Rct_Bm     - Rct_Pos.y
    Delta_1A_2A_X = LinA.x - Rct_Rt
    Delta_1A_2A_Y = LinA.y - Rct_Pos.y
    n1 = (Delta_1A_2A_Y * Delta_1A_1B_X) - (Delta_1A_2A_X * Delta_1A_1B_Y)
    n2 = (Delta_1A_2A_Y * Delta_2A_2B_X) - (Delta_1A_2A_X * Delta_2A_2B_Y)
    d  = (Delta_1A_1B_X * Delta_2A_2B_Y) - (Delta_1A_1B_Y * Delta_2A_2B_X)
    r  = n1 / d
    s  = n2 / d
    IF (r >= 0.0 AND r <= 1.0) AND (s >= 0.0 AND s <= 1.0) THEN EXITFUNCTION 1
    //=====================================================================================================================================
    Delta_2A_2B_X = Rct_Pos.x  - Rct_Rt
    Delta_2A_2B_Y = Rct_Bm     - Rct_Bm
    Delta_1A_2A_X = LinA.x - Rct_Rt
    Delta_1A_2A_Y = LinA.y - Rct_Bm
    n1 = (Delta_1A_2A_Y * Delta_1A_1B_X) - (Delta_1A_2A_X * Delta_1A_1B_Y)
    n2 = (Delta_1A_2A_Y * Delta_2A_2B_X) - (Delta_1A_2A_X * Delta_2A_2B_Y)
    d  = (Delta_1A_1B_X * Delta_2A_2B_Y) - (Delta_1A_1B_Y * Delta_2A_2B_X)
    r  = n1 / d
    s  = n2 / d
    IF (r >= 0.0 AND r <= 1.0) AND (s >= 0.0 AND s <= 1.0) THEN EXITFUNCTION 1
    //=====================================================================================================================================
    // The function will never make it here.
    //Delta_2A_2B_X = Rct_Pos.x  - Rct_Pos.x
    //Delta_2A_2B_Y = Rct_Pos.y  - Rct_Bm
    //Delta_1A_2A_X = LinA.x - Rct_Pos.x
    //Delta_1A_2A_Y = LinA.y - Rct_Bm
    //n1 = (Delta_1A_2A_Y * Delta_1A_1B_X) - (Delta_1A_2A_X * Delta_1A_1B_Y)
    //n2 = (Delta_1A_2A_Y * Delta_2A_2B_X) - (Delta_1A_2A_X * Delta_2A_2B_Y)
    //d  = (Delta_1A_1B_X * Delta_2A_2B_Y) - (Delta_1A_1B_Y * Delta_2A_2B_X)
    //r  = n1 / d
    //s  = n2 / d
    //IF (r >= 0.0 AND r <= 1.0) AND (s >= 0.0 AND s <= 1.0) THEN EXITFUNCTION 1
    //=====================================================================================================================================
ENDFUNCTION 0


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION LineVsCircle( LinA    AS Vec2, LinB    AS Vec2,
                       Cir_Pos AS Vec2, Cir_Rds AS FLOAT )
    //=====================================================================================================================================
    Cir_Lf AS FLOAT : Cir_Lf = Cir_Pos.x - Cir_Rds
    Cir_Tp AS FLOAT : Cir_Tp = Cir_Pos.y - Cir_Rds
    Cir_Rt AS FLOAT : Cir_Rt = Cir_Pos.x + Cir_Rds
    Cir_Bm AS FLOAT : Cir_Bm = Cir_Pos.y + Cir_Rds
    //=====================================================================================================================================
    // Is Area-of-Line over Area-of-Circle?
    Lin_Lf AS FLOAT
    Lin_Rt AS FLOAT
    IF     (LinA.x <= LinB.x) : Lin_Lf = LinA.x : Lin_Rt = LinB.x
    ELSEIF (LinA.x >  LinB.x) : Lin_Lf = LinB.x : Lin_Rt = LinA.x
    ENDIF
    Lin_Tp AS FLOAT
    Lin_Bm AS FLOAT
    IF     (LinA.y <= LinB.y) : Lin_Tp = LinA.y : Lin_Bm = LinB.y
    ELSEIF (LinA.y >  LinB.y) : Lin_Tp = LinB.y : Lin_Bm = LinA.y
    ENDIF
    IF (Cir_Lf > Lin_Rt OR Cir_Tp > Lin_Bm OR Cir_Rt < Lin_Lf OR Cir_Bm < Lin_Tp) THEN EXITFUNCTION 0
    //=====================================================================================================================================
    CirRds_Sqrd AS FLOAT : CirRds_Sqrd = Cir_Rds*Cir_Rds
    //=====================================================================================================================================
    // Is PointB in Circle?                                Check PointB first, it's typically used as the destination of a movement vector.
    DeltaBC_X AS FLOAT : DeltaBC_X = Cir_Pos.x - LinB.x
    DeltaBC_Y AS FLOAT : DeltaBC_Y = Cir_Pos.y - LinB.y
    IF (DeltaBC_X*DeltaBC_X + DeltaBC_Y*DeltaBC_Y) < CirRds_Sqrd THEN EXITFUNCTION 1
    //=====================================================================================================================================
    // Is PointA in Circle?
    DeltaAC_X AS FLOAT : DeltaAC_X = Cir_Pos.x - LinA.x
    DeltaAC_Y AS FLOAT : DeltaAC_Y = Cir_Pos.y - LinA.y
    IF (DeltaAC_X*DeltaAC_X + DeltaAC_Y*DeltaAC_Y) < CirRds_Sqrd THEN EXITFUNCTION 1
    //=====================================================================================================================================
    // PointD = CircleCenter projected on to Line.
    DeltaAB_X AS FLOAT : DeltaAB_X = LinB.x - LinA.x
    DeltaAB_Y AS FLOAT : DeltaAB_Y = LinB.y - LinA.y
    DeltaAD_L AS FLOAT : DeltaAD_L = (DeltaAC_X*DeltaAB_X + DeltaAC_Y*DeltaAB_Y) / (DeltaAB_X*DeltaAB_X + DeltaAB_Y*DeltaAB_Y)
    PntD_X    AS FLOAT : PntD_X = LinA.x + DeltaAB_X * DeltaAD_L
    PntD_Y    AS FLOAT : PntD_Y = LinA.y + DeltaAB_Y * DeltaAD_L
    //=====================================================================================================================================
    // Is PntD between PointA and PointB?
    IF (PntD_X > Lin_Rt OR PntD_Y > Lin_Bm OR PntD_X < Lin_Lf OR PntD_Y < Lin_Tp) THEN EXITFUNCTION 0
    //=====================================================================================================================================
    // Is PntD in Circle?
    DeltaDC_X AS FLOAT : DeltaDC_X = PntD_X - Cir_Pos.x
    DeltaDC_Y AS FLOAT : DeltaDC_Y = PntD_Y - Cir_Pos.y
    IF (DeltaDC_X*DeltaDC_X + DeltaDC_Y*DeltaDC_Y) < CirRds_Sqrd THEN EXITFUNCTION 1
    //=====================================================================================================================================
ENDFUNCTION 0


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION PointVsTriangle( Pnt  AS Vec2,
                          TriA AS Vec2,  //  Triangle winding is Anti-Clockwise.
                          TriB AS Vec2,
                          TriC AS Vec2 )
    DltPA_X AS FLOAT : DltPA_X = TriA.x - Pnt.x // "Delta"
    DltPA_Y AS FLOAT : DltPA_Y = TriA.y - Pnt.y
    DltPB_X AS FLOAT : DltPB_X = TriB.x - Pnt.x
    DltPB_Y AS FLOAT : DltPB_Y = TriB.y - Pnt.y
    DltPC_X AS FLOAT : DltPC_X = TriC.x - Pnt.x
    DltPC_Y AS FLOAT : DltPC_Y = TriC.y - Pnt.y
ENDFUNCTION (DltPA_X*DltPC_Y <= DltPC_X*DltPA_Y) && (DltPB_X*DltPA_Y <= DltPA_X*DltPB_Y) && (DltPC_X*DltPB_Y <= DltPB_X*DltPC_Y)

