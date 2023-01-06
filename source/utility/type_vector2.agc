///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
TYPE Vec2
    x AS FLOAT
    y AS FLOAT
ENDTYPE

TYPE iVec2
    x AS INTEGER
    y AS INTEGER
ENDTYPE


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION vec2(Flt_X AS FLOAT, Flt_Y AS FLOAT)
    Result AS Vec2
    Result.x = Flt_X
    Result.y = Flt_Y
ENDFUNCTION Result

FUNCTION ivec2(Int_X AS INTEGER, Int_Y AS INTEGER)
    Result AS iVec2
    Result.x = Int_X
    Result.y = Int_Y
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION InitializeVector2()
    // AGK does not support default values for UserTypes nor UserType Constants.
    GLOBAL Zero2    AS Vec2 : Zero2    = vec2(0.0, 0.0)
    GLOBAL Axis2_X  AS Vec2 : Axis2_X  = vec2(1.0, 0.0)
    GLOBAL Axis2_Y  AS Vec2 : Axis2_Y  = vec2(0.0, 1.0)
    GLOBAL Axis2_XY AS Vec2 : Axis2_XY = vec2(Sqrt2Rcp, Sqrt2Rcp)
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION Print2(Label AS STRING, PrintMe REF AS Vec2, PadLeft AS INTEGER, TruncRight AS INTEGER)
    Print(Label + padstr(PrintMe.x, PadLeft, TruncRight)+" "+padstr(PrintMe.y, PadLeft, TruncRight))
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION add2(VecA REF AS Vec2, VecB REF AS Vec2) // 'VecA' + 'VecB'
    Result AS Vec2
    Result.x = VecA.x + VecB.x
    Result.y = VecA.y + VecB.y
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION add2f(VecA REF AS Vec2, FltA AS FLOAT) // 'VecA' + 'Float'
    Result AS Vec2
    Result.x = VecA.x + FltA
    Result.y = VecA.y + FltA
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION sub2(VecA REF AS Vec2, VecB REF AS Vec2) // 'VecA' - 'VecB'
    Result AS Vec2
    Result.x = VecA.x - VecB.x
    Result.y = VecA.y - VecB.y
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION sub2f(VecA REF AS Vec2, FltA AS FLOAT) // 'VecA' - 'Float'
    Result AS Vec2
    Result.x = VecA.x - FltA
    Result.y = VecA.y - FltA
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION mul2(VecA REF AS Vec2, VecB REF AS Vec2) // 'VecA' * 'VecB'
    Result AS Vec2
    Result.x = VecA.x * VecB.x
    Result.y = VecA.y * VecB.y
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION mul2f(VecA REF AS Vec2, FltA AS FLOAT) // 'VecA' * 'Float'
    Result AS Vec2
    Result.x = VecA.x * FltA
    Result.y = VecA.y * FltA
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION div2(VecA REF AS Vec2, VecB REF AS Vec2) // 'VecA' / 'VecB'
    Result AS Vec2
    Result.x = VecA.x / VecB.x
    Result.y = VecA.y / VecB.y
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION div2f(VecA REF AS Vec2, FltA AS FLOAT) // 'VecA' / 'Float'
    Result AS Vec2
    Result.x = VecA.x / FltA
    Result.y = VecA.y / FltA
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION dot2(VecA REF AS Vec2, VecB REF AS Vec2) // 'VecA' "dot" 'VecB'
ENDFUNCTION VecA.x*VecB.x + VecA.y*VecB.y         //  How much does B overlap with A.


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION crs2(VecA REF AS Vec2, VecB REF AS Vec2) // 'VecA' "cross" 'VecB'
ENDFUNCTION VecA.x*VecB.y - VecA.y*VecB.x         //  How much does B 'cross' with A.


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION inv2(VecA REF AS Vec2) // "Invert"      (Additive Inverse) of 'VecA'.
    Result AS Vec2
    Result.x = -VecA.x
    Result.y = -VecA.y
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION cmp2(VecA REF AS Vec2) // "Complement"  (Complimentary Inverse) of 'VecA'.
    Result AS Vec2
    Result.x = 1.0 - VecA.x
    Result.y = 1.0 - VecA.y
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION rcp2(VecA REF AS Vec2) // "Reciprocal"  (Multiplicative Inverse) of 'VecA'.
    Result AS Vec2
    Result.x = 1.0 / VecA.x
    Result.y = 1.0 / VecA.y
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION len2(VecA REF AS Vec2) // "Length" of 'VecA'.
    Result AS FLOAT : Result = sqrt(VecA.x*VecA.x + VecA.y*VecA.y)
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION dst2(VecA REF AS Vec2, VecB REF AS Vec2) // "Distance" between 'VecA' and 'VecB'.
    DltX   AS FLOAT : DltX   = VecB.x-VecA.x
    DltY   AS FLOAT : DltY   = VecB.y-VecA.y
    Result AS FLOAT : Result = sqrt(DltX*DltX + DltY*DltY)
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION lenthn2(VecA REF AS Vec2, LengthNew AS FLOAT) // "Lengthen"  'VecA' scaled to 'LengthNew'.
    Result AS Vec2
    IF VecA.x = 0.0 AND VecA.y = 0.0
        Result.x = 0.0
        Result.y = 0.0
    ELSE
        Length AS FLOAT : Length = sqrt(VecA.x*VecA.x + VecA.y*VecA.y)
        Length = LengthNew / Length
        Result.x = VecA.x * Length
        Result.y = VecA.y * Length
    ENDIF
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION nrm2(VecA REF AS Vec2) // "Normalize"  'VecA' scaled to length of 1.0
    Length AS FLOAT : Length = sqrt(VecA.x*VecA.x + VecA.y*VecA.y)
    Length = 1.0 / Length
    Result AS Vec2
    Result.x = VecA.x * Length
    Result.y = VecA.y * Length
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION flr2(VecA REF AS Vec2) // "Floor"    Each component of 'VecA' rounded down.
    Result AS Vec2
    Result.x = floor(VecA.x)
    Result.y = floor(VecA.y)
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION cil2(VecA REF AS Vec2) // "Ceiling"  Each component of 'VecA' rounded up.
    Result AS Vec2
    Result.x = ceil(VecA.x)
    Result.y = ceil(VecA.y)
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION rnd2(VecA REF AS Vec2) // "Round"    Each component of 'VecA' rounded to nearest Integer.
    Result AS Vec2
    Result.x = round(VecA.x)
    Result.y = round(VecA.y)
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION rndto2(VecA REF AS Vec2, RoundTo AS FLOAT) // "Round To"  Each component of 'VecA' rounded to nearest 'RoundTo'.
    Result AS Vec2
    Result.x = fmod(VecA.x, RoundTo)
    Result.y = fmod(VecA.y, RoundTo)
    Threshold AS FLOAT : Threshold = RoundTo * 0.5
    IF     Result.x > 0.0 : IF (Result.x >  Threshold) : Result.x = VecA.x + (RoundTo -     Result.x ) : ELSE : Result.x = VecA.x -     Result.x  : ENDIF
    ELSEIF Result.x < 0.0 : IF (Result.x < -Threshold) : Result.x = VecA.x - (RoundTo - abs(Result.x)) : ELSE : Result.x = VecA.x + abs(Result.x) : ENDIF
    ELSE : Result.x = VecA.x
    ENDIF
    IF     Result.y > 0.0 : IF (Result.y >  Threshold) : Result.y = VecA.y + (RoundTo -     Result.y ) : ELSE : Result.y = VecA.y -     Result.y  : ENDIF
    ELSEIF Result.y < 0.0 : IF (Result.y < -Threshold) : Result.y = VecA.y - (RoundTo - abs(Result.y)) : ELSE : Result.y = VecA.y + abs(Result.y) : ENDIF
    ELSE : Result.y = VecA.y
    ENDIF
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION avg2_2(VecA REF AS Vec2, VecB REF AS Vec2) // "Average" of 2 Vectors
    Result AS Vec2
    Result.x = (VecA.x + VecB.x) * 0.5
    Result.y = (VecA.y + VecB.y) * 0.5
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION avg2_3(VecA REF AS Vec2, VecB REF AS Vec2, VecC REF AS Vec2) // "Average" of 3 Vectors
    Result AS Vec2
    Result.x = (VecA.x + VecB.x + VecC.x) * OneThird
    Result.y = (VecA.y + VecB.y + VecC.y) * OneThird
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION avg2_4(VecA REF AS Vec2, VecB REF AS Vec2, VecC REF AS Vec2, VecD REF AS Vec2) // "Average" of 4 Vectors
    Result AS Vec2
    Result.x = (VecA.x + VecB.x + VecC.x + VecD.x) * 0.25
    Result.y = (VecA.y + VecB.y + VecC.y + VecD.y) * 0.25
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION ref2(VecA REF AS Vec2, SurfaceNrm REF AS Vec2) // "Reflect"
    Dot AS FLOAT : Dot = (VecA.x * SurfaceNrm.x) + (VecA.y * SurfaceNrm.y)
    Result AS Vec2
    Result.x = VecA.x + (SurfaceNrm.x * Dot * -2.0)
    Result.y = VecA.y + (SurfaceNrm.y * Dot * -2.0)
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION def2(VecA REF AS Vec2, SurfaceNrm REF AS Vec2) // "Deflect"
    Dot AS FLOAT : Dot = (VecA.x * SurfaceNrm.x) + (VecA.y * SurfaceNrm.y)
    Result AS Vec2
    Result.x = (SurfaceNrm.x * Dot * 2.0) - VecA.x
    Result.y = (SurfaceNrm.y * Dot * 2.0) - VecA.y
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION prj2(Pnt  REF AS Vec2,                   // "Projection"  Get ClosestPointOnLine from Point.
              LinA REF AS Vec2, LinB REF AS Vec2)
    DltAP_X AS FLOAT : DltAP_X = Pnt.x  - LinA.x
    DltAP_Y AS FLOAT : DltAP_Y = Pnt.y  - LinA.y
    DltAB_X AS FLOAT : DltAB_X = LinB.x - LinA.x
    DltAB_Y AS FLOAT : DltAB_Y = LinB.y - LinA.y

    DotAP_AB AS FLOAT : DotAP_AB = (DltAP_X * DltAB_X) + (DltAP_Y * DltAB_Y)
    DotAB_AB AS FLOAT : DotAB_AB = (DltAB_X * DltAB_X) + (DltAB_Y * DltAB_Y) //  Squared length of DltAB.

    // Get distance to NearestPointOnLine, from LinA as multiple of DltAB:
    DltScalar AS FLOAT
    DltScalar = DotAP_AB / DotAB_AB

    Result AS Vec2
    Result.x = LinA.x + (DltAB_X * DltScalar)
    Result.y = LinA.y + (DltAB_Y * DltScalar)
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION prj2n(Pnt     REF AS Vec2,                      // "Projection"  Get ClosestPointOnLine from Point.
               Lin_Pos REF AS Vec2, Lin_Nrm REF AS Vec2)
    DotAP_AB AS FLOAT : DotAP_AB = ((Pnt.x - Lin_Pos.x) * Lin_Nrm.x) + ((Pnt.y - Lin_Pos.y) * Lin_Nrm.y)
    Result AS Vec2
    Result.x = Lin_Pos.x + (Lin_Nrm.x * DotAP_AB)
    Result.y = Lin_Pos.y + (Lin_Nrm.y * DotAP_AB)
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION AngleToVec2(Theta AS FLOAT)
    Theta = -Theta // Theta is inverted.
    Result AS Vec2
    Result.x = cos(Theta)
    Result.y = sin(Theta)
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION rotlf2(VecA REF AS Vec2) // "Rotate Left" Rotate 90 degrees Anti-Clockwise.
    Result AS Vec2
    Result.x = -VecA.y
    Result.y =  VecA.x
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION rotrt2(VecA REF AS Vec2) // "Rotate Right" Rotate 90 degrees Clockwise.
    Result AS Vec2
    Result.x =  VecA.y
    Result.y = -VecA.x
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION rot2(Point REF AS Vec2, Theta AS FLOAT) // "Rotate" 'Point' around Pivot(0,0).
    Theta = -Theta // Theta is inverted.

    CosT AS FLOAT : CosT = cos(Theta)
    SinT AS FLOAT : SinT = sin(Theta)

    Result AS Vec2
    Result.x = Point.x*CosT - Point.y*SinT
    Result.y = Point.x*SinT + Point.y*CosT
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION rot2p(Point REF AS Vec2, Pivot REF AS Vec2, Theta AS FLOAT) // "Rotate" 'Point' around 'Pivot'.
    Theta = -Theta // Theta is inverted.

    DltX AS FLOAT : DltX = Point.x - Pivot.x // PointX in PivotX's LocalSpace.
    DltY AS FLOAT : DltY = Point.y - Pivot.y // PointY in PivotY's LocalSpace.

    CosT AS FLOAT : CosT = cos(Theta)
    SinT AS FLOAT : SinT = sin(Theta)

    Result AS Vec2
    Result.x = Pivot.x  +  DltX*CosT - DltY*SinT
    Result.y = Pivot.y  +  DltX*SinT + DltY*CosT
ENDFUNCTION Result

