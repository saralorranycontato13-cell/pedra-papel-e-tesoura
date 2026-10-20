extends Control

@export var scroll_speed: float = 100.0
# Insira aqui o caminho correto da sua cena de menu (ou arraste do FileSystem no Inspetor)
@export_file("*.tscn") var next_scene: String = "res://scenes/main_menu.tscn"

@onready var rich_text_label: RichTextLabel = $RichTextLabel

func _ready() -> void:
	# Garante que o texto comece bem no topo/centro
	rich_text_label.anchor_left = 0.0
	rich_text_label.anchor_right = 1.0
	rich_text_label.offset_top = size.y # Começa abaixo da tela visível

func _process(delta: float) -> void:
	# Move o Label para cima
	rich_text_label.position.y -= scroll_speed * delta

	# Pular ao pressionar ESC
	if Input.is_action_just_pressed("ui_cancel"):
		finish_credits()

	# Se o final do texto passou do topo da tela, encerra
	if rich_text_label.position.y + rich_text_label.size.y < 0:
		finish_credits()

func finish_credits() -> void:
	if next_scene != "" and ResourceLoader.exists(next_scene):
		get_tree().change_scene_to_file(next_scene)
	else:
		# Em vez de fechar o jogo, apenas avisa no console do Godot
		print("Créditos concluídos! (Nenhuma próxima cena válida configurada no Inspetor)")
