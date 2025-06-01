extends Node2D

@onready var animation_player = $AnimationPlayer
@onready var sprite = $AnimatedSprite2D

var current_frame = 0
var total_frames = 66  # 你的动画总帧数（从bar_boss_14到bar_boss_79）
var is_forward = true
var frame_duration = 1.0 / 16.0  # 16 FPS

func _ready():
	# 设置定时器来控制帧切换
	var timer = Timer.new()
	timer.wait_time = frame_duration
	timer.timeout.connect(_update_frame)
	timer.autostart = true
	add_child(timer)

func _update_frame():
	if is_forward:
		current_frame += 1
		if current_frame >= total_frames - 1:
			is_forward = false
	else:
		current_frame -= 1
		if current_frame <= 0:
			is_forward = true
	
	# 设置当前帧
	sprite.frame = current_frame 