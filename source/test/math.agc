

FUNCTION TEST_math()
    Print("math.agc")
    Print("")
    Print("=======================================================================")
    Print1("        PiQ = ", PiQ        , 4, -1)
    Print1("        PiH = ", PiH        , 4, -1)
    Print1("         Pi = ", Pi         , 4, -1)
    Print1("        Pi2 = ", Pi2        , 4, -1)
    Print1("        Pi3 = ", Pi3        , 4, -1)
    Print1("        Pi4 = ", Pi4        , 4, -1)
    Print("")
    Print1("      PiRcp = ", PiRcp      , 4, -1)
    Print1("     Pi2Rcp = ", Pi2Rcp     , 4, -1)
    Print1("     Pi3Rcp = ", Pi3Rcp     , 4, -1)
    Print1("     Pi4Rcp = ", Pi4Rcp     , 4, -1)
    Print("")
    Print("=======================================================================")
    Print1("      Sqrt2 = ", Sqrt2      , 4, -1)
    Print1("   Sqrt2Rcp = ", Sqrt2Rcp   , 4, -1)
    Print("")
    Print1("      Sqrt3 = ", Sqrt3      , 4, -1)
    Print1("   Sqrt3Rcp = ", Sqrt3Rcp   , 4, -1)
    Print("")
    Print("=======================================================================")
    //Print1("TwoSubSqrt2 = ", TwoSubSqrt2, 4, -1)
    //Print1("TwoSubSqrt3 = ", TwoSubSqrt3, 4, -1)
    //Print("")
    //Print("=======================================================================")
    Print1("      Euler = ", Euler      , 4, -1)
    //Print("")
    //Print1("      Gamma = ", Gamma      , 4, -1)
    //Print("")
    //Print1("        Phi = ", Phi        , 4, -1)
    //Print1("     PhiNeg = ", PhiNeg     , 4, -1)
    Print("")
    Print("=======================================================================")
    Print1("   OneThird = ", OneThird   , 4, -1)
    Print1("   TwoThird = ", TwoThird   , 4, -1)
    Print("")
    Print("")
    Print("=======================================================================")
    Print1("   deg(pi ) = ", deg(pi)   , 4, -1)
    Print1("   rad(180) = ", rad(180)  , 4, -1)
    Print("")
    Print("=======================================================================")
ENDFUNCTION



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// https://en.wikipedia.org/wiki/Feigenbaum_constants
/// https://en.wikipedia.org/wiki/Logistic_map
///
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// https://en.wikipedia.org/wiki/Integral    ∫
///
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// https://en.wikipedia.org/wiki/Summation   Σ = Sum of a Sequence.      Π = Product of a Sequence.
///     End:       n
///              -----
///              \
///               |    i = n*2        <--- Add this result to each result for i to n.
///              /
///              -----
///     Start:   i = 1
///
/// FOR i = 1 TO n
///     i = i + (i*2)
/// NEXT i


