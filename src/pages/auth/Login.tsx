import { useFormik } from "formik";
import { Navigate } from "react-router-dom";
import * as Yup from "yup";

interface LoginProps {
  setIsAuthenticated: (isAuthenticated: boolean) => void;
  isAuthenticated: boolean;
}

const Login = ({ setIsAuthenticated, isAuthenticated }: LoginProps) => {
  const formik = useFormik({
    initialValues: {
      email: "",
      password: "",
    },
    validationSchema: Yup.object({
      email: Yup.string().required("Email is required"),
      password: Yup.string().required("Password is required"),
    }),
    onSubmit: (values) => {
      console.log("values", values);
      setIsAuthenticated(true);
    },
  });

  if (isAuthenticated) {
    return <Navigate to="/dashboard" />;
  }

  return (
    <div className="min-h-screen flex justify-center items-center bg-gradient-to-r from-blue-500 to-purple-600 p-4 sm:p-6 lg:p-8">
      <form
        onSubmit={formik.handleSubmit}
        className="bg-white p-6 sm:p-8 lg:p-10 shadow-lg rounded-lg w-full max-w-md"
      >
        <h1 className="text-3xl font-bold mb-6 text-center text-gray-800">
          MetricWizz Login
        </h1>
        <div className="mb-4">
          <label
            htmlFor="email"
            className="block text-sm font-medium mb-2 text-gray-700"
          >
            Email
          </label>
          <input
            id="email"
            name="email"
            type="email"
            onChange={formik.handleChange}
            value={formik.values.email}
            className="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
          {formik.errors.email && formik.touched.email && (
            <p className="text-red-500 text-sm mt-1">{formik.errors.email}</p>
          )}
        </div>

        <div className="mb-6">
          <label
            htmlFor="password"
            className="block text-sm font-medium mb-2 text-gray-700"
          >
            Password
          </label>
          <input
            id="password"
            name="password"
            type="password"
            onChange={formik.handleChange}
            value={formik.values.password}
            className="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
          {formik.errors.password && formik.touched.password && (
            <p className="text-red-500 text-sm mt-1">
              {formik.errors.password}
            </p>
          )}
        </div>

        <button
          type="submit"
          className="w-full bg-purple-600 text-white py-2 rounded-md hover:bg-purple-700 transition"
        >
          Login
        </button>
      </form>
    </div>
  );
};

export default Login;
