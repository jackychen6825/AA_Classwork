import React from 'react';
import ReactDOM from 'react-dom';
import Content from './content';
import configureStore from './store/store';
import { receiveTodo, receiveTodos, removeTodo } from './actions/todo_actions'
import { receiveStep, receiveSteps, removeStep } from './actions/step_actions'

document.addEventListener('DOMContentLoaded', () => {
  let root = document.getElementById('root')
  let store = configureStore(); 
  window.store = store;
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  window.removeTodo = removeTodo;
  window.receiveStep = receiveStep;
  window.receiveSteps = receiveSteps;
  window.removeStep = removeStep;

  ReactDOM.render(<Content />, root)
})
