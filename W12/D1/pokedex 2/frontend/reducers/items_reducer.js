import { RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKEMON } from './../actions/pokemon_actions';

const itemsReducer = (state = {}, action) => {
  Object.freeze(state);

  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      return state;
    case RECEIVE_SINGLE_POKEMON:
      const newPokemonItems = {};
      return Object.assign({}, state, action.payLoad.items);
    default: 
      return state;
  }
}

export default itemsReducer;