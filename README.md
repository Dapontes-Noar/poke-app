# Poke-app

A simple Pokedex-style app that consumes the PokéAPI to display a list of Pokémon, show detailed information, and
allow users to manage their favorites.
The project follows Clean Architecture principles with Riverpod, Dio, Freezed and Intl, implementing best practices in
code quality, state management, and UI design based on the provided Figma.

## Getting Started

### Prerequisites

- Flutter SDK (version 3.0.0 or higher)
- Dart SDK (version 2.17.0 or higher)
- An IDE such as Visual Studio Code or Android Studio
- Git installed on your machine
- A device or emulator to run the app, you can use web, android or iOS

## Starting the project

1. Clone the repository
   ```bash
   git clone [repository_url]
    ```
2. Navigate to the project directory
   ```bash
   cd poke_app
   ```
3. Install dependencies, generate code and localization files:
   ```bash
   flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
   ```
4. Run the app
   ```bash
    flutter run -t lib/main.dart
    ```
   when run this command, you can choose the device or emulator available for run the app.

## Features

- Browse a list of Pokémon with images and types
- View detailed information for each Pokémon
- Filter Pokémon by type
- Manage your favorite Pokémon
- Responsive UI for mobile and web
- Localization support (multi-language)
- Modern, maintainable architecture (Clean Architecture + MVVM)

---

## API & Environment Configuration

