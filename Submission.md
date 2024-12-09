# ChefWizz Recipe Finder App

## Introduction

Welcome to the **ChefWizz Recipe Finder App**! This Flutter application allows users to search for delicious recipes, view detailed information about each recipe, and save their favorites for easy access later. Built with a focus on clean design and responsive layouts, ChefWizz provides a seamless user experience across various devices.

## Installation and Running the App

### Prerequisites

Before you begin, ensure you have the following installed on your machine:

- **Flutter SDK:** [Install Flutter](https://flutter.dev/docs/get-started/install)
- **Dart SDK:** Included with Flutter
- **VSCode or Android Studio:** Recommended IDEs for Flutter development
- **Git:** To clone the repository

### Clone the Repository

```bash
git clone https://github.com/yourusername/ChefWizz.git
cd ChefWizz
```

### Running the App with VSCode

1. **Open the Project:**
   - Launch VSCode.
   - Click on `File` > `Open Folder...` and select the cloned `ChefWizz` project directory.

2. **Ensure Flutter Extension is Installed:**
   - If not already installed, go to the Extensions view (`Ctrl+Shift+X` or `Cmd+Shift+X` on macOS) and install the **Flutter** extension.

3. **Use the Provided `launch.json`:**
   - The project includes a `launch.json` file configured for easy debugging.
   - Open the `Run and Debug` view by clicking the debug icon on the sidebar or pressing `Ctrl+Shift+D` (`Cmd+Shift+D` on macOS).
   - Select the appropriate launch configuration from the dropdown (e.g., `Flutter`).
   - Click the green `Run` button to start the app.

### Running the App with Android Studio

1. **Open Android Studio:**
   - Launch Android Studio.

2. **Open the Project:**
   - Click on `File` > `Open...` and navigate to the cloned `ChefWizz` project directory.
   - Select the project and click `OK`.

3. **Ensure Flutter Plugin is Installed:**
   - Go to `File` > `Settings` (`Android Studio` > `Preferences` on macOS).
   - Navigate to `Plugins` and ensure the **Flutter** and **Dart** plugins are installed and enabled.

4. **Select a Device:**
   - Connect a physical device via USB with USB debugging enabled, or launch an emulator.

5. **Run the App:**
   - Click the green `Run` button in the toolbar, or go to `Run` > `Run 'main.dart'`.
   - The app will build and launch on the selected device.

## Design Decisions

### Architecture

- **Stateless Widgets:** The Profile screen and other UI components utilize `StatelessWidget` to ensure simplicity and optimal performance, given that the placeholder screens do not require dynamic state management.
  
- **State Management(Riverpod):** For managing the state of favorited recipes, the app currently uses in-memory storage. This approach was chosen for its simplicity within the assessment timeframe.

### UI/UX

- **Material Design:** The app follows Material Design guidelines to provide a consistent and intuitive user experience.
  
- **Responsive Layouts:** Leveraged Flutter's flexible layout widgets to ensure the app looks great on various screen sizes, including phones and tablets.

- **Navigation:** Implemented a `BottomNavigationBar` to allow easy switching between Home, Favorites, and Profile screens.

### Libraries and Tools

- **HTTP:** Utilized the `http` package for fetching recipe data from the provided `recipes.json` file or a mocked API.

- **Riverpod:** Employed Riverpod for state management to handle favorited recipes and ensure data consistency across the app.

- **Hooks:** Leveraged Flutter Hooks to simplify the state management and widget lifecycle, making the code more readable and maintainable.

### Assets

- **Images:** Used placeholder images from `https://via.placeholder.com/150` for recipe thumbnails and user profile pictures.

## Known Limitations

1. **Favorites Persistence:**
   - **Issue:** Currently, favorited recipes are stored in memory. This means that once the app is closed, the list of favorites is cleared.
   - **Impact:** Users cannot retain their favorite recipes between app sessions, which affects user experience.

2. **Navigation UX:**
   - **Issue:** The navigation between different parts of the app can be enhanced for a smoother user experience.
   - **Impact:** Users might find the current navigation slightly less intuitive, especially when dealing with deeper navigation stacks or transitions.

## Areas for Improvement

1. **Persistent Storage for Favorites:**
   - **Solution:** Implement persistent storage using packages like `shared_preferences`, `hive`, or `sqflite` to save favorited recipes across app sessions.
   - **Benefit:** Enhances user experience by retaining user preferences and favorites.

2. **Enhanced Navigation:**
   - **Solution:** Introduce more sophisticated navigation patterns, such as named routes, nested navigation stacks, or leveraging `Navigator 2.0` for better control.
   - **Benefit:** Provides a more intuitive and seamless navigation experience, making the app feel more polished.

3. **User Authentication:**
   - **Solution:** Add user authentication to personalize the profile screen and allow users to sync their favorites across devices.
   - **Benefit:** Increases the app's functionality and user engagement by providing personalized experiences.

4. **API Integration:**
   - **Solution:** Replace the mock `recipes.json` with a real backend API to fetch live data and possibly allow users to contribute recipes.
   - **Benefit:** Makes the app dynamic and scalable, providing up-to-date content to users.

5. **UI Enhancements:**
   - **Solution:** Incorporate animations, transitions, and more advanced UI elements to make the app more engaging.
   - **Benefit:** Improves the overall aesthetic and user satisfaction.

6. **Testing:**
   - **Solution:** Implement unit tests, widget tests, and integration tests to ensure app reliability and maintainability.
   - **Benefit:** Ensures that new features do not break existing functionality and that the app remains robust.

## How to Use the App

1. **Home Screen:**
   - Browse through a list of featured recipes.
   - Use the search bar at the top to filter recipes by name.
   - Tap on a recipe card to view detailed information.

2. **Recipe Details Screen:**
   - View comprehensive details about the selected recipe, including ingredients and step-by-step instructions.
   - Mark the recipe as a favorite by tapping the favorite icon.

3. **Favorites Screen:**
   - Access all the recipes you have marked as favorites.
   - Tap on a favorite recipe to view its details.

4. **Profile Screen:**
   - View your profile information, including your name and email.
   - Access additional options like Account Settings and Logout (placeholders for future implementation).

## Conclusion

The **ChefWizz Recipe Finder App** serves as a robust foundation for a recipe management and discovery platform. While it meets the core requirements of searching, viewing, and favoriting recipes, there are several avenues for enhancement to elevate the user experience and app functionality. Future developments can focus on persistent data storage, improved navigation, user authentication, and more to create a comprehensive and user-friendly application.

Thank you for reviewing my submission. I look forward to any feedback or suggestions!

## Getting Started

To get started with the ChefWizz Recipe Finder App, follow the installation instructions above. Ensure all prerequisites are met, and choose your preferred development environment (VSCode or Android Studio) to run and explore the app.
