# Contributing to Jeevan

Thank you for your interest in contributing to Jeevan! This document provides guidelines and information for contributors.

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.6.0+)
- Dart SDK
- Git
- Android Studio / VS Code with Flutter extensions
- Xcode (for iOS development on macOS)

### Development Setup

1. **Fork and Clone**
   ```bash
   git clone https://github.com/yourusername/jeevan-app.git
   cd jeevan-app
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Run Tests**
   ```bash
   flutter test
   ```

4. **Start Development**
   ```bash
   flutter run
   ```

## 📋 How to Contribute

### Reporting Bugs
- Use GitHub Issues to report bugs
- Include detailed steps to reproduce
- Provide device/platform information
- Include screenshots if applicable

### Suggesting Features
- Open a GitHub Issue with the "enhancement" label
- Describe the feature and its benefits
- Provide mockups or examples if possible

### Code Contributions

1. **Create a Branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make Changes**
   - Follow the coding standards below
   - Write tests for new functionality
   - Update documentation as needed

3. **Test Your Changes**
   ```bash
   flutter test
   flutter analyze
   ```

4. **Commit and Push**
   ```bash
   git add .
   git commit -m "feat: add your feature description"
   git push origin feature/your-feature-name
   ```

5. **Create Pull Request**
   - Use the PR template
   - Link related issues
   - Provide clear description of changes

## 📝 Coding Standards

### Dart/Flutter Guidelines
- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use `flutter analyze` to check code quality
- Format code with `dart format`
- Use meaningful variable and function names

### Code Structure
```dart
// Good: Clear, descriptive naming
class VehicleStatusCard extends StatelessWidget {
  final VehicleStatus status;
  final VoidCallback onTap;
  
  const VehicleStatusCard({
    super.key,
    required this.status,
    required this.onTap,
  });
}

// Bad: Unclear naming
class VSC extends StatelessWidget {
  final dynamic s;
  final Function() ot;
}
```

### File Organization
- Group related files in appropriate directories
- Use descriptive file names
- Keep files focused on single responsibility

### Documentation
- Add doc comments for public APIs
- Include usage examples for complex widgets
- Update README for significant changes

## 🎨 Design Guidelines

### UI/UX Principles
- Maintain glassmorphism design language
- Use consistent spacing (AppSpacing constants)
- Follow automotive/futuristic theme
- Ensure accessibility compliance

### Color Usage
- Use predefined AppColors constants
- Maintain contrast ratios for readability
- Test in both light and dark environments

### Animation Guidelines
- Keep animations smooth (60fps)
- Use appropriate duration (200-500ms for micro-interactions)
- Provide animation disable options for accessibility

## 🧪 Testing

### Unit Tests
```dart
// Example test structure
group('VehicleStatus', () {
  test('should create valid status', () {
    final status = VehicleStatus(
      isEngineOn: true,
      speed: 60,
      location: 'Test Location',
    );
    
    expect(status.isEngineOn, true);
    expect(status.speed, 60);
  });
});
```

### Widget Tests
- Test widget rendering
- Test user interactions
- Test state changes

### Integration Tests
- Test complete user flows
- Test platform-specific functionality
- Test emergency scenarios

## 🔒 Security Considerations

### Data Handling
- Never commit sensitive data
- Use environment variables for API keys
- Implement proper data encryption
- Follow privacy-by-design principles

### Emergency Features
- Test emergency flows thoroughly
- Ensure fail-safe mechanisms
- Validate location accuracy
- Test offline functionality

## 📱 Platform-Specific Guidelines

### Android
- Follow Material Design principles
- Test on various screen sizes
- Ensure proper permissions handling
- Test background processing

### iOS
- Follow Human Interface Guidelines
- Test on different iOS versions
- Ensure proper App Store compliance
- Test with various device orientations

### Web
- Ensure responsive design
- Test browser compatibility
- Optimize for performance
- Handle offline scenarios

## 🚦 Pull Request Process

### PR Checklist
- [ ] Code follows style guidelines
- [ ] Tests pass locally
- [ ] Documentation updated
- [ ] No breaking changes (or properly documented)
- [ ] Screenshots included for UI changes
- [ ] Tested on target platforms

### Review Process
1. Automated checks must pass
2. Code review by maintainers
3. Testing on multiple platforms
4. Documentation review
5. Final approval and merge

## 🏷️ Commit Message Format

Use conventional commits:
```
type(scope): description

feat(dashboard): add vehicle status indicators
fix(gps): resolve location accuracy issues
docs(readme): update installation instructions
style(theme): adjust neon button colors
test(emergency): add impact detection tests
```

### Types
- `feat`: New features
- `fix`: Bug fixes
- `docs`: Documentation changes
- `style`: Code style changes
- `refactor`: Code refactoring
- `test`: Test additions/changes
- `chore`: Maintenance tasks

## 🤝 Community Guidelines

### Code of Conduct
- Be respectful and inclusive
- Provide constructive feedback
- Help newcomers learn
- Focus on the project's goals

### Communication
- Use GitHub Issues for bug reports
- Use GitHub Discussions for questions
- Be clear and concise in communications
- Provide context and examples

## 📞 Getting Help

- **Documentation**: Check the README and Wiki
- **Issues**: Search existing issues first
- **Discussions**: Ask questions in GitHub Discussions
- **Code Review**: Request reviews from maintainers

## 🎯 Roadmap Priorities

### High Priority
- Emergency response optimization
- Cross-platform consistency
- Performance improvements
- Accessibility enhancements

### Medium Priority
- Additional safety features
- UI/UX improvements
- Integration capabilities
- Localization support

### Future Considerations
- AI/ML enhancements
- IoT device integration
- Advanced analytics
- Cloud synchronization

Thank you for contributing to making roads safer for everyone! 🚗💙