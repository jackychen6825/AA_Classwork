import { RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKEMON } from './../actions/pokemon_actions';


const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type){
  case RECEIVE_ALL_POKEMON:
    return Object.assign({}, action.pokemon, state);
  case RECEIVE_SINGLE_POKEMON:
    const newPoke = { [action.payLoad.pokemon.id]: action.payLoad.pokemon };
    console.log(newPoke);
    return Object.assign({}, state, newPoke);
  default:
    return state;
  }
}
  
export default pokemonReducer;
