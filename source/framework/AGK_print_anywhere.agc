///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
TYPE TYPE_PrintA_Data
    TXT AS INTEGER[PRINTA_MAX]

    Q_Strg AS STRING[-1]
    Q_Algn AS INTEGER[-1]
    Q_PosX AS FLOAT[-1]
    Q_PosY AS FLOAT[-1]
    Q_Size AS FLOAT[-1]
    Q_Colr AS INTEGER[-1]
ENDTYPE
GLOBAL PrintA_Data AS TYPE_PrintA_Data

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#Constant PRINTA_MAX = 63
//#Constant LF = -1
//#Constant CN =  0
//#Constant RT =  1


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION InitializePrintA()
    iTxt AS INTEGER
    FOR iTxt = 0 TO PRINTA_MAX
        PrintA_Data.TXT[iTxt] = CreateText("")
            SetTextVisible(PrintA_Data.TXT[iTxt],0)
            SetTextDepth(PrintA_Data.TXT[iTxt],1)
    NEXT iTxt
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION SetPrintAFont(iFnt AS INTEGER)
    iTxt AS INTEGER
    FOR iTxt = 0 TO PRINTA_MAX
        SetTextFont(PrintA_Data.TXT[iTxt], iFnt)
    NEXT iTxt
ENDFUNCTION


////FUNCTION SetPrintA_Align(Align AS INTEGER)
////    iTxt AS INTEGER
////    FOR iTxt = 0 TO PRINTA_MAX
////        SetTextAlignment(PrintA_Data.TXT[iTxt], Align)
////    NEXT iTxt
////ENDFUNCTION
////
////FUNCTION SetPrintA_Size(Size AS FLOAT)
////    iTxt AS INTEGER
////    FOR iTxt = 0 TO PRINTA_MAX
////        SetTextSize(PrintA_Data.TXT[iTxt],Size)
////    NEXT iTxt
////ENDFUNCTION
////
////FUNCTION SetPrintA_Color(Red AS INTEGER, Grn AS INTEGER, Blu AS INTEGER, Alf AS INTEGER)
////    iTxt AS INTEGER
////    FOR iTxt = 0 TO PRINTA_MAX
////        SetTextColor(PrintA_Data.TXT[iTxt], COLOR)
////    NEXT iTxt
////ENDFUNCTION
////
////FUNCTION SetPrintA_ColorABGR(ClrABGR AS INTEGER)
////    iTxt AS INTEGER
////    FOR iTxt = 0 TO PRINTA_MAX
////        SetTextColor(PrintA_Data.TXT[iTxt], COLOR)
////    NEXT iTxt
////ENDFUNCTION
////
////FUNCTION SetPrintA_ColorRGBA(ClrRGBA AS INTEGER)
////    iTxt AS INTEGER
////    FOR iTxt = 0 TO PRINTA_MAX
////        SetTextColor(PrintA_Data.TXT[iTxt], COLOR)
////    NEXT iTxt
////ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION PrintA(TextStr   AS STRING,
                Align     AS INTEGER,
                PosX      AS FLOAT,
                PosY      AS FLOAT,
                Size      AS FLOAT,
                ColorABGR AS INTEGER )
    PrintA_Data.Q_Strg.insert(TextStr)
    PrintA_Data.Q_Algn.insert(Align)
    PrintA_Data.Q_PosX.insert(PosX)
    PrintA_Data.Q_PosY.insert(PosY)
    PrintA_Data.Q_Size.insert(Size)
    PrintA_Data.Q_Colr.insert(ColorABGR)
ENDFUNCTION


////FUNCTION PrintA(TextStr   AS STRING,
////                PosX      AS FLOAT,
////                PosY      AS FLOAT )
////    PrintA_Data.Q_Strg.insert(TextStr)
////    PrintA_Data.Q_PosX.insert(PosX)
////    PrintA_Data.Q_PosY.insert(PosY)
////ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawPrintA()
    iTxt AS INTEGER
    FOR iTxt = 0 TO PrintA_Data.Q_Strg.length
        SetTextString(   PrintA_Data.TXT[iTxt],  PrintA_Data.Q_Strg[iTxt])
        SetTextAlignment(PrintA_Data.TXT[iTxt],  PrintA_Data.Q_Algn[iTxt])
        SetTextPosition( PrintA_Data.TXT[iTxt],  PrintA_Data.Q_PosX[iTxt], PrintA_Data.Q_PosY[iTxt])
        SetTextSize(     PrintA_Data.TXT[iTxt],  PrintA_Data.Q_Size[iTxt])
        SetTextColor(    PrintA_Data.TXT[iTxt], (PrintA_Data.Q_Colr[iTxt] && 0x000000FF), (PrintA_Data.Q_Colr[iTxt] && 0x0000FF00)>>8, (PrintA_Data.Q_Colr[iTxt] && 0x00FF0000)>>16, (PrintA_Data.Q_Colr[iTxt] && 0xFF000000)>>24 )

        SetTextVisible(PrintA_Data.TXT[iTxt],1)
        DrawText(PrintA_Data.TXT[iTxt])
        SetTextVisible(PrintA_Data.TXT[iTxt],0)
    NEXT iTxt

    // Flush DrawQueue:
    PrintA_Data.Q_Strg.length = -1
    PrintA_Data.Q_Algn.length = -1
    PrintA_Data.Q_PosX.length = -1
    PrintA_Data.Q_PosY.length = -1
    PrintA_Data.Q_Size.length = -1
    PrintA_Data.Q_Colr.length = -1
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION TEST_PRINTA()
    //IF GetRawKeyState(KEY_A)
        PrintA("Blarg!", TXT_Cn, 512+sin(Timer()*115   )*128, 256+sin(Timer()*62   )*64, 32, 0xFF000000 || floor((sin(Timer()*801)+1)*128)<<16 || floor((sin(Timer()*599)+1)*128)<<8 || floor((sin(Timer()*700)+1)*128))
        PrintA("Barf!" , TXT_Cn, 512+sin(Timer()*115+64)*128, 256+sin(Timer()*62+64)*64, 32, 0xFF000000 || floor((sin(Timer()*599)+1)*128)<<16 || floor((sin(Timer()*700)+1)*128)<<8 || floor((sin(Timer()*801)+1)*128))

        PrintA("MouseX: "+str(GetRawMouseX(),3) , TXT_Cn, 640+sin(Timer()*115   )*128, 512+sin(Timer()*62   )*64, 32, 0xFF000000 || floor((sin(Timer()*801)+1)*128)<<16 || floor((sin(Timer()*599)+1)*128)<<8 || floor((sin(Timer()*700)+1)*128))
        PrintA("MouseY: "+str(GetRawMouseY(),3) , TXT_Cn, 640+sin(Timer()*115+64)*128, 576+sin(Timer()*62+64)*64, 32, 0xFF000000 || floor((sin(Timer()*599)+1)*128)<<16 || floor((sin(Timer()*700)+1)*128)<<8 || floor((sin(Timer()*801)+1)*128))

        PrintA(str(ScreenFPS()) , TXT_Cn, 768+sin(Timer()*115+64)*128, 768+sin(Timer()*62+64)*64, 32, 0xFF000000 || floor((sin(Timer()*599)+1)*128)<<16 || floor((sin(Timer()*700)+1)*128)<<8 || floor((sin(Timer()*801)+1)*128))
    //ENDIF
ENDFUNCTION

