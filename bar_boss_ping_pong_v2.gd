extends AnimatedSprite2D

func _ready():
	# 连接动画完成信号
	animation_finished.connect(_on_animation_finished)
	# 开始播放正向动画
	play("forward")

func _on_animation_finished():
	# 根据当前播放的动画切换到另一个
	if animation == "forward":
		play("backward")
	else:
		play("forward") 