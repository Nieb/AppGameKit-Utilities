

FUNCTION TEST_PrintA()
    Print("AGK_print_anywhere.agc")
    Print("")

    //IF GetRawKeyState(KEY_A)
        PrintA("Blarg!", TXT_Cn, 512+sin(Timer()*115   )*128, 256+sin(Timer()*62   )*64, 32, 0xFF000000 || floor((sin(Timer()*801)+1)*128)<<16 || floor((sin(Timer()*599)+1)*128)<<8 || floor((sin(Timer()*700)+1)*128))
        PrintA("Barf!" , TXT_Cn, 512+sin(Timer()*115+64)*128, 256+sin(Timer()*62+64)*64, 32, 0xFF000000 || floor((sin(Timer()*599)+1)*128)<<16 || floor((sin(Timer()*700)+1)*128)<<8 || floor((sin(Timer()*801)+1)*128))

        PrintA("MouseX: "+str(GetRawMouseX(),3) , TXT_Cn, 640+sin(Timer()*115   )*128, 512+sin(Timer()*62   )*64, 32, 0xFF000000 || floor((sin(Timer()*801)+1)*128)<<16 || floor((sin(Timer()*599)+1)*128)<<8 || floor((sin(Timer()*700)+1)*128))
        PrintA("MouseY: "+str(GetRawMouseY(),3) , TXT_Cn, 640+sin(Timer()*115+64)*128, 576+sin(Timer()*62+64)*64, 32, 0xFF000000 || floor((sin(Timer()*599)+1)*128)<<16 || floor((sin(Timer()*700)+1)*128)<<8 || floor((sin(Timer()*801)+1)*128))

        PrintA(str(ScreenFPS()) , TXT_Cn, 768+sin(Timer()*115+64)*128, 768+sin(Timer()*62+64)*64, 32, 0xFF000000 || floor((sin(Timer()*599)+1)*128)<<16 || floor((sin(Timer()*700)+1)*128)<<8 || floor((sin(Timer()*801)+1)*128))
    //ENDIF
ENDFUNCTION

