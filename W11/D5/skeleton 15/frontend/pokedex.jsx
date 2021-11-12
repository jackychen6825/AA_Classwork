import React from 'react';
import ReactDOM from 'react-dom';
import fetchAllPokemon from './util/api_utils';
import { RECEIVE_ALL_POKEMON, receiveAllPokemon, requestAllPokemon} from './actions/pokemon_actions'
import configureStore from "./store/store"
import selectAllPokemon from "./reducers/selectors";

document.addEventListener('DOMContentLoaded', () => {
    const rootEl = document.getElementById('root');
    window.fetchAllPokemon = fetchAllPokemon; 
    window.receiveAllPokemon = receiveAllPokemon;
    let store = configureStore();
    window.requestAllPokemon = requestAllPokemon; 
    window.store = store;
    window.getState = store.getState; 
    window.dispatch = store.dispatch;
    window.selectAllPokemon = selectAllPokemon; 
    ReactDOM.render(<h1>Pokedex</h1>, rootEl);
});