# 🚗 JEEVAN - AI-Powered Automotive Safety App

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)

*Premium AI-powered automotive safety application designed to provide life-saving assistance and peace of mind on every journey.*

</div>

## 🌟 Features

### 🛡️ Core Safety Features
- **Real-time Impact Detection** - Advanced AI algorithms detect vehicle impacts
- **Emergency Response System** - Automatic emergency contact notifications
- **Live GPS Tracking** - Real-time location monitoring and sharing
- **Smart Dashboard** - Comprehensive vehicle status monitoring
- **Emergency Contacts Management** - Quick access to emergency services and personal contacts

### 🎨 Modern UI/UX
- **Glassmorphism Design** - Beautiful glass-effect UI components
- **Neon Accent Colors** - Futuristic automotive-inspired color scheme
- **Dark Theme** - Optimized for night driving and reduced eye strain
- **Smooth Animations** - Fluid transitions and interactive elements
- **3D Vehicle Visualization** - Interactive 3D car models with holographic effects

### 📱 Cross-Platform Support
- **Android** - Native Android app with Material Design
- **iOS** - Native iOS app with platform-specific optimizations
- **Web** - Progressive Web App (PWA) support

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.6.0 or higher)
- Dart SDK
- Android Studio / Xcode (for mobile development)
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/jeevan-app.git
   cd jeevan-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   # For Android
   flutter run -d android
   
   # For iOS
   flutter run -d ios
   
   # For Web
   flutter run -d web
   ```

### 🔧 Development Setup

1. **Configure your IDE**
   - Install Flutter and Dart plugins
   - Enable hot reload for faster development

2. **Set up platform-specific requirements**
   
   **Android:**
   - Update `android/app/build.gradle` with your signing configuration
   - Configure Firebase (if using cloud features)
   
   **iOS:**
   - Open `ios/Runner.xcworkspace` in Xcode
   - Configure signing certificates and provisioning profiles
   - Update bundle identifier if needed

## 📁 Project Structure

```
jeevan/
├── lib/
│   ├── main.dart                 # App entry point
│   ├── nav.dart                  # Navigation configuration
│   ├── theme.dart                # App theme and styling
│   ├── models/
│   │   └── app_state.dart        # Application state management
│   ├── screens/
│   │   ├── dashboard_screen.dart      # Main dashboard
│   │   ├── vehicle_setup_screen.dart  # Initial setup
│   │   ├── gps_tracking_screen.dart   # GPS tracking
│   │   ├── impact_detected_screen.dart # Emergency response
│   │   ├── settings_screen.dart       # App settings
│   │   ├── emergency_contacts_screen.dart # Contact management
│   │   └── add_contact_screen.dart    # Add new contacts
│   └── widgets/
│       ├── glass_card.dart           # Glassmorphism components
│       ├── glass_nav_bar.dart        # Navigation bar
│       ├── neon_button.dart          # Styled buttons
│       ├── custom_back_button.dart   # Navigation button
│       └── call_flow.dart            # Emergency call flow
├── assets/
│   ├── images/                   # App images and graphics
│   └── icons/                    # App icons
├── android/                      # Android-specific files
├── ios/                         # iOS-specific files
├── web/                         # Web-specific files
└── pubspec.yaml                 # Dependencies and configuration
```

## 🎨 Design System

### Color Palette
- **Obsidian Black** (`#050505`) - Primary background
- **Neon Cyan** (`#00F2FF`) - Primary accent
- **Electric Blue** (`#2E59FF`) - Secondary accent
- **Alert Red** (`#FF3131`) - Emergency/danger states
- **Neon Green** (`#2DFF57`) - Success/active states

### Typography
- **Primary Font**: Exo 2 - Modern, automotive-inspired typeface
- **Responsive scaling** for different screen sizes
- **High contrast** for readability in various lighting conditions

### Components
- **Glass Cards** - Translucent containers with blur effects
- **Neon Buttons** - Glowing interactive elements
- **Animated Icons** - Smooth transitions and micro-interactions

## 🛠️ Dependencies

### Core Dependencies
```yaml
flutter: sdk: flutter
provider: ^6.1.2          # State management
go_router: ^16.2.0        # Navigation
google_fonts: ^6.1.0      # Typography
flutter_animate: ^4.0.0   # Animations
```

### Map & Location
```yaml
flutter_map: ^8.0.0       # Interactive maps
latlong2: 0.9.1           # Coordinate handling
```

### Development
```yaml
flutter_test: sdk: flutter
flutter_lints: ^5.0.0     # Code quality
flutter_launcher_icons: ^0.13.1  # Icon generation
```

## 🚦 App Flow

1. **Vehicle Setup** - Initial configuration with user and vehicle details
2. **Dashboard** - Main interface showing system status and quick actions
3. **GPS Tracking** - Real-time location monitoring with map integration
4. **Emergency Detection** - Automatic impact detection and response system
5. **Settings & Contacts** - Configuration and emergency contact management

## 🔒 Safety Features

### Impact Detection Algorithm
- Multi-sensor data fusion
- Machine learning-based pattern recognition
- False positive reduction mechanisms
- Configurable sensitivity settings

### Emergency Response
- Automatic emergency service contact
- GPS location sharing
- Medical information transmission
- Manual emergency activation

### Privacy & Security
- Local data storage priority
- Encrypted communication
- User consent for data sharing
- GDPR compliance ready

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines
- Follow Flutter/Dart style guidelines
- Write tests for new features
- Update documentation as needed
- Ensure cross-platform compatibility

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

- **Documentation**: Check our [Wiki](../../wiki) for detailed guides
- **Issues**: Report bugs via [GitHub Issues](../../issues)
- **Discussions**: Join our [GitHub Discussions](../../discussions)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Google Fonts for typography resources
- OpenStreetMap contributors for mapping data
- The open-source community for inspiration and tools

---

<div align="center">

**Built with ❤️ for safer journeys**

[Report Bug](../../issues) • [Request Feature](../../issues) • [Documentation](../../wiki)

</div>