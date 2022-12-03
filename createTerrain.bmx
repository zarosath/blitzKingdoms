' CreateTerrain.bmx

Strict

Framework openb3d.b3dglgraphics

Graphics3D 800,600

Local camera:TCamera=CreateCamera()
PositionEntity camera,130,1,-130

Local light:TLight=CreateLight()
RotateEntity light,90,0,0
' Load terrain
Local terrain:TTerrain=LoadTerrain( "Media/Zone/terrain_hmap.bmp" )
' load player mesh
Local player:TMesh=LoadAnimMesh("Media/models/Player/player.b3d")

' Set terrain detail, enable vertex morphing
'TerrainDetail terrain,4000,True

' Scale terrain
'ScaleEntity terrain,1,1,1
ScaleEntity player,1,1,1

' Texture terrain
Local grass_tex:TTexture=LoadTexture( "Media/Zone/terrain_colormap.bmp" )
EntityTexture terrain,grass_tex
ScaleTexture grass_tex,1,1

While Not KeyDown( KEY_ESCAPE )

	If KeyDown( KEY_RIGHT )=True Then TurnEntity camera,0,-1,0
	If KeyDown( KEY_LEFT )=True Then TurnEntity camera,0,1,0
	If KeyDown( KEY_DOWN )=True Then MoveEntity camera,0,0,-1
	If KeyDown( KEY_UP )=True Then MoveEntity camera,0,0,1
	If KeyDown( key_W )=True Then MoveEntity camera,0,1,0
	If KeyDown( key_S )=True Then MoveEntity camera,0,-1,0
Local x#=EntityX(camera)
Local y#=EntityY(camera)
Local z#=EntityZ(camera)

Local terra_y#=TerrainY(terrain,x#,y#,z#)+5

PositionEntity camera,x#,terra_y#,z#

RenderWorld

Text 0,0,"Use cursor keys to move about the terrain"

Flip

Wend

End 