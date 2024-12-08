# Chefwizz App 

## How to Install/Run the Chefwizz App
1. Make sure you have flutter sdk installed on your system. If you do not have it, kindly download it using this link https://docs.flutter.dev/get-started/install and follow the instructions on how to install and run flutter and skip to step 4.
2. Once installed, open android studio or VsCode(whichever IDE you have) and add the sdk location in the settings.
3. After cloning this project from github and branching to my repo, go to your pubspec.yaml file and click on pub get or go to the terminal and run 'flutter pub get'.
4. Make sure you have an emulator(android/ios) or a physical device with developer settings on and connected to your laptop. Run the app either via terminal 'flutter run main.dart' or on your IDE directly.

## Libraries/Tools used
1. The only library or package installed in the pubspec.yaml file is the SharedPreferences package and this was used to save the favorite recipes locally.
2. SetState was used to modify state as I opted against using other state management tools like Provider or Riverpod because the application is small, and flutter has inbuilt widgets and packages to take care of the apps needs.
3. However, for bigger applications, a database like Hive and state management tool like Riverpod will be used for seamless running of the application.

## known limitations or areas for improvement
1. The design can be better. 
2. A signup and logout feature too would also be nice to have.
3. A categories feature would also be good.