import { RECEIVE_STEP, RECEIVE_STEPS, REMOVE_STEP } from "../actions/step_actions";

const stepsReducer = (state = {}, action) => {
    let nextState;
    switch (action.type) {
        case RECEIVE_STEPS:
            nextState = {}
            for (let i = 0; i < action.steps.length; i++) {
                nextState[i] = action.steps[i];
            }
            return nextState

        case RECEIVE_STEP:
            nextState = Object.assign({}, state);
            nextState[action.step.id] = action.step;
            return nextState;

        case REMOVE_STEP:
            nextState = Object.assign({}, state);
            delete nextState[action.step.id];
            return nextState;

        default:
            return state;
    }
};

export default stepsReducer;