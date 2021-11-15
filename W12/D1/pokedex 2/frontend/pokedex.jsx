import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import {fetchSinglePokemon} from './util/api_util';
import { requestSinglePokemon } from './actions/pokemon_actions';

document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById("root");
  const store = configureStore();
  ReactDOM.render(<Root store={store} />, rootEl)

  window.store = store;
  window.fetchSinglePokemon = (id) => (fetchSinglePokemon(id));
  window.requestSinglePokemon= (id) => (requestSinglePokemon(id));
})