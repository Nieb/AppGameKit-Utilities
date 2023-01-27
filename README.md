# AppGameKit Utilities
A collection of various utility functions.

### ***This is all very much a work in progress.***
<br/>

## A note about Vectors & Thetas:
Upon dealing with the incoherent mess of 3D coordinate spaces in ComputerGraphics, Mathematics, Aviation, etc.<br/>
Then, learning that "there is no 'correct' coordinate space", they are arbitrary.<br/>
This is the coordinate space that I've settled upon using:

![Coordinate System](README_Coordinate_System.png)

<br/>

## Variable & Function Naming:
These rules are adhered to, unless I've overlooked something. Or, the code is old and needs revisited.

* Naming follows hierarchal ordering. That being: ThingAttribute.<br/>
  Example: instead of "NewLength", "LengthNew" is used.<br/>
  *Note: this is the opposite of typical English grammar.*

* Naming uses Capitals for the first letter of every word, lowercase for the rest. This includes acronyms.<br/>
  Exceptions include constants and some other rare occasions.

* An attempt is made to make the nameing & usage of variable & function names read like a natural language sentence.

* Underscores are typically avoided.<br/>
  There are exceptions...

* Single-letter & overly-truncated variable/function names are avoided, unless truncation is desired for compact code.<br/>
#### Common Abbreviations:
```
Pos = "Position"
Vel = "Velocity"
Rot = "Rotation"
Siz = "Size"
Scl = "Scale"
Bnd = "Bounds"
Nrm = "Normal"
Rds = "Radius"
Dir = "Direction" or "Directory"
Lok = "Look"
          The normalized-vector direction something is facing.
Trgt = "Target"
          Used for interpolating things like Position, Velocity, Rotation, etc.  
            Example:  Thing.VelTrgt  Thing.RotTrgt

Clr = "Color"

Dlt = "Delta"

Pch = "Pitch"
Yaw = "Yaw"
Rol = "Roll"

Deg = "Degrees"
Rad = "Radian"

Inv = "Inverse"
Cmp = "Complement"
Rcp = "Reciprocal"

Pnt = "Point"
Lin = "Line"

Cir = "Circle"
Tri = "Triangle"
Rct = "Rectangle"

Vrt = "Vertex"
Edg = "Edge"
Ray = "Ray"

Pln = "Plane"
Sph = "Sphere"
Box = "Right-Angled-Quadrilateral-Hexahedron" :P
```

* Descriptive indexes are always used, never i, j, x, y, a, b, etc.<br/>
#### Index Examples:
```
FOR iThg = 0 TO Thing.length
    Print(Thing[iThg])
NEXT iThg

FOR iPlyr = 0 TO Player.length
    Player[iPlyr].Pos.x = Player[iPlyr].Pos.x + Player[iPlyr].Vel.x
NEXT iPlyr

// In the case that coordinate indexes are used, iX,iY,iZ, iU,iV, etc are used.
FOR iY = 0 TO Thing_SizY
    FOR iX = 0 TO Thing_SizX
        Print(Thing[iY,iX])
    NEXT iX
NEXT iY
// And if desitinction is desired, iThgX, iThgY, etc.
FOR iThgY = 0 TO Thing_SizY
    FOR iThgX = 0 TO Thing_SizX
        Print(Thing[iThgY,iThgX])
    NEXT iThgX
NEXT iThgY
```
