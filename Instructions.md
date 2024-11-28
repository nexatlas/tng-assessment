# Flutter Technical Assessment

## Assessment Overview
- The goal of this assessment is to evaluate your ability to build a functional and visually appealing Flutter application, demonstrating proficiency with Flutter widgets, layouts, state management, and dynamic data handling.
- This task is expected to be completed in 5 days
- Read the Submission and Deliverable sections below for submission guidelines.

## Submission Instructions
1. Create a branch
2. Complete the assessment
3. Commit your code
4. Create a pull request to the role branch

## Technical Requirements
Your task is to build a Recipe Finder App for a fictional company called "ChefWizz". The app will allow users to search for recipes, view details, and save their favorite recipes for later.

1. Features to Implement

  a. Home Screen
   - Display a list of featured recipes fetched from a provided API (or mock JSON).
   - Each recipe card should include:
     - Recipe name
     - Short description
     - Thumbnail image
   - Add a search bar at the top of the screen to filter recipes by name.

 b. Recipe Details Screen
   - Show detailed information about the selected recipe, including:
     - Name
     - Full description
     - Ingredients (in a bullet-point list)
     - Step-by-step instructions
   - Include an image of the recipe at the top of the screen.

 c. Favorites Screen
   - Allow users to mark recipes as favorites from the Home or Details screen.
   - Display the list of favorited recipes on this screen.

 d. Navigation
   - Implement a bottom navigation bar with the following tabs:
     - Home: Displays the featured recipes and search bar.
     - Favorites: Displays the list of saved recipes.
     - Profile: A placeholder screen showing a user's name and email.

e. Responsiveness
   - Ensure the app works seamlessly on different screen sizes, including phones and tablets.


2. Data and API Handling

- Use the provided recipes.json file (included in this repository) as the source of data.
- Alternatively, mock an API using http or a library like "dio" to fetch data dynamically.
  
Sample recipes.json structure:
[
  {
    "id": 1,
    "name": "Spaghetti Bolognese",
    "description": "A classic Italian pasta dish.",
    "image": "https://via.placeholder.com/150",
    "ingredients": [
      "200g spaghetti",
      "100g ground beef",
      "1 onion, chopped",
      "1 clove garlic, minced",
      "400g canned tomatoes"
    ],
    "instructions": [
      "Boil the spaghetti according to the package instructions.",
      "In a pan, sauté the onion and garlic.",
      "Add ground beef and cook until browned.",
      "Stir in the tomatoes and simmer for 20 minutes.",
      "Serve the sauce over the spaghetti."
    ]
  },
  {
    "id": 2,
    "name": "Chicken Curry",
    "description": "A flavorful chicken curry with a spicy kick.",
    "image": "https://via.placeholder.com/150",
    "ingredients": [
      "500g chicken, diced",
      "1 onion, chopped",
      "2 tablespoons curry powder",
      "200ml coconut milk",
      "1 bell pepper, sliced"
    ],
    "instructions": [
      "Sauté the onion until soft.",
      "Add the chicken and cook until browned.",
      "Stir in the curry powder and cook for 1 minute.",
      "Add the coconut milk and simmer for 15 minutes.",
      "Add the bell pepper and cook for 5 more minutes."
    ]
  }
]

3. Code Quality:
   - Use clear and modular code.
   - Comment on key parts of your code.


## Deliverables
1. A fully functional, responsive dashboard.
2. A  Submission.md showing:
   - How to install or run the app.
   - Any design decisions or libraries/tools used.
   - Any known limitations or areas for improvement.

## Good luck, and we look forward to reviewing your submission!
