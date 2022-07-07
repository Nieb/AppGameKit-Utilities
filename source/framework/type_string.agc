///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Add 'spaces' to left of float/integer.
FUNCTION PadStr(StringMe AS FLOAT, PadLeft AS INTEGER, TruncRight AS INTEGER)
    Result       AS STRING  : Result       = str(StringMe, TruncRight) // Fun fact:  TruncRight = -1  will show all digits.
    StringLength AS INTEGER : StringLength = len( Left(Result, FindString(Result, ".")-1) )
    IF StringLength >= PadLeft THEN EXITFUNCTION Result // Prevent spaces(-1) crash.

    //Print(str(PadLeft)+" - "+str(StringLength)+" = "+str(PadLeft - StringLength))

    EXITFUNCTION Result
    Result = spaces(PadLeft - StringLength) + Result
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Add 'zeros' to left of an integer.
FUNCTION ZeroPadInt(StringMe AS INTEGER, PadLeft AS INTEGER)
    Result AS STRING : Result = str(StringMe)
    StringLength AS INTEGER : StringLength = len(Result)
    IF PadLeft <= 1 OR PadLeft < StringLength THEN EXITFUNCTION Result // Prevent spaces(-1) crash.
    Result = ReplaceString(spaces(PadLeft - StringLength)," ","0",-1) + Result
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Add comma every 3 digits.
FUNCTION CommaDelimit(StringMe AS INTEGER)
    NumberString AS STRING  : NumberString = str(StringMe)
    NumberLength AS INTEGER : NumberLength = len(NumberString)
    Result AS STRING : Result = ""
    IF (NumberLength >= 4 AND StringMe > 0) OR (NumberLength > 4 AND StringMe < 0) // Catch & prevent "-,123".
        iDigit AS INTEGER
        FOR iDigit = 1 TO NumberLength
            IF iDigit > 1 AND mod(iDigit,3) = 1 THEN Result = "," + Result
            Result = mid(NumberString, NumberLength-iDigit+1, 1) + Result
        NEXT iDigit
    ELSE
        Result = NumberString
    ENDIF
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION PadCommaDelimit(StringMe AS INTEGER, PadLeft AS INTEGER)
    NumberString AS STRING  : NumberString = str(StringMe)
    NumberLength AS INTEGER : NumberLength = len(NumberString)
    Result AS STRING : Result = ""
    IF (NumberLength >= 4 AND StringMe > 0) OR (NumberLength > 4 AND StringMe < 0) // Catch & prevent "-,123".
        iDigit AS INTEGER
        FOR iDigit = 1 TO NumberLength
            IF iDigit > 1 AND mod(iDigit,3) = 1 THEN Result = "," + Result
            Result = mid(NumberString, NumberLength-iDigit+1, 1) + Result
        NEXT iDigit
    ELSE
        Result = NumberString
    ENDIF
    IF len(Result) > PadLeft THEN EXITFUNCTION Result // Prevent spaces(-1) crash.
    Result = spaces( PadLeft - len(Result) ) + Result
ENDFUNCTION Result

