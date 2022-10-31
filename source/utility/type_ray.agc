///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
TYPE Ray
    Pos    AS Vec3
    Nrm    AS Vec3
    NrmRcp AS Vec3 // "Reciprocal"
ENDTYPE

TYPE Ray2
    PosA   AS Vec3
    PosB   AS Vec3
    Nrm    AS Vec3
    NrmRcp AS Vec3 // "Reciprocal"
ENDTYPE


TYPE Line
    Pos    AS Vec2
    Nrm    AS Vec2
    NrmRcp AS Vec2 // "Reciprocal"
ENDTYPE

TYPE Line2
    PosA   AS Vec2
    PosB   AS Vec2
    Nrm    AS Vec2
    NrmRcp AS Vec2 // "Reciprocal"
ENDTYPE


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION ray(PosX AS FLOAT, PosY AS FLOAT, PosZ AS FLOAT,
             NrmX AS FLOAT, NrmY AS FLOAT, NrmZ AS FLOAT )
    Result AS Ray
    Result.Pos.x = PosX
    Result.Pos.y = PosY
    Result.Pos.z = PosZ

    Result.Nrm.x = NrmX
    Result.Nrm.y = NrmY
    Result.Nrm.z = NrmZ

    Result.NrmRcp.x = 1.0 / Result.Nrm.x
    Result.NrmRcp.y = 1.0 / Result.Nrm.y
    Result.NrmRcp.z = 1.0 / Result.Nrm.z
ENDFUNCTION Result


FUNCTION ray2(PosA_X AS FLOAT, PosA_Y AS FLOAT, PosA_Z AS FLOAT,
              PosB_X AS FLOAT, PosB_Y AS FLOAT, PosB_Z AS FLOAT )
    Result AS Ray2
    Result.PosA.x = PosA_X
    Result.PosA.y = PosA_Y
    Result.PosA.z = PosA_Z
    Result.PosB.x = PosB_X
    Result.PosB.y = PosB_Y
    Result.PosB.z = PosB_Z

    Result.Nrm.x = PosB_X - PosA_X  :  Result.Nrm.x = Result.Nrm.x * (1.0 / Result.Nrm.x)
    Result.Nrm.y = PosB_Y - PosA_Y  :  Result.Nrm.y = Result.Nrm.y * (1.0 / Result.Nrm.y)
    Result.Nrm.z = PosB_Z - PosA_Z  :  Result.Nrm.z = Result.Nrm.z * (1.0 / Result.Nrm.z)

    Result.NrmRcp.x = 1.0 / Result.Nrm.x
    Result.NrmRcp.y = 1.0 / Result.Nrm.y
    Result.NrmRcp.z = 1.0 / Result.Nrm.z
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION line(PosX AS FLOAT, PosY AS FLOAT,
              NrmX AS FLOAT, NrmY AS FLOAT )
    Result AS Line
    Result.Pos.x = PosX
    Result.Pos.y = PosY

    Result.Nrm.x = NrmX
    Result.Nrm.y = NrmY

    Result.NrmRcp.x = 1.0 / Result.Nrm.x
    Result.NrmRcp.y = 1.0 / Result.Nrm.y
ENDFUNCTION Result


FUNCTION line2(PosA_X AS FLOAT, PosA_Y AS FLOAT,
               PosB_X AS FLOAT, PosB_Y AS FLOAT )
    Result AS Line2
    Result.PosA.x = PosA_X
    Result.PosA.y = PosA_Y
    Result.PosB.x = PosB_X
    Result.PosB.y = PosB_Y

    Result.Nrm.x = PosB_X - PosA_X  :  Result.Nrm.x = Result.Nrm.x * (1.0 / Result.Nrm.x)
    Result.Nrm.y = PosB_Y - PosA_Y  :  Result.Nrm.y = Result.Nrm.y * (1.0 / Result.Nrm.y)

    Result.NrmRcp.x = 1.0 / Result.Nrm.x
    Result.NrmRcp.y = 1.0 / Result.Nrm.y
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//FUNCTION SetRayPos(RayA REF AS Ray, PosX AS FLOAT, PosY AS FLOAT, PosZ AS FLOAT)
//    Result AS Ray
//    Result.Pos.x = PosX
//    Result.Pos.y = PosY
//    Result.Pos.z = PosZ
//ENDFUNCTION Result

// MyRay.Pos = vec3(NewX,NewY,NewZ)


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION SetRayNrm(RayA REF AS Ray, NrmX AS FLOAT, NrmY AS FLOAT, NrmZ AS FLOAT)
    Result AS Ray

    Result = RayA

    Result.Nrm.x = NrmX
    Result.Nrm.y = NrmY
    Result.Nrm.z = NrmZ

    Result.NrmRcp.x = 1.0 / Result.Nrm.x
    Result.NrmRcp.y = 1.0 / Result.Nrm.y
    Result.NrmRcp.z = 1.0 / Result.Nrm.z
ENDFUNCTION Result


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
FUNCTION SetLineNrm(LineA REF AS Line, NrmX AS FLOAT, NrmY AS FLOAT)
    Result AS Line

    Result = LineA

    Result.Nrm.x = NrmX
    Result.Nrm.y = NrmY

    Result.NrmRcp.x = 1.0 / Result.Nrm.x
    Result.NrmRcp.y = 1.0 / Result.Nrm.y
ENDFUNCTION Result

