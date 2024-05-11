extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Panel/VBoxContainer/PlayBtn.grab_focus()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game/game.tscn")


func _on_options_btn_pressed() -> void:
	pass # Replace with function body.


func _on_quit_btn_pressed() -> void:
	get_tree().quit()


func _on_play_btn_mouse_entered() -> void:
	$Panel/VBoxContainer/PlayBtn.grab_focus()
	pass # Replace with function body.


func _on_options_btn_mouse_entered() -> void:
	$Panel/VBoxContainer/OptionsBtn.grab_focus()
	pass # Replace with function body.


func _on_quit_btn_mouse_entered() -> void:
	$Panel/VBoxContainer/QuitBtn.grab_focus()
	pass # Replace with function body.
