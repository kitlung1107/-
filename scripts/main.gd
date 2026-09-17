extends Node3D

const Player = preload("res://scripts/player.gd")
const Controls = preload("res://scripts/controls.gd")

func _ready() -> void:
	var environment := WorldEnvironment.new()
	var settings := Environment.new()
	settings.background_mode = Environment.BG_COLOR
	settings.background_color = Color("a5d8ed")
	settings.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	settings.ambient_light_color = Color("ffffff")
	settings.ambient_light_energy = 0.75
	settings.tonemap_mode = Environment.TONE_MAPPER_LINEAR
	environment.environment = settings
	add_child(environment)
	var sun := DirectionalLight3D.new()
	sun.rotation_degrees = Vector3(-55, -30, 0)
	sun.light_energy = 0.8
	add_child(sun)
	var ground := StaticBody3D.new()
	ground.name = "Ground"
	var mesh := MeshInstance3D.new()
	var plane := PlaneMesh.new()
	plane.size = Vector2(120, 120)
	mesh.mesh = plane
	var material := ShaderMaterial.new()
	material.shader = load("res://shaders/grass.gdshader")
	mesh.material_override = material
	ground.add_child(mesh)
	var collider := CollisionShape3D.new()
	var box := BoxShape3D.new()
	box.size = Vector3(120, 1, 120)
	collider.shape = box
	collider.position.y = -0.5
	ground.add_child(collider)
	add_child(ground)
	var player := Player.new()
	player.name = "Player"
	player.position = Vector3(0, 0.2, 6)
	add_child(player)
	player.camera.rotation_degrees.x = -12
	var canvas := CanvasLayer.new()
	canvas.name = "Interface"
	add_child(canvas)
	var controls := Controls.new()
	controls.name = "Controls"
	controls.player = player
	canvas.add_child(controls)
