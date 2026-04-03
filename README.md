```markdown
# 📺 YouTube Lite (Flutter WebView App)

A simple **YouTube-like mobile app** built with Flutter using `webview_flutter`.  
This project loads YouTube inside a custom Flutter UI and removes unnecessary UI elements like the top bar and bottom navigation for a cleaner experience.

---

## ✨ Features

- 📱 YouTube WebView integration
- 🎯 Custom Flutter UI (YouTube-style sidebar)
- 🔄 Full-screen video experience
- ⏳ Full-screen loading overlay
- 🎨 Custom AppBar using Stack (no default AppBar)
- 🚀 Smooth navigation between screens

---

## 🛠️ Tech Stack

- Flutter
- Dart
- webview_flutter

---

## 📂 Project Structure

lib/
├── core/
│   └── constants/
│       ├── app_colors.dart
│       ├── app_strings.dart
│       └── youtube_urls.dart
│
├── presentation/
│   ├── core/
│   │   └── widgets/
│   │       └── full_screen_loading.dart
│   │
│   └── screens/
│       ├── home/
│       │   └── widgets/
│       │       └── youtube_nav_tile.dart
│       │
│       └── youtube/
│           └── youtube_screen.dart
│
└── main.dart

---

## 🚀 How It Works

1. App loads a custom **Home Screen**
2. User selects a navigation item (Home, Shorts, Trending, etc.)
3. WebView opens YouTube with selected URL
4. JavaScript removes:
   - Top navigation bar
   - Bottom pivot bar
5. Custom Flutter AppBar overlays the WebView
6. Full-screen clean YouTube experience

---

## 🧠 Key Implementation

### 🔹 Remove YouTube UI using JavaScript
```dart
document.querySelectorAll('ytm-mobile-topbar-renderer').forEach(el => el.remove());
document.querySelectorAll('ytm-pivot-bar-renderer').forEach(el => el.remove());
````

---

### 🔹 Custom AppBar using Stack

* Replaces default AppBar
* Fully customizable UI
* Works perfectly with WebView fullscreen

---

### 🔹 Full Screen Loading Overlay

Displays loading indicator while page is loading:

```dart
FullScreenLoadingOverlay(
  isLoading: isLoading,
  child: WebViewWidget(controller: _controller),
)
```

---

## 📸 Screenshots (Optional)
<img width="300" alt="Screenshot_20260404_012639" src="https://github.com/user-attachments/assets/8e8cfd8c-96d0-47fa-a9d2-4d697a4db5b4" />
<img width="300" alt="Screenshot_20260404_012711" src="https://github.com/user-attachments/assets/7cb050e2-6b0d-47c6-a5f2-8bd2f2defb16" />


---

## ⚙️ Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/your-username/youtube-lite-flutter.git
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Run the app

```bash
flutter run
```

---

## 📌 Requirements

* Flutter SDK (latest stable)
* Android Studio / VS Code
* Internet connection (for WebView content)

## 🤝 Contributing

Pull requests are welcome. For major changes, please open an issue first.

