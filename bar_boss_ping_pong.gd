extends AnimatedSprite2D

var is_playing_forward = true

func _ready():
	# 连接动画完成信号
	animation_finished.connect(_on_animation_finished)
	# 开始播放动画
	play("default")

func _on_animation_finished():
	if is_playing_forward:
		# 如果是正向播放完成，切换到反向播放
		is_playing_forward = false
		play_backwards("default")
	else:
		# 如果是反向播放完成，切换到正向播放
		is_playing_forward = true
		play("default") 
