///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//      Proper range-check that works for both Integer & Float values.
//
//               (P >= Min)     &    (P < Max)
//                ▼                   ▼
//                ●───────────────────
//      ┼─────────┼─────────┼─────────┼─────────┼
//     -2        -1         0         1         2
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION PointVsRange( Point_Pos AS FLOAT,
                       Range_Pos AS FLOAT, Range_Len AS FLOAT )  // Length must be positive.
ENDFUNCTION (Point_Pos >= Range_Pos AND Point_Pos < Range_Pos+Range_Len)


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION RangeVsRange( Range1_Pos AS FLOAT, Range1_Len AS FLOAT,
                       Range2_Pos AS FLOAT, Range2_Len AS FLOAT )  // Length must be positive.
ENDFUNCTION (Range1_Pos < Range2_Pos+Range2_Len AND Range2_Pos < Range1_Pos+Range1_Len )

