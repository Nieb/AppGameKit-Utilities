//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  SetObjectDepthReadMode( ObjID, MODE )
#Constant ODRM_NeverPass          = 0
#Constant ODRM_LessThan           = 1
#Constant ODRM_Equal              = 2
#Constant ODRM_LessThanOrEqual    = 3
#Constant ODRM_GreaterThan        = 4
#Constant ODRM_NotEqual           = 5
#Constant ODRM_GreaterThanOrEqual = 6
#Constant ODRM_AlwaysPass         = 7


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  SetSpriteTransparency( SprID, BLENDMODE )
//  SetObjectTransparency( ObjID, BLENDMODE )
#Constant BLENDMODE_Off      = 0 // Default for OBJECT.
#Constant BLENDMODE_Alpha    = 1 // Default for SPRITE.
#Constant BLENDMODE_Additive = 2

//  Transparency without blending.
//      SetObjectAlphaMask( ObjID, 0|1 )


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  SetTextAlignment( TxtID , ALIGN )
#Constant TXT_Lf = 0
#Constant TXT_Cn = 1
#Constant TXT_Rt = 2


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  PlaySprite( SprID, Fps, LOOP )
//  PlayObjectAnimation( ObjID, AnimNameString, StartTime, EndTime, LOOP, TweenTime )
//  PlaySound( SndID, Volume, LOOP )
//  PlayMusic( MusID, LOOP )
#Constant NOLOOP = 0
#Constant LOOPIT = 1

