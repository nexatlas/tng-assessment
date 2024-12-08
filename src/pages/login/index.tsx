import { LoginUI } from "modules";
import { useNavigate } from "react-router-dom";
import { Routes } from "router";

const Login = () => {
  const navigate = useNavigate();

  const handleLogin = (data) => {
    navigate(Routes.dashboard);
  };

  return (
    <>
      <LoginUI submit={handleLogin} />
    </>
  );
};

export { Login };
