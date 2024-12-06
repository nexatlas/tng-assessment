import { uiActionTypes } from '../constants/uiActionTypes';

export const changeSwitchIndex = (buttonIndex) => (dispatch) => {
  dispatch({ type: uiActionTypes.BUTTON_INDEX, payload: buttonIndex });
};
