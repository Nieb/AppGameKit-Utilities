

FUNCTION TEST_type_vector2()
    Print("vector2.agc")
    Print("")

    LineA_Pos AS Vec2 : LineA_Pos = vec2(500, 950)
    LineB_Pos AS Vec2 : LineB_Pos = vec2(950, 300)

    Mouse1_Pos AS Vec2
    Mouse1_Pos.x = GetRawMouseX()
    Mouse1_Pos.y = GetRawMouseY()

    Prjct1_Pos AS Vec2 : Prjct1_Pos = prj2(Mouse1_Pos, LineA_Pos, LineB_Pos)

    Prjct2_Pos AS Vec2 : Prjct2_Pos = prj2n(Mouse1_Pos, LineA_Pos, nrm2(sub2(LineB_Pos, LineA_Pos)))


    DrawLine2(LineA_Pos,   LineB_Pos,   0xFF777777)
    DrawLine2(Mouse1_Pos,  Prjct2_Pos,  0xFF99BB99)

    DrawPoint(LineA_Pos, 3, 0xFFBBBBBB)
    DrawPoint(LineB_Pos, 3, 0xFFBBBBBB)

    DrawPoint(Mouse1_Pos, 3, 0xFF99BB99)
    DrawPoint(Prjct2_Pos, 3, 0xFF99BB99)

ENDFUNCTION

