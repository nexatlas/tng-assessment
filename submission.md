# MetricWizz Dashboard

## Overview

This project is a responsive web dashboard built for MetricWizz, a fictional company. The dashboard includes a responsive Navbar, metric cards, a bar chart visualizing user activity, and a table displaying the latest user sign-ups. The application is implemented using **React.js** with **modular CSS** for styling.

## How to Run the Project Locally

### Prerequisites

- **Node.js**: Version `20.9.0` or higher.
- **yarn**: Version `1.22.22` or higher.
- **Git**

### Steps to Run:

1. **Clone the repository**:

   ```bash
   git clone https://github.com/nexatlas/tng-assessment.git
   cd tng-assessment

   ```

2. **Install dependencies**:

   ```bash
   yarn install

   ```

3. **Start the development server:**:

   ```bash
   yarn start

   ```

4. **Access the application**:
   Open your browser and navigate to http://localhost:3000.

5. **Login Credentials**
   Use any valid email and any password string with at least 8 characters, a number and a special character

## Libraries/Tools Used

**React.js**: The front-end framework used to build the dashboard.
**Modular CSS**: Custom CSS used for styling the components. This allows for easy scaling and modularity of styles.
**Chart.js**: Used for rendering the bar chart that visualizes user activity over the past 7 days.
**Node.js 20.9.0**: Version of Node.js used to run the project.

## Design Decisions

**Component Structure**: I used a component-based architecture where each major section of the dashboard (navbar, metrics cards, chart, table) is handled by a separate React component. This ensures the code is maintainable and modular.
**State Management**: For simplicity, React’s built-in useState and useEffect hooks were used to manage the data for metrics, user activity, and users list.
**Responsiveness**: The layout is designed to be responsive using CSS media queries, ensuring the dashboard works well across mobile, tablet, and desktop screens.
**Chart.js**: The bar chart is used to display user activity over the last 7 days. The data is dynamically passed to the chart component from the activity array in the provided data.json.
**CSS Styling**: I used modular CSS to style the components. This allows for better organization and scalability of the styles, with each component having its own associated stylesheet.

## Known Limitations or Areas for Improvement

**Data Handling**: In a real-world application, the data should be fetched from an API rather than being statically imported from a data.json file. This would allow for dynamic updates and scalability.
**Styling**: Although the dashboard is responsive, the layout could be further refined for larger screens, and some animations could be added to improve user interaction.
**Testing**: Unit tests and integration tests could be implemented for the components to ensure reliability and catch potential bugs early.
**Form Validation**: For scalability, a form library like react-hook-form could be used to handled form validation once.
**Data Pagination**: For better visibility and UX, the users table could be paginated to prevent long scrolling.

## Additional Notes

**Version Control**: Frequent commits have been made throughout the project to ensure traceability and demonstrate the development process.

## Conclusion

This project demonstrates my ability to create a responsive, data-driven dashboard using React.js, with attention to modularity, design, and usability.
Thank you for reviewing this submission. Feedback is welcome!
