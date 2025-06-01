# Godot 精灵动画 Ping-Pong 效果

这个项目展示了如何在 Godot 4 中实现精灵动画的"乒乓球"播放效果，让动画从第一帧播放到最后一帧，然后反向播放回第一帧，如此循环往复，消除传统循环播放的违和感。

## 🎬 效果演示

![Ping-Pong动画演示](bar_boss_screen_live.mp4)

> 📹 **演示视频**: 展示了酒吧老板娘角色的平滑呼吸动画效果，采用ping-pong播放模式，无任何跳跃或违和感。

*如果视频无法播放，请点击 [这里](bar_boss_screen_live.mp4) 下载查看*

### ✨ 效果特点
- 🔄 **平滑循环**: 从第一帧到最后一帧，再反向播放回第一帧
- 🎯 **无违和感**: 消除传统循环播放的突兀跳跃
- ⚡ **高性能**: 使用Godot内置动画系统，零额外开销
- 🛠️ **易于实现**: 仅需几行代码即可实现

## 项目概述

- **引擎版本**: Godot 4.x
- **主要功能**: 酒吧老板娘角色的呼吸动画，采用ping-pong播放模式
- **动画帧数**: 66帧 (bar_boss_14.png 到 bar_boss_79.png)
- **播放速度**: 16 FPS

## 文件结构

```
bar_boss/
├── main.tscn                           # 主场景文件
├── bar_boss_ping_pong.gd              # 主要的ping-pong动画脚本 ⭐
├── bar_boss_ping_pong_v2.gd           # 备选方案：双动画版本
├── bar_boss_animation_player.gd       # 备选方案：AnimationPlayer版本
├── bar_boss/                          # 动画帧图片目录
│   ├── bar_boss_14.png               # 动画起始帧
│   ├── bar_boss_15.png
│   ├── ...
│   └── bar_boss_79.png               # 动画结束帧
└── README.md                          # 项目说明文档
```

## 实现方案

### 方案一：脚本控制播放方向 ⭐ (推荐)

**文件**: `bar_boss_ping_pong.gd`

这是最简单有效的实现方式：

```gdscript
extends AnimatedSprite2D

var is_playing_forward = true

func _ready():
    # 连接动画完成信号
    animation_finished.connect(_on_animation_finished)
    # 开始播放动画
    play("default")

func _on_animation_finished():
    if is_playing_forward:
        # 正向播放完成，切换到反向播放
        is_playing_forward = false
        play_backwards("default")
    else:
        # 反向播放完成，切换到正向播放
        is_playing_forward = true
        play("default")
```

**优点**:
- 代码简洁，易于理解
- 无需修改现有的SpriteFrames资源
- 性能良好
- 维护成本低

### 方案二：双动画版本

**文件**: `bar_boss_ping_pong_v2.gd`

需要在SpriteFrames中创建两个动画：`forward` 和 `backward`。

### 方案三：AnimationPlayer版本

**文件**: `bar_boss_animation_player.gd`

使用Timer手动控制帧切换，提供最大的灵活性。

## 使用方法

1. **导入项目**
   ```bash
   git clone [你的仓库地址]
   ```

2. **在Godot中打开项目**
   - 启动Godot 4
   - 点击"导入"
   - 选择项目文件夹中的 `project.godot`

3. **应用ping-pong效果**
   - 选择场景中的 `AnimatedSprite2D` 节点
   - 在检查器中点击"附加脚本"
   - 将 `bar_boss_ping_pong.gd` 的内容复制粘贴到脚本编辑器
   - 取消勾选 `AnimatedSprite2D` 的 `Autoplay` 属性

4. **运行项目**
   - 按 F5 或点击播放按钮
   - 观察流畅的ping-pong动画效果

## 技术要点

### 核心原理
- 利用 `AnimatedSprite2D` 的 `animation_finished` 信号
- 通过 `play()` 和 `play_backwards()` 方法切换播放方向
- 使用布尔变量跟踪当前播放方向

### 性能优化
- 信号连接在 `_ready()` 中完成，避免重复连接
- 使用内置的播放方法，无需手动计算帧索引
- 最小化内存占用

### 扩展性
- 可以轻松调整播放速度
- 支持多个动画的ping-pong播放
- 可以添加暂停/恢复功能

## 自定义配置

### 调整播放速度
```gdscript
# 在 _ready() 函数中添加
speed_scale = 0.5  # 减慢到一半速度
```

### 添加播放控制
```gdscript
func pause_animation():
    pause()

func resume_animation():
    play()
```

## 常见问题

**Q: 为什么不直接使用循环播放？**
A: 传统的循环播放会在最后一帧直接跳回第一帧，造成视觉上的突兀感。Ping-pong播放通过反向播放提供了平滑的过渡。

**Q: 可以用于其他类型的动画吗？**
A: 是的！这个方法适用于任何需要平滑循环的精灵动画，如角色呼吸、物品浮动、UI元素脉冲等。

**Q: 性能如何？**
A: 非常好。这个方法使用Godot内置的动画系统，没有额外的性能开销。

## 贡献

欢迎提交Issue和Pull Request来改进这个项目！

## 许可证

本项目采用 MIT 许可证。详见 LICENSE 文件。

---

**作者**: [lemonhall]  
**创建时间**: 2025年6月1日  
**Godot版本**: 4.x  
**标签**: `godot` `animation` `sprite` `ping-pong` `game-development` 