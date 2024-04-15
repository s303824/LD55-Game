extends CanvasLayer

@onready var title = $TitleMenuContainer
@onready var background = $TextureRect
@onready var blood = $ColorRect
@onready var track = preload ("res://Assets/Music/hammond_hill.wav")

func _ready():
	MusicPlayer.start_playing(track, -10)
	OptionsMenu.exit.connect(back_button)
	TransitionManager.fade_from_black()

func _on_options_pressed() -> void:
	background.hide()
	title.hide()
	OptionsMenu.show()

func back_button() -> void:
	background.show()
	title.show()
	OptionsMenu.hide()

func _on_start_pressed() -> void:
	GameManager.start_game()

func _on_quit_game_pressed() -> void:
	GameManager.quit_game()
