import React from 'react';
import ReactDOM from 'react-dom';

import Game from './frontend/components/game';

function Root() {
  return (
    <div className="root">
      <Game />
    </div>
  );
}

document.addEventListener("DOMContentLoaded", () => {
  const main = document.getElementById("root");
  ReactDOM.render(<Root />, main);
});