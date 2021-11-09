import React from 'react'; 
import Tile from './tile';

export default class Board extends React.Component { 
  constructor(props) {
    super(props); 
    this.renderRow = this.renderRow.bind(this); 
    this.renderTile = this.renderTile.bind(this); 
  }

  renderRow() {
    return this.props.board.grid.map((row, idx) => {
      return (
      <div className="row" key={idx}>{this.renderTile(row)}</div>
    )})
  }

  renderTile(row) {
    return row.map((tile, idx2)=> {
      return (
      <Tile updateGame={this.props.updateGame} tile={tile} key={idx2}/>
    )})
  }

  render() {
    return (
      <div className='board'>
       {this.renderRow()}
      </div>
    )
  }
}

