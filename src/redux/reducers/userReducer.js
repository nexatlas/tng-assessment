import { userActionTypes } from '../constants/userActionTypes';

const INIT_STATE = {
  token: localStorage.getItem('TNGTK'),
  isLoading: true,
  currentUser: null,
  isAuthenticated: false,
};

const userReducer = (state = INIT_STATE, action) => {
  switch (action.type) {
    case userActionTypes.SIGNIN_SUCCESS:
      return {
        ...state,
        isLoading: true,
        currentUser: action.payload,
        isAuthenticated: true,
      };
    case userActionTypes.LOGOUT_FAIL:
      return {
        ...state,
        isLoading: false,
        authError: {
          signOutError: action.payload,
        },
      };
    case userActionTypes.LOGOUT_SUCCESS:
      localStorage.removeItem('TNGTK');
      return {
        ...state,
        isLoading: false,
        currentUser: null,
        isAuthenticated: false,
      };
    case userActionTypes.LOADUSER_SUCCESS:
      return {
        ...state,
        isLoading: false,
        currentUser: action.payload,
        isAuthenticated: true,
      };
    case userActionTypes.LOADUSER_FAIL:
      localStorage.removeItem('TNGTK');
      return {
        ...state,
        isLoading: false,
        isAuthenticated: false,
        token: null,
        authError: {
          loadUserError: action.payload,
        },
      };
    default:
      return state;
  }
};

export default userReducer;
