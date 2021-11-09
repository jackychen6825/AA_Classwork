import React, { Component } from 'react'
import Board from "./board";
import * as Minesweeper from "./minesweeper"; 

export default class Game extends Component {
    constructor(props){
        super(props)
        const board = new Minesweeper.Board(10, 10); 
        this.state = {
            board: board
        }
        this.updateGame = this.updateGame.bind(this); 
        this.restartGame = this.restartGame.bind(this); 
    }

    updateGame(tile, flagged){
        if (flagged) {
            tile.toggleFlag(); 
        } else {
            tile.explore(); 
        }
        this.setState({ board: this.state.board });
    }

    restartGame() {
        const board = new Minesweeper.Board(10, 10);
        this.setState({ board: board });
    }

    render() {
        if (this.state.board.lost()) {
            console.log('You Lost.')
            this.restartGame();
        } else if (this.state.board.won()) {
            console.log('You Won.')
            this.restartGame();
        } else {
            console.log("Keep going")
            return (
                <div>
                  <Board board={this.state.board} updateGame={this.updateGame}/>
                </div>
            )
        }
        
    }
}
