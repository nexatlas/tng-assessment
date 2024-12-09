import { useState } from "react";
import { FaBars, FaTimes } from "react-icons/fa";

const Navbar = ({
  setIsAuthenticated,
}: {
  setIsAuthenticated: (isAuthenticated: boolean) => void;
}) => {
  const [isOpen, setIsOpen] = useState(false);

  const toggleMenu = () => {
    setIsOpen(!isOpen);
  };

  return (
    <nav className="bg-white shadow-md sticky top-0 z-50">
      <div className="container mx-auto flex justify-between items-center p-4">
        <h1 className="text-xl font-bold text-primary">MetricWizz</h1>
        <div className="lg:hidden">
          <button
            onClick={toggleMenu}
            className="text-primary focus:outline-none"
          >
            {isOpen ? (
              <FaTimes className="w-6 h-6" />
            ) : (
              <FaBars className="w-6 h-6" />
            )}
          </button>
        </div>
        <ul className="hidden lg:flex space-x-6">
          <li className="hover:text-secondary">
            <a href="#dashboard">Dashboard</a>
          </li>
          <li className="hover:text-secondary">
            <a href="#metrics">Metrics</a>
          </li>
          <li className="hover:text-secondary">
            <a href="#activity">Activity</a>
          </li>
          <li className="hover:text-secondary">
            <a href="#userList">User List</a>
          </li>
          <li className="hover:text-secondary">
            <button
              onClick={() => setIsAuthenticated(false)}
              className="focus:outline-none"
            >
              Logout
            </button>
          </li>
        </ul>
      </div>
      {isOpen && (
        <div className="lg:hidden fixed inset-0 bg-background_1 bg-opacity-75 z-50">
          <div className="w-1/2 h-full bg-white shadow-lg">
            <div className="flex justify-end p-4">
              <button
                onClick={toggleMenu}
                className="text-primary focus:outline-none"
              >
                <FaTimes className="w-6 h-6" />
              </button>
            </div>
            <ul className="flex flex-col items-start p-4 space-y-6 text-primary">
              <li className="hover:text-secondary">
                <a href="#dashboard" onClick={toggleMenu}>
                  Dashboard
                </a>
              </li>
              <li className="hover:text-secondary">
                <a href="#metrics" onClick={toggleMenu}>
                  Metrics
                </a>
              </li>
              <li className="hover:text-secondary">
                <a href="#activity" onClick={toggleMenu}>
                  Activity
                </a>
              </li>
              <li className="hover:text-secondary">
                <a href="#userList" onClick={toggleMenu}>
                  User List
                </a>
              </li>
              <li className="hover:text-secondary">
                <a href="#userList" onClick={toggleMenu}>
                  User List
                </a>
              </li>
            </ul>
          </div>
        </div>
      )}
    </nav>
  );
};

export default Navbar;
