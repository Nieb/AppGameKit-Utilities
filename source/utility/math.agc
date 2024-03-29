//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION deg(Radians AS FLOAT) : ENDFUNCTION Radians * 57.29577951308232087679815481410517033240547246656432 //  (180/pi)
FUNCTION rad(Degrees AS FLOAT) : ENDFUNCTION Degrees *  0.01745329251994329576923690768488612713442871888542 //  (pi/180)


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  Hyperbolic Trigonometric Functions:                                                      https://en.wikipedia.org/wiki/Hyperbolic_functions
FUNCTION cosh(X AS FLOAT) : ENDFUNCTION (Euler^X + Euler^-X) / 2.0 // X = Radians, returns Y.

FUNCTION sinh(X AS FLOAT) : ENDFUNCTION (Euler^X - Euler^-X) / 2.0 // X = Radians, returns Y.

FUNCTION tanh(X AS FLOAT) // X = Radians, returns Y.
    //  With Float32:
    //      IF X  =  8.3  THEN Y = 0.999_999_8~~
    //      IF X  =  8.33 THEN Y = 1.0
    //      IF X >= 88.8  THEN Y = -nan(ind)
    IF     X >  8.4 : EXITFUNCTION  1.0
    ELSEIF X < -8.4 : EXITFUNCTION -1.0
    ELSE
        Euler_X  AS FLOAT : Euler_X  = Euler^X
        Euler_nX AS FLOAT : Euler_nX = Euler^-X
        EXITFUNCTION (Euler_X - Euler_nX) / (Euler_X + Euler_nX)
    ENDIF
ENDFUNCTION 0.0


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION Sigmoid(X AS FLOAT) : ENDFUNCTION 1.0 / (1.0 + Euler^-X) // Returns Y.


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Sigmoid centered at (0,0).                                                                      https://www.desmos.com/calculator/b6f0ca1hhh
FUNCTION Sigmoidish(X    AS FLOAT,
                    PosX AS FLOAT, PosY AS FLOAT, // "Position"
                    SclX AS FLOAT, SclY AS FLOAT) // "Scale"
ENDFUNCTION PosY - 1.0 + (  SclY / (1.0 + (Euler^(-X*SclX)) * (Euler^(PosX*SclX)))  )

