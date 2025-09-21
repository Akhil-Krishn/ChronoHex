extends Node2D

@onready var tracking_timer: Timer = $Tracking_timer
@onready var player: CharacterBody2D = $Player
@onready var teleportation: Label = $UI/Panel/Teleportation
var player_position
const tracking_time_val = 9
const time_val = 3
var tracking_time = tracking_time_val
var time = time_val
var timer_bool = false
var Fxs
var loop_effect = preload("res://Scenes/loop_effect.tscn")
@onready var teleport_sfx: AudioStreamPlayer2D = $Teleport_sfx


#TIMER STUFF
func _on_tracking_timer_timeout() -> void:
	tracking_time-=1
	if timer_bool:
		time-=1
		teleportation.text = "Time Magic in: " + str(tracking_time)+"\nLooping in: " + str(time)
	else:
		teleportation.text = "Time Magic in: " + str(tracking_time)
		
	if(time == 0):
		time = time_val
		#we play here to play audio faster?
		teleport_sfx.play()
		call_timer_function()
		
	if(tracking_time == 0):
		tracking_time = tracking_time_val
		call_tracking_timer_function()
	
func call_tracking_timer_function():
	#print("Tracking Timer Called")
	timer_bool = true
	player_position = player.position + Vector2(0,-25)
	Fxs = loop_effect.instantiate()
	Fxs.position = player_position
	Fxs.scale = Vector2(0.65,0.65)
	add_child(Fxs)

func call_timer_function():
	#print("Timer called")
	player.position = player_position
	Fxs.queue_free()
	timer_bool = false
	
	
	
#OTHER STUFF
func _process(_delta: float) -> void:
	if(GlobalVals.platform1_triggered):
		add_platform1()
		GlobalVals.platform1_triggered = false
	if(GlobalVals.platform2_triggered):
		add_platform2()
		GlobalVals.platform2_triggered = false
	if(GlobalVals.platform3_triggered):
		add_platform3()
		GlobalVals.platform3_triggered = false

func _ready() -> void:
	GlobalVals.platform1_triggered = false
	GlobalVals.platform2_triggered = false
	GlobalVals.player_hit = false
	GlobalVals.platform3_triggered = false
	#print("Removed platform 1")
	get_node("Platform").visible = false
	get_node("Platform").process_mode = Node.PROCESS_MODE_DISABLED
	#print("Removed platform 2")
	get_node("Platform2").visible = false
	get_node("Platform2").process_mode = Node.PROCESS_MODE_DISABLED
	get_node("Platform3").visible = false
	get_node("Platform3").process_mode = Node.PROCESS_MODE_DISABLED

func add_platform1():
	get_node("Platform").process_mode = Node.PROCESS_MODE_INHERIT
	#print("Added platform 1")
	get_node("Platform").visible = true
	
func add_platform2():
	get_node("Platform2").process_mode = Node.PROCESS_MODE_INHERIT
	#print("Added platform 2")
	get_node("Platform2").visible = true
	
func add_platform3():
	get_node("Platform3").process_mode = Node.PROCESS_MODE_INHERIT
	#print("Added platform 2")
	get_node("Platform3").visible = true
