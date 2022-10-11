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
FUNCTION add2(VecA REF AS Vec2, VecB REF AS Vec2) // VecA + VecB
    Result AS Vec2
    Result.x = VecA.x + VecB.x
    Result.y = VecA.y + VecB.y
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION add2f(VecA REF AS Vec2, FloatValue AS FLOAT) // VecA + Float
    Result AS Vec2
    Result.x = VecA.x + FloatValue
    Result.y = VecA.y + FloatValue
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION sub2(VecA REF AS Vec2, VecB REF AS Vec2) // VecA - VecB
    Result AS Vec2
    Result.x = VecA.x - VecB.x
    Result.y = VecA.y - VecB.y
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION sub2f(VecA REF AS Vec2, FloatValue AS FLOAT) // VecA - Float
    Result AS Vec2
    Result.x = VecA.x - FloatValue
    Result.y = VecA.y - FloatValue
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION mul2(VecA REF AS Vec2, VecB REF AS Vec2) // VecA * VecB
    Result AS Vec2
    Result.x = VecA.x * VecB.x
    Result.y = VecA.y * VecB.y
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION mul2f(VecA REF AS Vec2, FloatValue AS FLOAT) // VecA * Float
    Result AS Vec2
    Result.x = VecA.x * FloatValue
    Result.y = VecA.y * FloatValue
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION div2(VecA REF AS Vec2, VecB REF AS Vec2) // VecA / VecB
    Result AS Vec2
    Result.x = VecA.x / VecB.x
    Result.y = VecA.y / VecB.y
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION div2f(VecA REF AS Vec2, FloatValue AS FLOAT) // VecA / Float
    Result AS Vec2
    Result.x = VecA.x / FloatValue
    Result.y = VecA.y / FloatValue
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION dot2(VecA REF AS Vec2, VecB REF AS Vec2) // 'VecA' "dot" 'VecB'
    Result AS FLOAT
    Result = VecA.x * VecB.x + VecA.y * VecB.y
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION crs2(VecA REF AS Vec2, VecB REF AS Vec2) // 'VecA' "cross" 'VecB'
    Result AS FLOAT
    Result = VecA.x * VecB.y - VecA.y * VecB.x // This is Z of a 3D CrossProduct. X & Y would be Zero.
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION inv2(VecA REF AS Vec2) // "Invert" (Additive Inverse) of 'VecA'.
    Result AS Vec2
    Result.x = -VecA.x
    Result.y = -VecA.y
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION cmp2(VecA REF AS Vec2) // "Complement" (Complimentary Inverse) of 'VecA'.
    Result AS Vec2
    Result.x = 1.0 - VecA.x
    Result.y = 1.0 - VecA.y
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION rcp2(VecA REF AS Vec2) // "Reciprocal" (Multiplicative Inverse) of 'VecA'.
    Result AS Vec2
    Result.x = 1.0 / VecA.x
    Result.y = 1.0 / VecA.y
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION len2(VecA REF AS Vec2) // Get 'VecA' Length.
    Result AS FLOAT : Result = sqrt(VecA.x*VecA.x + VecA.y*VecA.y)
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION dst2(VecA REF AS Vec2, VecB REF AS Vec2)
    Delta_X AS FLOAT : Delta_X = VecB.x-VecA.x
    Delta_Y AS FLOAT : Delta_Y = VecB.y-VecA.y
    Result AS FLOAT : Result = sqrt(Delta_X*Delta_X + Delta_Y*Delta_Y)
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION setlen2(VecA REF AS Vec2, NewLength AS FLOAT) // "Set Length"  'VecA' scaled to 'NewLength'.      lnn2() "Lengthen"  lng() "Length"   ( Make overload of len()?  1arg=getlength, 2args=setlength )
    Result AS Vec2
    IF VecA.x = 0.0 AND VecA.y = 0.0
        Result.x = 0.0
        Result.y = 0.0
    ELSE
        Length AS FLOAT : Length = sqrt(VecA.x*VecA.x + VecA.y*VecA.y)
        Length = NewLength / Length
        Result.x = VecA.x * Length
        Result.y = VecA.y * Length
    ENDIF
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION nrm2(VecA REF AS Vec2) // 'VecA' scaled to length of 1.0
    Length AS FLOAT : Length = sqrt(VecA.x*VecA.x + VecA.y*VecA.y)
    Length = 1.0 / Length
    Result AS Vec2
    Result.x = VecA.x * Length
    Result.y = VecA.y * Length
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION flr2(VecA REF AS Vec2) // "Floor"  Each component of 'VecA' rounded down.
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
FUNCTION rnd2(VecA REF AS Vec2) // "Round"  Each component of 'VecA' rounded to nearest Integer.
    Result AS Vec2
    Result.x = round(VecA.x)
    Result.y = round(VecA.y)
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION rndto2(VecA REF AS Vec2, RoundTo AS FLOAT) // Round each component to nearest 'RoundTo'.    ( Make this an overload of Round. )
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
FUNCTION avg2_2(VecA REF AS Vec2, VecB REF AS Vec2) // Average of 2 Vectors
    Result AS Vec2
    Result.x = (VecA.x + VecB.x) * 0.5
    Result.y = (VecA.y + VecB.y) * 0.5
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION avg2_3(VecA REF AS Vec2, VecB REF AS Vec2, VecC REF AS Vec2) // Average of 3 Vectors
    Result AS Vec2
    Result.x = (VecA.x + VecB.x + VecC.x) * 0.33333333333333333333333333333333333333333333333333
    Result.y = (VecA.y + VecB.y + VecC.y) * 0.33333333333333333333333333333333333333333333333333
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION avg2_4(VecA REF AS Vec2, VecB REF AS Vec2, VecC REF AS Vec2, VecD REF AS Vec2) // Average of 4 Vectors
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
FUNCTION prj2(Point REF AS Vec2, LinePointA REF AS Vec2, LinePointB REF AS Vec2) // "Projection"  Get ClosestPointOnLine from Point.
    Delta_AP_X AS FLOAT : Delta_AP_X = Point.x - LinePointA.x
    Delta_AP_Y AS FLOAT : Delta_AP_Y = Point.y - LinePointA.y

    Delta_AB_X AS FLOAT : Delta_AB_X = LinePointB.x - LinePointA.x
    Delta_AB_Y AS FLOAT : Delta_AB_Y = LinePointB.y - LinePointA.y

    DotAP_AB AS FLOAT : DotAP_AB = (Delta_AP_X * Delta_AB_X) + (Delta_AP_Y * Delta_AB_Y)
    DotAB_AB AS FLOAT : DotAB_AB = (Delta_AB_X * Delta_AB_X) + (Delta_AB_Y * Delta_AB_Y) // This is almost Pythagorean.    It's the Squared Length of Delta_AB.

    ProjectedPoint_distance_from_LinePointA_as_multiple_of_Delta_AB AS FLOAT // lol
    ProjectedPoint_distance_from_LinePointA_as_multiple_of_Delta_AB = DotAP_AB / DotAB_AB

    Result AS Vec2
    Result.x = LinePointA.x + (Delta_AB_X * ProjectedPoint_distance_from_LinePointA_as_multiple_of_Delta_AB)
    Result.y = LinePointA.y + (Delta_AB_Y * ProjectedPoint_distance_from_LinePointA_as_multiple_of_Delta_AB)
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION prj2n(Point REF AS Vec2, LinePos REF AS Vec2, LineNrm REF AS Vec2) // "Projection"  Get ClosestPointOnLine from Point.
    DotAP_AB AS FLOAT : DotAP_AB = ((Point.x - LinePos.x) * LineNrm.x) + ((Point.y - LinePos.y) * LineNrm.y)
    Result AS Vec2
    Result.x = LinePos.x + (LineNrm.x * DotAP_AB)
    Result.y = LinePos.y + (LineNrm.y * DotAP_AB)
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
FUNCTION AngleToVec2(Ang AS FLOAT)
    Result AS Vec2
    Result.x =  cos(Ang)
    Result.y = -sin(Ang) // Theta is inverted.
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
FUNCTION rotlf2(VecA REF AS Vec2) // "Perpendicular Left" Rotate 90 degrees Anti-Clockwise.
    Result AS Vec2
    Result.x = -VecA.y
    Result.y =  VecA.x
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION rotrt2(VecA REF AS Vec2) // "Perpendicular Right" Rotate 90 degrees Clockwise.
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

    Delta_X AS FLOAT : Delta_X = Point.x - Pivot.x // PointX in PivotX's LocalSpace.
    Delta_Y AS FLOAT : Delta_Y = Point.y - Pivot.y // PointY in PivotY's LocalSpace.

    CosT AS FLOAT : CosT = cos(Theta)
    SinT AS FLOAT : SinT = sin(Theta)

    Result AS Vec2
    Result.x = Pivot.x  +  Delta_X*CosT - Delta_Y*SinT
    Result.y = Pivot.y  +  Delta_X*SinT + Delta_Y*CosT
ENDFUNCTION Result













///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION GetTriangulation(VecPos AS Vec2, Which AS INTEGER)
    // This belongs in collision detection.
    // https://www.desmos.com/calculator/mjptaodmua
ENDFUNCTION

