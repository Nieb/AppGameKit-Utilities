///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// AGK INTEGER Range: -2,147,483,648 to 2,147,483,647
//
// BITWISE LSHIFT using two less-than symbols shift bits 1 space to the left.                %0111 << 1      =  %1110
// BITWISE RSHIFT using two greater-than symbols shift bits 1 space to the right.            %0111 >> 1      =  %0011
// BITWISE AND    signified by the symbol && will AND all bits of one value with another.    %1111 && %0011  =  %0011
// BITWISE OR     signified by the symbol || will OR  all bits of one value with another.    %1110 || %0011  =  %1111
// BITWISE XOR    signified by the symbol ~~ will XOR all bits of one value with another.    %1111 ~~ %0011  =  %1100
// BITWISE NOT    signified by the symbol !  will NOT all bits of the right value.          !%1010           =  %0101
//
// DecNumber As Integer = 19
// HexNumber As Integer = 0x13
// BinNumber As Integer = %00010011
//
//
//  1bits   0 to      1     Bit
//  2bits   0 to      3     Tubit*      "Two-Bit"          HalfNibble      Bibit  Nibit       Two-bit Twobit Tubit Toobit    Synonyms: petty, small
//  4bits   0 to     16     Nibble
//  8bits   0 to    256     Byte
// 16bits   0 to 65,535     TuByte*     "Quad-Nibble"      DoubleByte      Quibble     Short
//
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//GLOBAL bitflag AS INTEGER[31] = [   %00000000000000000000000000000001,
//                                    %00000000000000000000000000000010,
//                                    %00000000000000000000000000000100,
//                                    %00000000000000000000000000001000,
//                                    %00000000000000000000000000010000,
//                                    %00000000000000000000000000100000,
//                                    %00000000000000000000000001000000,
//                                    %00000000000000000000000010000000,
//                                    %00000000000000000000000100000000,
//                                    %00000000000000000000001000000000,
//                                    %00000000000000000000010000000000,
//                                    %00000000000000000000100000000000,
//                                    %00000000000000000001000000000000,
//                                    %00000000000000000010000000000000,
//                                    %00000000000000000100000000000000,
//                                    %00000000000000001000000000000000,
//                                    %00000000000000010000000000000000,
//                                    %00000000000000100000000000000000,
//                                    %00000000000001000000000000000000,
//                                    %00000000000010000000000000000000,
//                                    %00000000000100000000000000000000,
//                                    %00000000001000000000000000000000,
//                                    %00000000010000000000000000000000,
//                                    %00000000100000000000000000000000,
//                                    %00000001000000000000000000000000,
//                                    %00000010000000000000000000000000,
//                                    %00000100000000000000000000000000,
//                                    %00001000000000000000000000000000,
//                                    %00010000000000000000000000000000,
//                                    %00100000000000000000000000000000,
//                                    %01000000000000000000000000000000,
//                                    %10000000000000000000000000000000   ]
//
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION GetBit(IntVar AS INTEGER, iBit AS INTEGER)
    IF iBit < 0 OR iBit > 31 THEN EXITFUNCTION 0

    //IF IntVar && bitflag[iBit] THEN EXITFUNCTION 1

    IntVar = (IntVar >> iBit) && %1
ENDFUNCTION IntVar


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION SetBit(IntVar AS INTEGER, iBit AS INTEGER, SetTo AS INTEGER)
    IF iBit  < 0 OR iBit  > 31 THEN EXITFUNCTION 0
    IF SetTo < 0 OR SetTo >  1 THEN EXITFUNCTION 0

    // Zero bit to be changed via bitmask.
    IntVar = IntVar && !(%1 << iBit)

    // Set bit.
    IntVar = IntVar || (SetTo << iBit)

ENDFUNCTION IntVar


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION ToggleBit(IntVar AS INTEGER, iBit AS INTEGER)
    IF iBit < 0 OR iBit > 31 THEN EXITFUNCTION 0

    IntVar = IntVar ~~ (%1 << iBit)
ENDFUNCTION IntVar


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION GetTubit(IntVar AS INTEGER, iTubit AS INTEGER)
    IF iTubit < 0 OR iTubit > 15 THEN EXITFUNCTION 0

    IntVar = (IntVar >> (2*iTubit)) && %11
ENDFUNCTION IntVar


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION SetTubit(IntVar AS INTEGER, iTubit AS INTEGER, SetTo AS INTEGER)
    IF iTubit < 0 OR iTubit > 15 THEN EXITFUNCTION 0
    IF SetTo  < 0 OR SetTo  >  3 THEN EXITFUNCTION 0

    // Zero bits to be changed via bitmask.
    IntVar = IntVar && !(%11 << iTubit*2)

    // Set Tubit.
    IntVar = IntVar || (SetTo << iTubit*2)

ENDFUNCTION IntVar


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION GetNibble(IntVar AS INTEGER, iNibble AS INTEGER)
    IF iNibble < 0 OR iNibble > 7 THEN EXITFUNCTION 0

    IntVar = (IntVar >> (4*iNibble)) && %1111
ENDFUNCTION IntVar


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION SetNibble(IntVar AS INTEGER, iNibble AS INTEGER, SetTo AS INTEGER)
    IF iNibble < 0 OR iNibble >  7 THEN EXITFUNCTION 0
    IF SetTo   < 0 OR SetTo   > 15 THEN EXITFUNCTION 0

    // Zero bits to be changed via bitmask.
    IntVar = IntVar && !(%1111 << iNibble*4)

    // Set Nibble.
    IntVar = IntVar || (SetTo << iNibble*4)

ENDFUNCTION IntVar


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION GetByte(IntVar AS INTEGER, iByte AS INTEGER)
    IF iByte < 0 OR iByte > 3 THEN EXITFUNCTION 0

    IntVar = (IntVar >> (8*iByte)) && %11111111
ENDFUNCTION IntVar


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION SetByte(IntVar AS INTEGER, iByte AS INTEGER, SetTo AS INTEGER)
    IF iByte < 0 OR iByte >         3 THEN EXITFUNCTION 0
    IF SetTo < 0 OR SetTo > %11111111 THEN EXITFUNCTION 0

    // Zero bits to be changed via bitmask.
    IntVar = IntVar && !(%11111111 << iByte*8)

    // Set Byte.
    IntVar = IntVar || (SetTo << iByte*8)

ENDFUNCTION IntVar


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION GetDoubleByte(IntVar AS INTEGER, iDblByte AS INTEGER)
    IF iDblByte < 0 OR iDblByte > 1 THEN EXITFUNCTION 0

    IntVar = (IntVar >> (16*iDblByte)) && 0x0000FFFF
ENDFUNCTION IntVar


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION SetDoubleByte(IntVar AS INTEGER, iDblByte AS INTEGER, SetTo AS INTEGER)
    IF iDblByte < 0 OR iDblByte >          1 THEN EXITFUNCTION 0
    IF SetTo    < 0 OR SetTo    > 0x0000FFFF THEN EXITFUNCTION 0

    // Zero bits to be changed via bitmask.
    IntVar = IntVar && !(0x0000FFFF << iDblByte*16)

    // Set Short.
    IntVar = IntVar || (SetTo << iDblByte*16)

ENDFUNCTION IntVar

