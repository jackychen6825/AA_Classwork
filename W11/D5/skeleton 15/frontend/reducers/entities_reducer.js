import { combineReducers } from "redux";
import pokemonReducer from "./pokemon_reducers";

const entitiesReducer = combineReducers({
    pokemon: pokemonReducer,
})

export default entitiesReducer; 