This app uses the public [PokéAPI](https://pokeapi.co/) and does not require any API keys or special environment variables by default.

If you wish to point to a different API or use a proxy, you can configure the base URL in the network layer (see `lib/core/network/`).

---

## Supported Languages

- English (en)
- Spanish (es)

To add a new language, see the Intl Localization section above.

---
# Developer Guide

## Architecture Overview

This project follows the Clean Architecture principles combined with the MVVM design pattern. The architecture is
divided into several layers:

- **Core Layer**: Contains shared utilities, dependency injection setup (Using Riverpod: if we need to manually
  configure any provider), and network configurations.
- **Feature Layer**: Each feature is self-contained with its own data, domain, and presentation layers.
- **Shared Layer**: Contains reusable UI components, themes, and types used across multiple features.
- **Routes Layer**: Manages navigation and routing within the application.
- **Styles Layer**: Defines the app-wide theming and styles.
- **App Entry Points**: Separate entry points for different build configurations (e.g., development, production).
- **Dependency Injection**: Utilizes `Riverpod` and `riverpod_annotations` for managing dependencies through generated
  providers.
- **Networking**: Uses `Dio` for HTTP requests, with custom interceptors and exception handling.
- **State Management**: Implements the MVVM pattern using `Riverpod` for state management.
- **Localization**: Supports multiple languages using the `intl` package.
- **Code Generation**: Leverages `build_runner` for generating boilerplate code, models, and localization files.
- **Testing**: Includes unit and widget tests to ensure code quality and reliability.
- **Continuous Integration**: Configured with CI/CD pipelines for automated testing and deployment.
- **Documentation**: Comprehensive documentation is provided to assist developers in understanding and contributing to
  the project.

## Packages structure

This project is structured in a way that follows the Clean Architecture principles. The main packages are:

```
lib/
├─ app.dart                   # App-level configuration and setup
├─ main_dev.dart              # Main entry for development builds
├─ core/                      # Shared utilities, dependency injection, network, constants
│  ├─ di/                     # Manual Riverpod providers if needed and centralized general providers (most DI uses @riverpod annotations)
│  ├─ network/                # Network clients, API configuration (e.g., Dio)
|  |   ├─ exceptions/         # Custom exceptions for network errors
│  │   └─ interceptors/       # Dio interceptors for logging, auth, etc.
│  ├─ utils/                  # Common utility functions and helpers
|      └─extensions/          # Dart extensions
├─ [features]/                # Modular feature folders (specific for each feature) 
│   ├─ data/                  # Data layer
│   │  ├─ datasources/        # Remote/local data sources
│   │  ├─ models/             # Data models (+ generated files)
│   |  └─ repositories/       # Data repository implementations
│   ├─ domain/                # Domain layer
│   │  ├─ entities/           # Business entities
│   │  ├─ repositories/       # Repository interfaces
│   │  └─ usecases/           # Use case classes
│   └─ presentation/          # Presentation layer
│      ├─ screens/            # UI pages/screens
│      ├─ notifiers/          # MVVM view models with riverpod state notifiers
│      └─ widgets/            # Feature-specific widgets
├─ shared/                    # Shared UI widgets, theme, types
├─ styles/                    # App-wide theming and styles
└─ routes/                    # Centralized app routing
```

### Utility

- **app.dart / main_dev.dart**: Application entry points and configuration.
- **core/**: Houses shared logic for dependency injection (Riverpod), networking, and utilities used across features.
- **features/**: Each feature is self-contained, following Clean Architecture:
    - **data/**: Handles data access, models, and repository implementations.
    - **domain/**: Contains business entities, repository interfaces, and use cases.
    - **presentation/**: Manages UI, view models, and widgets for each feature.
- **shared/**: Provides reusable UI components, theming, and type definitions.
- **routes/**: Centralizes route definitions for navigation.

This structure supports modularity, scalability, and maintainability, following Clean Architecture and MVVM principles
for Flutter development.
---

## Dependencies Overview

This project uses a set of core, UI, and development dependencies to ensure maintainability, scalability, and a great developer experience. Here is an overview of the main dependencies and their purposes:

### Core Libraries
- **dio**: HTTP client for making API requests to PokéAPI and handling network communication.
- **equatable**: Provides value equality for Dart objects, making it easier to compare entities and models.
- **freezed & freezed_annotation**: Used for generating immutable data classes, union types, and pattern matching, reducing boilerplate in models and state classes.
- **json_annotation**: Enables JSON serialization/deserialization for models.
- **intl**: Supports internationalization and localization, allowing the app to be translated into multiple languages.
- **go_router**: Handles declarative routing and navigation throughout the app.
- **riverpod, riverpod_annotation, hooks_riverpod**: Modern state management and dependency injection, with code generation for providers and hooks for ergonomic widget state.

### UI Libraries
- **flutter_svg**: Renders SVG images for scalable and crisp icons and illustrations.
- **gap**: Provides simple spacing widgets for consistent layout.
- **cupertino_icons**: Supplies iOS-style icons for cross-platform UI.

### Testing & Code Generation
- **mockito**: Mocking framework for writing unit and widget tests with dependency isolation.
- **flutter_test**: Flutter's built-in testing framework for unit, widget, and integration tests.
- **build_runner**: Automates code generation for Freezed, Riverpod, and JSON serialization.
- **json_serializable**: Generates code for JSON serialization/deserialization.
- **riverpod_generator**: Generates provider code for Riverpod using annotations.
- **flutter_lints**: Provides recommended lint rules for code quality and consistency.

See the `pubspec.yaml` for the full list and versions. For install/upgrade instructions, see the Dependency Updates section below.

## Use of AI in This Project

Artificial Intelligence (AI) tools have been actively used throughout the development and maintenance of this project to enhance quality, efficiency, and documentation. Here’s how AI contributes to this repository:

- **Technology Comparison:** AI was leveraged to compare and select the most suitable technologies, libraries, and architectural patterns for the project, ensuring modern and scalable solutions.
- **Code Improvement & Optimization:** AI-assisted code reviews and suggestions were used to optimize performance, refactor code, and ensure best practices are followed across the codebase.
- **Automated Comment Generation:** AI tools generated and improved code comments, making the codebase more understandable and maintainable for all contributors.
- **Documentation Enhancement:** AI was used to draft, review, and improve project documentation, including the README, to ensure clarity, completeness, and developer-friendliness.
- **Change Review & Specific Guidance:** All AI-generated changes and suggestions were thoroughly reviewed, and AI was used to obtain specific recommendations for edge cases, error handling, and best practices.

By integrating AI into the development workflow, this project benefits from faster iteration, higher code quality, and more comprehensive documentation, while always maintaining human oversight and review for all changes.


## Dependency Injection with Riverpod

This project uses Riverpod and riverpod_annotations for dependency injection. Providers are defined using the
`@riverpod` annotation, and code generation creates the necessary provider code. You do **not** need a manual
registration class like `RegisterModule`.

> **Note:** The `core/di/` folder is only needed if you have providers that cannot be generated with `@riverpod`
> annotations (e.g., providers that require runtime values or complex setup). For most dependencies, use the
> annotation-based approach as shown below.

**Example Implementation:**

Create a provider using `@riverpod` in your Dart file (e.g., `lib/core/network/dio_client.dart`):

```dart
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_client.g.dart';

@riverpod
Dio dio(DioRef ref) => Dio();

@riverpod
DioClient dioClient(DioClientRef ref) {
  final dio = ref.watch(dioProvider);
  return DioClient(dio);
}
```

Run code generation:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Use the generated providers in your widgets or classes:

```dart

final dioClient = ref.watch(dioClientProvider);
```

---
This setup enables automatic registration and injection of dependencies using Riverpod and code generation.

## Routes

This project uses a centralized routing system. All routes are defined in `lib/routes/app_router.dart`. You can add new
routes by updating this file.

In this project we use the `go_router` package for routing. Here is an example of how to define routes:

```dart
GoRouter buildAppRouter() =>
    GoRouter(
      initialLocation: '/home',
      routes: [
        // Define your routes here
        GoRoute(path: '/home', builder: (context, state) => MyHomePage()),
      ],
    );
```

## Intl Localization

This project uses the `intl` package for localization. To add a new language, follow these steps:

1. Add the new language ARB file in `lib/l10n/` (e.g., `intl_es.arb` for Spanish).
2. Run the following command to generate localization files:
   ```bash
   flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
   ```
3. Update the `supportedLocales` in `app.dart` to include the new language.
4. Use the generated localization classes in your widgets, in this project we use `context.l10n.your_key`.

## Styles and Theming
The app's theming and styles are defined in the `lib/styles/` directory. You can customize colors, text styles, and
other theme properties by modifying the files in this directory.
- `poke_styles.dart`: Main theme configuration.
- `poke_colors.dart`: Color definitions.

you can use the styles in your widgets like this:

```dart
 $pokeStyles.text.pokeIDText
```
into `poke_styles.dart` you can find predefined text styles, colors, and other theming properties.

## Testing

The `test/` directory is organized to mirror the structure of the `lib/` directory, following Clean Architecture and feature-based modularity. This ensures that tests are easy to locate and maintain.

### Structure

```
test/
├─ main_test.dart                        # Entry point for global tests
├─ core/                                 # Tests for core utilities, constants, and fixtures
│   ├─ constants/                        # Test constants
│   ├─ fixtures/                         # JSON fixtures and test utilities for mocking data
├─ features/                             # Feature-specific tests
│   └─ home/                             # Example: Home feature
│       ├─ data/                         # Data layer tests (datasources, repositories)
│       ├─ domain/                       # Domain layer tests (usecases)
│       └─ presentation/                 # Presentation layer tests (notifiers, widgets)
│           └─ notifier/                 # Notifier (view model) tests for Riverpod
```

### Best Practices
- **Mirrored Structure:** Each test file corresponds to a file or module in `lib/`, making it easy to find and maintain tests.
- **Mocks & Fixtures:** Use the `fixtures/` folder for static JSON and utility functions. Mocks are generated using `mockito` and placed alongside their respective test files.
- **Code Generation:** Run `flutter pub run build_runner build --delete-conflicting-outputs` to generate mocks and other test utilities.
- **Test Execution:** Run all tests with:
  ```bash
  flutter test
  ```

### Example: Notifier Test

```dart
// test/features/home/presentation/notifier/home_notifier_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod/riverpod.dart';
// ...existing code...

void main() {
  // Setup mocks and ProviderContainer
  // ...existing code...

  test('fetchAllPokemons sets state to data on success', () async {
    // ...test implementation...
  });
}
```

### Summary
- All business logic, data, and presentation layers are covered by tests.
- Mocks and fixtures ensure tests are reliable and isolated from external dependencies.
- The structure supports scalable, maintainable, and robust testing for all features.

---

## Code Style & Linting

- The project uses Dart's recommended lints and custom rules in `analysis_options.yaml`.
- To check code style and lint errors, run:
  ```bash
  flutter analyze
  ```
- Please ensure your code passes all lint checks before submitting a pull request.

---

## Contribution Guidelines

We welcome contributions! Please:
- Fork the repository and create a feature branch.
- Follow the existing code style and architecture.
- Write tests for new features or bug fixes.
- Open a pull request with a clear description of your changes.
- For more details, see [CONTRIBUTING.md](CONTRIBUTING.md) (create this file if it doesn't exist).

---

## CI/CD Status

![CI](https://img.shields.io/badge/build-passing-brightgreen)

---

## Known Issues / Roadmap

- Some advanced PokéAPI endpoints are not yet implemented (e.g., evolution chains, abilities details)
- Planned: Dark mode, offline support, and more filter options
- See [issues](https://github.com/yourusername/poke_app/issues) for up-to-date bugs and feature requests

---

## FAQ / Troubleshooting

**Q: The app won't build or run.**
- Make sure you have the correct Flutter and Dart versions installed.
- Run `flutter pub get` and `flutter pub run build_runner build --delete-conflicting-outputs`.
- If you see codegen errors, try cleaning with `flutter clean` and re-running the above commands.

**Q: Tests are failing or mocks are missing.**
- Run `flutter pub run build_runner build --delete-conflicting-outputs` to regenerate mocks.

**Q: How do I add a new language?**
- See the Intl Localization section below.

---

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

---

## Contact / Community

For questions, suggestions, or support:
- Open an issue or discussion on [GitHub](https://github.com/yourusername/poke_app)
- Email: your.email@example.com

---

## Dependency Updates

To update dependencies:
- Run `flutter pub upgrade` to update all packages.
- After updating, always run code generation:
  ```bash
  flutter pub run build_runner build --delete-conflicting-outputs
  ```
- Run tests and check for breaking changes.

## App Store / Play Store Links

> The app is not yet published on the App Store or Play Store. When available, links will be provided here.