///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
GLOBAL DRAW2_INVERT_Y AS INTEGER = 0 // SetViewOffset(0,-VirtualResolutionY)

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawPoint(Pnt_Pos REF AS Vec2, Size AS FLOAT, ClrABGR AS INTEGER)
    IF NOT DRAW2_INVERT_Y : DrawEllipse( Pnt_Pos.x, Pnt_Pos.y,  Size,Size,  ClrABGR,ClrABGR, 1 )
    ELSE                  : DrawEllipse( Pnt_Pos.x,-Pnt_Pos.y,  Size,Size,  ClrABGR,ClrABGR, 1 )
    ENDIF
ENDFUNCTION
FUNCTION DrawPointV(Pnt_Pos REF AS Vec2, Size AS FLOAT, ClrABGR AS INTEGER) // Works with SetViewOffset(X, Y).
    IF NOT DRAW2_INVERT_Y : DrawEllipse( WorldToScreenX(Pnt_Pos.x),WorldToScreenY( Pnt_Pos.y),  Size,Size,  ClrABGR,ClrABGR, 1 )
    ELSE                  : DrawEllipse( WorldToScreenX(Pnt_Pos.x),WorldToScreenY(-Pnt_Pos.y),  Size,Size,  ClrABGR,ClrABGR, 1 )
    ENDIF
ENDFUNCTION

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawPixel(Pnt_Pos REF AS Vec2, ClrABGR AS INTEGER)
    IF NOT DRAW2_INVERT_Y : DrawBox( floor(Pnt_Pos.x),  floor(Pnt_Pos.y),  floor(Pnt_Pos.x)+0.99,  floor(Pnt_Pos.y)+0.99,  ClrABGR,ClrABGR,ClrABGR,ClrABGR, 1 )
    ELSE                  : DrawBox( floor(Pnt_Pos.x), -floor(Pnt_Pos.y),  floor(Pnt_Pos.x)+0.99, -floor(Pnt_Pos.y)-0.99,  ClrABGR,ClrABGR,ClrABGR,ClrABGR, 1 )
    ENDIF
ENDFUNCTION
FUNCTION DrawPixel2(Pnt_Pos REF AS Vec2, ClrABGR AS INTEGER)
    IF NOT DRAW2_INVERT_Y : DrawEllipse( floor(Pnt_Pos.x)+0.5, floor(Pnt_Pos.y)+0.5,  0.4,0.4,  ClrABGR,ClrABGR, 1 )
    ELSE                  : DrawEllipse( floor(Pnt_Pos.x)+0.5,-floor(Pnt_Pos.y)-0.5,  0.4,0.4,  ClrABGR,ClrABGR, 1 )
    ENDIF
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawLine_(PntA_Pos REF AS Vec2, PntB_Pos REF AS Vec2, ClrABGR  AS INTEGER )
    IF NOT DRAW2_INVERT_Y : DrawLine( PntA_Pos.x, PntA_Pos.y,  PntB_Pos.x, PntB_Pos.y,  ClrABGR,ClrABGR )
    ELSE                  : DrawLine( PntA_Pos.x,-PntA_Pos.y,  PntB_Pos.x,-PntB_Pos.y,  ClrABGR,ClrABGR )
    ENDIF
ENDFUNCTION
FUNCTION DrawLineV(PntA_Pos REF AS Vec2, PntB_Pos REF AS Vec2, ClrABGR  AS INTEGER ) // Works with SetViewOffset(X, Y).
    IF NOT DRAW2_INVERT_Y : DrawLine( WorldToScreenX(PntA_Pos.x),WorldToScreenY( PntA_Pos.y),  WorldToScreenX(PntB_Pos.x),WorldToScreenY( PntB_Pos.y),  ClrABGR,ClrABGR )
    ELSE                  : DrawLine( WorldToScreenX(PntA_Pos.x),WorldToScreenY(-PntA_Pos.y),  WorldToScreenX(PntB_Pos.x),WorldToScreenY(-PntB_Pos.y),  ClrABGR,ClrABGR )
    ENDIF
ENDFUNCTION
FUNCTION DrawLineC(PntA_Pos REF AS Vec2,
                   PntB_Pos REF AS Vec2,
                   Clr      REF AS RGBA )
    ClrABGR AS INTEGER : ClrABGR = (Clr.a << 24) + (Clr.b << 16) + (Clr.g <<  8) + Clr.r
    IF NOT DRAW2_INVERT_Y : DrawLine( PntA_Pos.x, PntA_Pos.y,  PntB_Pos.x, PntB_Pos.y,  ClrABGR,ClrABGR )
    ELSE                  : DrawLine( PntA_Pos.x,-PntA_Pos.y,  PntB_Pos.x,-PntB_Pos.y,  ClrABGR,ClrABGR )
    ENDIF
ENDFUNCTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION DrawCircle(Cir_Pos REF AS Vec2, Cir_Rds AS FLOAT, ClrABGR AS INTEGER )
    IF NOT DRAW2_INVERT_Y : DrawEllipse( Cir_Pos.x,  Cir_Pos.y,  Cir_Rds,Cir_Rds,  ClrABGR,ClrABGR,  0 )
    ELSE                  : DrawEllipse( Cir_Pos.x, -Cir_Pos.y,  Cir_Rds,Cir_Rds,  ClrABGR,ClrABGR,  0 )
    ENDIF
ENDFUNCTION
FUNCTION DrawCircleV(Cir_Pos REF AS Vec2, Cir_Rds AS FLOAT, ClrABGR AS INTEGER )
    IF NOT DRAW2_INVERT_Y : DrawEllipse( WorldToScreenX(Cir_Pos.x), WorldToScreenY( Cir_Pos.y),  Cir_Rds,Cir_Rds,  ClrABGR,ClrABGR,  0 )
    ELSE                  : DrawEllipse( WorldToScreenX(Cir_Pos.x), WorldToScreenY(-Cir_Pos.y),  Cir_Rds,Cir_Rds,  ClrABGR,ClrABGR,  0 )
    ENDIF
ENDFUNCTION

