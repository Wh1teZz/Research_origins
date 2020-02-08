# Initializes the map's pawns and emits signals so the
# Game node can start encounters
# Processes in pause mode
extends Node
class_name LocalMap

signal dialogue_finished()

onready var dialogue_box = $MapInterface/DialogueBox

func _ready() -> void:
	assert(dialogue_box)
	for action in get_tree().get_nodes_in_group("map_action"):
		(action as MapAction).initialize(self)

func play_dialogue(data):
	dialogue_box.start(data)
	yield(dialogue_box, "dialogue_ended")