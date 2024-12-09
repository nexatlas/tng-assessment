import { Route, Routes } from "react-router-dom";
import Login from "./pages/auth/Login";
import { useState } from "react";
import Home from "./pages/dashboard/Home";
import { Navigate } from "react-router-dom";
import NotFoundPage from "./component/NotFoundPage";

function App() {
  const [isAuthenticated, setIsAuthenticated] = useState(false);

  return (
    <div className="bg-black">
      <Routes>
        <Route
          path="/login"
          element={
            <Login
              setIsAuthenticated={setIsAuthenticated}
              isAuthenticated={isAuthenticated}
            />
          }
        />

        <Route
          path="/dashboard"
          element={
            <Home
              setIsAuthenticated={setIsAuthenticated}
              isAuthenticated={isAuthenticated}
            />
          }
        />

        <Route path="/" element={<Navigate to="/dashboard" />} />
        <Route path="*" element={<NotFoundPage />} />
      </Routes>
    </div>
  );
}

export default App;
