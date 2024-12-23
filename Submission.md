# Chefwizz App 

Mobile app for Chef Wizz.

## How to Install/Run the Chefwizz App
1. Make sure you have flutter sdk installed on your system. If you do not have it, kindly download it using this link https://docs.flutter.dev/get-started/install and follow the instructions on how to install and run flutter and skip to step 4.
2. Once installed, open android studio or VsCode(whichever IDE you have) and add the sdk location in the settings.
3. After cloning this project from github and branching to my repo, go to your pubspec.yaml file and click on pub get or go to the terminal and run 'flutter pub get'.
4. Make sure you have an emulator(android/ios) or a physical device with developer settings on and connected to your laptop. Run the app either via terminal 'flutter run' or on your IDE directly.

## Libraries/Tools used
1. Couple libraries were used to handle api integration such as http and also bloc for state management.
2. flutter_dotenv was also used to handle environment variables which a dummy api base url was set there for now.
3. To handle responsivenes across devices including web, responsive_framework was used.
4. To handle navigation, auto_route was used.
5. To enhance the UI, flutter_staggered_animations was used for a slick animation to view the list and also favorite_button to favorite some recipes just to make work faster.

## known limitations or areas for improvement
1. Nothing really, it's just a simple project for the assessment.

## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).

## Localization

This project generates localized messages based on arb files found in
the `lib/i10n` directory.

To support additional languages, please visit the tutorial on
[Internationalizing Flutter
apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)
