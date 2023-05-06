
'main program
Strict

Framework openb3d.b3dglgraphics

Graphics3D 800,600, 0, 3

Include "player.bmx"
Include "camera.bmx"
Include "createTerrain.bmx"
Include "CameraFunctions.bmx"


Global frame:Int

' Light the world, todo;maybe put the lighting in bmx zone file. for now it is in main.
Local light:TLight=CreateLight()
RotateEntity light,90,0,0


While Not KeyDown( KEY_ESCAPE )
 frame = frame + 1
orbitcamera(camera,Player,2)
	If KeyDown( KEY_RIGHT )=True Then TurnEntity Player,0,-1,0
	If KeyDown( KEY_LEFT )=True Then TurnEntity Player,0,1,0
	If KeyDown( KEY_DOWN )=True Then MoveEntity Player,0,0,-1
	If KeyDown( KEY_UP )=True Then MoveEntity Player,0,0,1
	If KeyDown( key_W )=True Then MoveEntity Player,0,1,0
	If KeyDown( key_S )=True Then MoveEntity Player,0,-1,0
Local x#=EntityX(camera)
Local y#=EntityY(camera)
Local z#=EntityZ(camera)

Local terra_y#=TerrainY(terrain,x#,y#,z#)+5

'PositionEntity camera,x#,terra_y#,z#

RenderWorld

Text 0,0,"Use cursor keys to move about the terrain"

Flip


Wend
