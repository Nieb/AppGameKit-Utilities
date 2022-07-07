///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  Float 32 bit  --  IEEE-754 Floating Point
//  https://www.h-schmidt.net/FloatConverter/IEEE754.html
//  https://www.ibm.com/docs/en/xcafbg/9.0.0?topic=SS3KZ4_9.0.0/com.ibm.xlf111.bg.doc/xlfopg/fpieee.htm
#Constant FLT_NaN     = 0x7fffffff

#Constant FLT_Inf     = 0x7f800000
#Constant FLT_InfNeg  = 0xff800000

#Constant FLT_ZeroNeg = 0x80000000


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION flt(Int AS FLOAT) : ENDFUNCTION Int  // For explicit casting.


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION Print1(Label AS STRING, PrintMe AS FLOAT, PadLeft AS INTEGER, TruncRight AS INTEGER)
    Print( Label + padstr(PrintMe, PadLeft, TruncRight) )
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
FUNCTION signf(SignMe AS FLOAT)
    IF     SignMe > 0.0 : EXITFUNCTION  1.0
    ELSEIF SignMe < 0.0 : EXITFUNCTION -1.0
    ENDIF
ENDFUNCTION 0.0


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION minf(FltA AS FLOAT, FltB AS FLOAT) : IF FltA < FltB THEN EXITFUNCTION FltA : ENDFUNCTION FltB
FUNCTION maxf(FltA AS FLOAT, FltB AS FLOAT) : IF FltA > FltB THEN EXITFUNCTION FltA : ENDFUNCTION FltB


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION clampf(ClampMe AS FLOAT, ClampMin AS FLOAT, ClampMax AS FLOAT)
    IF     ClampMe < ClampMin : EXITFUNCTION ClampMin
    ELSEIF ClampMe > ClampMax : EXITFUNCTION ClampMax
    ENDIF
ENDFUNCTION ClampMe


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION wrapf(WrapMe AS FLOAT, WrapMin AS FLOAT, WrapMax AS FLOAT)
    IF (WrapMe >= WrapMin AND WrapMe < WrapMax) THEN EXITFUNCTION WrapMe
    WrapMe  = WrapMe  - WrapMin
    WrapMax = WrapMax - WrapMin
    IF     (WrapMe <      0.0) : WrapMe = WrapMin + WrapMax + fmod( WrapMe, WrapMax)
    ELSEIF (WrapMe >= WrapMax) : WrapMe = WrapMin +           fmod( WrapMe, WrapMax)
    ENDIF
ENDFUNCTION WrapMe


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION roundto(RndMe AS FLOAT, RndTo AS FLOAT)
    ModMe AS FLOAT : ModMe = fmod(RndMe, RndTo)
    IF     ModMe > 0.0 : IF ModMe >  (RndTo * 0.5) : RndMe = RndMe + (RndTo -     ModMe ) : ELSE : RndMe = RndMe -     ModMe  : ENDIF
    ELSEIF ModMe < 0.0 : IF ModMe < -(RndTo * 0.5) : RndMe = RndMe - (RndTo - abs(ModMe)) : ELSE : RndMe = RndMe + abs(ModMe) : ENDIF
    ENDIF
ENDFUNCTION RndMe


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  Hyperbolic Trigonometric Functions:
//  https://en.wikipedia.org/wiki/Hyperbolic_functions
FUNCTION cosh(X AS FLOAT) : ENDFUNCTION (Euler^X + Euler^-X) / 2.0 // X = Radians, returns Y.


FUNCTION sinh(X AS FLOAT) : ENDFUNCTION (Euler^X - Euler^-X) / 2.0 // X = Radians, returns Y.


FUNCTION tanh(X AS FLOAT) // X = Radians, returns Y.
    //  Digits of precision-ish:
    //      With float32:
    //          X  =  8.3   -->  Y = 0.999_999_8~~
    //          X  =  8.33  -->  Y = 1.0
    //          X >= 88.8   -->  Y = -nan(ind)
    IF     X > 9.0 : EXITFUNCTION  1.0
    ELSEIF X < 9.0 : EXITFUNCTION -1.0
    ELSE           : EXITFUNCTION (Euler^X - Euler^-X) / (Euler^X + Euler^-X)
    ENDIF
ENDFUNCTION 0.0


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION Sigmoid(X AS FLOAT) : ENDFUNCTION 1.0 / (1.0 + Euler^-X) // Returns Y.


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Sigmoid centered at (0,0):
//  https://www.desmos.com/calculator/civpexqum0
FUNCTION Sigmoidish(X AS FLOAT, PosX AS FLOAT, PosY AS FLOAT, SclX AS FLOAT, SclY AS FLOAT) // "Position", "Scale".
ENDFUNCTION PosY - 1.0 + (  SclY / (1.0 + (Euler^(-X*SclX)) * (Euler^(PosX*SclX)))  )

