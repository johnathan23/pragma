# pragma
pragma exam

> [!NOTE]
> This project currently is cross platform support.

## Environment Setup
---------------------------

### System Requirements

> [!CAUTION]
> Make sure to have the correct version of Flutter installed before running.

* ***Flutter 3.29.0*** or *higher* (*``currently using Flutter 3.29.0``*)
* ***Dart 3.7.0*** or *higher* (*``currently using Dart 3.7.0``*)
* ***VS Code*** *or* ***Android Studio*** with *Flutter* and *Dart* extensions

## Requirements

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart) (comes with Flutter SDK)
- [Android Studio](https://developer.android.com/studio) (for Android app development)
- [Xcode](https://developer.apple.com/xcode/) (for iOS app development)

## Useful links
-----------------

> [!TIP]
> These links could be helpful for a better understanding of how the project is working and organized.

* ***The Cat Api Postman*** Documentation: [open link](https://documenter.getpostman.com/view/5578104/RWgqUxxh#93c94063-d096-4a97-8997-c233a59db6d7)
* ***TheCatAPI*** Documentation: [open link](https://developers.thecatapi.com/view-account/ylX4blBYT9FaoVd6OhvR?report=FJkYOq9tW)
* ***Hexagonal Architecture*** Documentation: [open link](https://platzi.com/blog/arquitectura-hexagonal)
* ***Flutter*** Documentation: [open link](https://flutter.dev/docs)
* ***Dart*** Documentation: [open link](https://dart.dev/docs)
* ***Riverpod*** Documentation: [open link](https://riverpod.dev)
* ***Retrofit*** Documentation: [open link](https://pub.dev/documentation/retrofit/latest/)
* ***Build Runner*** Documentation: [open link](https://github.com/dart-lang/build/tree/master/docs)
* ***Go Router*** Documentation: [open link](https://pub.dev/documentation/go_router/latest/)
* ***Freezed*** Documentation: [open link](https://pub.dev/documentation/freezed/latest/)
* ***Shared Preferences*** Documentation: [open link](https://pub.dev/documentation/shared_preferences/latest/)
* ***Launcher icon*** Documentation: [open link](https://pub.dev/documentation/flutter_launcher_icons/latest/)
* ***Dot Env*** Documentation: [open link](https://pub.dev/documentation/flutter_dotenv/latest/)
* ***Material Symbols*** Documentation: [open link](https://pub.dev/documentation/material_symbols_icons/latest/)

## Installation
-----------------

### Getting Started

> [!IMPORTANT]
> Make sure to follow these steps to ensure a successful setup of the project.

1. **Clone the Repository**
    - Clone the repository to your local machine:
      ```bash
      git clone https://github.com/johnathan23/pragma.git .
      ```
2. **Add Configuration Files**
    - Generate your Api key [The Cat Api](https://thecatapi.com/signup)
    - Paste Api key a `dev.env` file in the [.env](./.env) folder.

3. **Install Dependencies**
    - Navigate to the project folder and run the following command to install the dependencies:
      ```bash
      flutter pub get
      ```
    - or in android studio go to [pubspec.yaml](./pubspec.yaml) and run pub get

4. **Build runner**
    - run the following command
      ```bash
      flutter pub run build_runner --delete-conflicting-outputs
      ```
## Commands and Scripts
----------------------

### Global Commands

> [!NOTE]
> Libraries are vital to the smooth running of your project, so make sure to keep them up to date.
* **`flutter pub get`**: Gets dependencies for the project
*  **`dart format .`**: Apply format code for the project

> [!WARNING]
> Whenever changes are made to the models or the api folder, make sure to run **`flutter pub run build_runner build`**
> and if any error occurs while running the command, run the following **`flutter pub run build_runner build --delete-conflicting-outputs`**.
* **`flutter pub run build_runner build`**: Generates build runner
* **`flutter pub run build_runner build --delete-conflicting-outputs`**: Generates build runner and deletes conflicting outputs

* **`flutter clean`**: Cleans the project
* **`flutter pub cache clean`**: Cleans the pub cache
* **`flutter pub cache repair`**: Repairs the pub cache

* **`dart run flutter_launcher_icons:generate`**: Generates launcher file icons for the project
* **`flutter pub run flutter_launcher_icons`**: Set launcher icons for the project

## Build Commands

### APK Builds
- **`flutter build apk`**: Builds the APK file.

### App Bundle Builds
- **`flutter build appbundle`**: Builds the app bundle file for distribution.

### iOS Builds
- **`flutter build ios`**: Builds the iOS application for deployment.

### Web Builds
- **`flutter build web`**: Builds the web application for deployment.

> [!NOTE]
> Use the following command to build the web application:
> `-- release`,`-- profile`,`-- debug`

## Version History
-----------------

* ### **v1.0.0** **(2025-05-17)**
    * added: Initial version of the readme
