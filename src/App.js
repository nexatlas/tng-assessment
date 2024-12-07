import './App.css';
import { Routes, Route, useNavigate } from 'react-router-dom';
import { useEffect, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { userActionTypes } from './redux/constants/userActionTypes';
import Login from './pages/auth/login/login';
import Dashboard from './pages/dashboard/dashboard';
import Home from './pages/dashboard/home/home';

function App() {
  const dispatch = useDispatch();
  const navigate = useNavigate();

  const [collapsed, setCollapsed] = useState(false);

  const currentUser = useSelector(({ userData }) => userData?.currentUser);

  useEffect(() => {
    if (localStorage.TNGTK) {
      dispatch({
        type: userActionTypes.LOADUSER_SUCCESS,
        payload: { email: 'miketest@gmail.com' },
      });
    } else {
      dispatch({ type: userActionTypes.LOADUSER_FAIL, payload: null });
      navigate('/login');
    }
  }, []);

  return (
    <>
      <div className="App">
        <Routes>
          <Route
            path="/"
            element={
              currentUser ? (
                <Dashboard
                  collapsed={collapsed}
                  setCollapsed={setCollapsed}
                  component={<Home />}
                />
              ) : (
                <Login />
              )
            }
          />
          <Route path="/login" element={<Login />} />
        </Routes>
      </div>
    </>
  );
}

export default App;
