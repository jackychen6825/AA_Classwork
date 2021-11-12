import { RECEIVE_ALL_POKEMON } from '../actions/pokemon_actions';

const pokemonReducer = (state = {}, action) => {
    Object.freeze(state);
    
    switch(action.type) {
        case RECEIVE_ALL_POKEMON:
            let pokemon = Object.assign({}, action.pokemon, state);
            return pokemon
        default:
            return state 
    }
}

export default pokemonReducer;