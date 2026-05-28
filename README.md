# 🎵 Vinyl Record Player Animation 

A minimal Flutter music player UI inspired by classic vinyl record players, built using `CustomPainter`, animations, and layered UI composition.

The project explores Flutter’s rendering system by creating a fully custom-drawn vinyl record with smooth playback animation and responsive layout behavior.

---
## 🎬 Preview

<img width="1040" height="878" alt="Animation" src="https://github.com/user-attachments/assets/a7390e80-5d60-4aa5-ae5b-6a2c03488560" />
---

## ✨ Features

- Custom vinyl record built using `CustomPainter`
- Smooth rotation animation during playback
- Play / pause state-driven UI updates
- Mechanical tone arm with layered composition
- Responsive layout for portrait and landscape modes
- Dark themed UI with gradients and depth effects

---

## 🎨 Custom Painter Rendering

The vinyl record is fully drawn using Flutter’s Canvas API, including:

- Record grooves
- Center label
- Outer rim detailing
- Lighting and shadow effects

No image assets are used — everything is procedurally rendered.

---

## 🔄 Animation System

Built using `AnimationController` to handle:

- Continuous vinyl rotation
- Smooth play/pause transitions
- Synchronized UI state updates

---

## 📱 Responsive Layout

The UI adapts across screen sizes using `MediaQuery`:

- Portrait layout (`portrait_mode.dart`)
- Landscape layout (`landscape_mode.dart`)
- Scalable positioning and spacing

---

## 🧩 Project Structure

- `main.dart` – App entry point and state management
- `portrait_mode.dart` – Vertical UI layout
- `landscape_mode.dart` – Horizontal UI layout
- `music_player_painter.dart` – Vinyl rendering logic
- `record_stylus_painter.dart` – Tone arm & stylus drawing
- `record_stylus_stack.dart` – Mechanical assembly layout

---

## 🛠 Tech Stack

- Flutter
- Dart
- CustomPainter
- Canvas API
- AnimationController
- Matrix4 Transforms

---

## 🚀 Getting Started

```bash
git clone <your-repo-url>
cd custom-vinyl-player
flutter pub get
flutter run
```

---

## 🧠 Notes

This project was created to explore Flutter’s capability for building rich animated UIs using only code-based rendering techniques.

---

## ⭐ License

Free to use for learning and personal projects.

If you use this project or its parts, credit is appreciated.
