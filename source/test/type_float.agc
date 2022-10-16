

FUNCTION TEST_type_float()
    Print("float.agc") : Print("")

    #Constant SSS =  0.125
    #Constant AAA = 20.0
    #Constant BBB = 10.0
    Print(fmod(Timer()*SSS,AAA)-BBB)
    Print(  str(tanh(fmod(Timer()*SSS,AAA)-BBB),-1)  )

ENDFUNCTION

