# Poke-app

A simple Pokedex-style app that consumes the PokéAPI to display a list of Pokémon, show detailed information, and
allow users to manage their favorites.
The project follows Clean Architecture principles with Riverpod, Dio, Freezed and Intl, implementing best practices in
code quality, state management, and UI design based on the provided Figma.

## Getting Started

This project is a starting point for a Flutter application

## Starting the project

1. Clone the repository
   ```bash
   git clone
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
