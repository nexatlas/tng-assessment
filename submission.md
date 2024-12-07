# MetricWizz 📊

## Project Overview

MetricWizz is a comprehensive React-based web application for advanced metric tracking and visualization.

## Prerequisites

- Node.js (v16.0.0 or later)
- npm (v8.0.0 or later)
- Git

## Setup and Local Development

### 1. Clone the Repository

git clone
https://github.com/nexatlas/tng-assessment.git
cd tng-assessment

### 2. Environment Configuration

Create a `.env` file in the root directory of the project with the following variables:

REACT_APP_AUTH_EMAIL=miketest@gmail.com
REACT_APP_AUTH_PASS=@Password123

**Note:** Add `.env` to your `.gitignore` file to prevent sensitive information from being pushed.

### 3. Install Dependencies

npm install

### 4. Run the Application

npm start

### 5. Login Credentials

- **Email:** miketest@gmail.com
- **Password:** @Password123

## Technology Stack

### Libraries and Tools

- **UI Framework:** Chakra UI

  - Provides a modular and accessible component library
  - Enables rapid UI development with consistent design

- **State Management:** Redux

  - Centralized state container
  - Predictable state updates
  - Facilitates complex state interactions

- **Charting:** Recharts

  - Composable chart library for React
  - Supports various chart types and customizations

- **Icons:** React Icons

  - Comprehensive icon library
  - Easy integration of popular icon sets

- **Date/Time Handling:** Moment.js
  - Powerful library for parsing, validating, manipulating, and formatting dates

## Areas for Improvement and Scalability

### Performance Optimizations

1. **Lazy Loading**

   - Implement React.lazy() and Suspense for code-splitting
   - Load components and routes dynamically to reduce initial bundle size

2. **Memoization**

   - Use React.memo() for preventing unnecessary re-renders
   - Implement useMemo() and useCallback() for expensive computations

3. **Caching Strategies**
   - Use browser caching mechanisms
4. **Performance Monitoring**
   - Integrate performance monitoring tools
   - Use React DevTools Profiler
