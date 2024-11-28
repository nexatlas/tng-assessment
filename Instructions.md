# Frontend Technical Assessment

## Assessment Overview
- Purpose of the assessment
- Expected time to complete
- Submission guidelines

## Submission Instructions
1. Create a branch
2. Complete the assessment
3. Commit your code
4. Create a pull request to the role branch

## Technical Requirements
Welcome to the Front-End Engineer role branch. Your task is to create a responsive web dashboard for MetricWizz, a fictional company. 
This exercise will assess is designed to test your ability to build dynamic, responsive, and visually appealing web applications.

1. Framework/Library:
   - Use a modern front-end framework/library such as React, Vue.js, or Angular. React is preferred, but feel free to choose what you’re most comfortable with.

2. Features to Implement:
   - Navbar:
     - A responsive navbar with links to "Dashboard", "Settings", and "Profile".
   - Dashboard:
     - A grid layout displaying:
       - 3 cards showing metrics (e.g., Total Users, Active Sessions, Revenue).
       - A bar chart visualizing user activity over the last 7 days.
       - A table listing the latest user sign-ups (columns: Name, Email, Date).
   - Responsiveness:
     - Ensure the layout adjusts seamlessly for mobile, tablet, and desktop screens.

3. Dynamic Data:
   - Use the provided data.json file (included in this repository) to populate the dashboard.
   - You can load this data directly into your application by importing it or using an HTTP request to simulate an API call.
   - Example structure of data.json
     
     {
       "metrics": {
         "totalUsers": 1200,
         "activeSessions": 75,
         "revenue": "$24,000"
       },
       "activity": [10, 20, 15, 30, 25, 40, 50],
       "users": [
         { "name": "John Doe", "email": "john@example.com", "date": "2024-11-20" },
         { "name": "Jane Smith", "email": "jane@example.com", "date": "2024-11-18" }
       ]
     }
  
   - How to Use the Data:
     - For metrics: Render each value in a separate card.
     - For activity: Use a bar chart library to visualize the array of numbers.
     - For users: Populate a table with columns using the data in the users array.    

4. Styling:
   - Use CSS or a modern styling framework such as TailwindCSS, Bootstrap, or Material-UI. Custom CSS is also acceptable.

5. Code Quality:
   - Use clear and modular code.
   - Comment on key parts of your code.
   - Use Git for version control (commit your work frequently).


## Deliverables
1. A fully functional, responsive dashboard.
2. A  Submission.md showing:
   - How to run the project locally.
   - Any design decisions or libraries/tools used.
   - Any known limitations or areas for improvement.
