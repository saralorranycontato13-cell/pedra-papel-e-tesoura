
extends Node2D

const TAMANHO_CELULA = 32
const COLUNAS = 40
const LINHAS = 24

func _ready():
	queue_redraw()

func _draw():
	for y in range(LINHAS):
		for x in range(COLUNAS):
			var cor

			if (x + y) % 2 == 0:
				cor = Color("#4c9a54")
			else:
				cor = Color("#519f59")

			draw_rect(
				Rect2(
					x * TAMANHO_CELULA,
					y * TAMANHO_CELULA,
					TAMANHO_CELULA,
					TAMANHO_CELULA
				),
				cor
			)
