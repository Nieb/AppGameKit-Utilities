

FUNCTION TEST_type_vector2()
    Print("vector2.agc")
    Print("")

    LineA_Pos AS Vec2 : LineA_Pos = vec2(500, 950)
    LineB_Pos AS Vec2 : LineB_Pos = vec2(950, 300)

    Mouse1_Pos AS Vec2
    Mouse1_Pos.x = GetRawMouseX()
    Mouse1_Pos.y = GetRawMouseY()

    Mouse2_Pos AS Vec2 : Mouse2_Pos = add2(Mouse1_Pos,vec2(15,-15))

    Prjct1_Pos AS Vec2 : Prjct1_Pos = prj2(Mouse1_Pos, LineA_Pos, LineB_Pos)
    Prjct2_Pos AS Vec2 : Prjct2_Pos = prj2n(Mouse2_Pos, LineA_Pos, nrm2(sub2(LineB_Pos, LineA_Pos)))

    DrawLine_(LineA_Pos,   LineB_Pos,   0xFF18AAAA)

    DrawLine_(Mouse1_Pos,  Prjct1_Pos,  0xFF99BB99)
    DrawLine_(Mouse2_Pos,  Prjct2_Pos,  0xFFBB9933)

    DrawPoint(LineA_Pos, 3, 0xFF22BBBB)
    DrawPoint(LineB_Pos, 3, 0xFF22BBBB)

    DrawPoint(Mouse1_Pos, 3, 0xFF99BB99)
    DrawPoint(Mouse2_Pos, 3, 0xFFBB9933)

    DrawPoint(Prjct1_Pos, 3, 0xFF99BB99)
    DrawPoint(Prjct2_Pos, 3, 0xFFBB9933)


    //=============================================================
    Print2("    AngleToVec2(  0) = ", AngleToVec2(  0), 2, 7)
    Print2("    AngleToVec2( 90) = ", AngleToVec2( 90), 2, 7)
    Print2("    AngleToVec2(180) = ", AngleToVec2(180), 2, 7)
    Print2("    AngleToVec2(270) = ", AngleToVec2(270), 2, 7)

    Print("")
    Print(str(Prjct1_Pos.x)+"  "+str(Prjct1_Pos.a)+"  "+str(Prjct1_Pos.u))
    Print(str(Prjct1_Pos.y)+"  "+str(Prjct1_Pos.b)+"  "+str(Prjct1_Pos.v))

ENDFUNCTION

