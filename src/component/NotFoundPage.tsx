import { useNavigate } from "react-router-dom";

const NotFoundPage = () => {
  const navigate = useNavigate();

  const handleGoBack = () => {
    navigate("/dashboard");
  };

  return (
    <div className="min-h-screen flex flex-col justify-center items-center bg-gradient-to-r from-red-500 to-yellow-500 p-4 sm:p-6 lg:p-8">
      <div className="bg-white p-6 sm:p-8 lg:p-10 shadow-lg rounded-lg text-center">
        <h1 className="text-6xl font-bold mb-4 text-gray-800">404</h1>
        <p className="text-xl mb-6 text-gray-700">Page Not Found</p>
        <button
          onClick={handleGoBack}
          className="bg-blue-600 text-white py-2 px-4 rounded-md hover:bg-blue-700 transition"
        >
          Go Back to Dashboard
        </button>
      </div>
    </div>
  );
};

export default NotFoundPage;
