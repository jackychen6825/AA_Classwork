require('./src/piece');

// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  var Piece = require("./piece");
}
// DON'T TOUCH THIS CODE

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  //initialize an 8 x 8 array 

  var myGrid = [...Array(8)].map(e => Array(8)); 

  //place the pieces down 
  //like arr[space - 1][space - 1] = new Piece(with the the color)

  myGrid[3][3] = new Piece('white');
  myGrid[4][4] = new Piece('white');
  myGrid[3][4] = new Piece('black');
  myGrid[4][3] = new Piece('black');

  return myGrid; 
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  let x = pos[0]
  let y = pos[1]
  if (x > 7 || x < 0 || y > 7 || y < 0){
    return false;
  }
  return true; 
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if (this.isValidPos(pos)){
    //grab piece 
    let x = pos[0];
    let y = pos[1];

    return this.grid[x][y];
  } else {
    throw new Error('Not valid pos!');
  }
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  // debugger 
  let x = pos[0];
  let y = pos[1];
  if (this.grid[x][y] instanceof Piece) {
    if (this.grid[x][y].color === color) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  let x = pos[0];
  let y = pos[1];
  if (this.grid[x][y] instanceof Piece) {
    return true; 
  } else {
    return false;
  }
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */


Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip=[]){
  //get the 'next' pos
  //adding pos + dir 
  let next_pos = [pos[0] + dir[0], pos[1] + dir[1]];

  if (this.isValidPos(next_pos)) {
    if (!(this.grid[next_pos[0]][next_pos[1]] instanceof Piece)) {
      return []; 
    } else {
      if ((this.grid[next_pos[0]][next_pos[1]].color === color)) {
        return piecesToFlip;
      } else {
        piecesToFlip.push(next_pos);
        return this._positionsToFlip(next_pos, color, dir, piecesToFlip);
      }
    }
  } else {
    return []; 
  }
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  let is_occupied = this.isOccupied(pos); 
  if (!is_occupied) {
    for (i = 0; i < Board.DIRS.length; i++) {
      let new_arr = this._positionsToFlip(pos, color, Board.DIRS[i])
      if (new_arr.length > 0) {
        return true;
      }
    }
  } else {
    return false;
  }
  return false; 
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (this.validMove(pos, color)){
    this.grid[pos[0]][pos[1]] = new Piece(color);
    for (i = 0; i < Board.DIRS.length; i++) {
      let new_arr = this._positionsToFlip(pos, color, Board.DIRS[i])
      if (new_arr.length > 0) {
        for(let i = 0; i < new_arr.length; i++){
          this.grid[new_arr[i][0]][new_arr[i][1]].flip(); 
        }
      }
    }
  } else {
    throw new Error("Invalid move!");
  }
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  //has to be a valid move 

  let valid_moves = [];
  for (let i = 0; i < this.grid.length; i++) {
    for (let j = 0; j < this.grid[i].length; j++) {
      if (this.validMove([i, j], color)) {
        valid_moves.push([i, j]);
      } 
      
    }
    
  }
  return valid_moves;
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  let new_arr = this.validMoves(color);
  if (new_arr.length > 0) {
    return true;
  } else {
    return false;
  }
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  if (this.hasMove('black') || this.hasMove('white')) {
    return false 
  } else {
    return true 
  }
};


/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  let new_arr = [];
  for (let i = 0; i < this.grid.length; i++) {
    new_arr.push([]);
    for (let j = 0; j < this.grid.length; j++) {
      if (this.grid[i][j] instanceof Piece) {
        new_arr[i].push(this.grid[i][j].toString());
      } else {
        new_arr[i].push("_");
      }
    }
  }
  console.log(new_arr);
  return new_arr;
};

let board = new Board();
board.print();

// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  module.exports = Board;
}
// DON'T TOUCH THIS CODE