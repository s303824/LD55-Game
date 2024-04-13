extends CanvasLayer
class_name StrikeDisplay

@onready var strike_scene = preload ("res://Level/Strikes/strike.tscn")
@onready var container: HBoxContainer = $MarginContainer/Container
@export var NUM_STRIKES: int = 3

var current_strike: int

# TODO: connect to manager
func handle_strike() -> void:
	if current_strike > container.get_child_count():
		return
	container.get_child(current_strike).set_used()
	current_strike += 1
	
func handle_restore() -> void:
	if current_strike < 0:
		return
	container.get_child(current_strike).reset()
	current_strike += 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assert(NUM_STRIKES > 0)
	current_strike = 0
	for i in range(NUM_STRIKES):
		var strike = strike_scene.instantiate()
		container.add_child(strike)
		
	DialogueManager.scripted_event.connect(strike_event)
	
func strike_event(event:String):
	match event:
		"strike":
			handle_strike()
		"restore":
			handle_restore()
