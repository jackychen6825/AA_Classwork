import React, {Component} from "react";

class Tile extends Component {
  constructor(props) {
    super(props); 
    this.handleClickEvent = this.handleClickEvent.bind(this);
  }

  handleClickEvent(e) {
    const altPressed = e.altKey ? true : false; 
    this.props.updateGame(this.props.tile, altPressed); 
  }

  render() {

    const tile = this.props.tile;
    let type, unicode, count; 

    if (tile.explored) {
      if (tile.bombed) {
        type = 'bombed';
        unicode = '\u2622'; 
      } else {
        type = 'explored'; 
        count = tile.adjacentBombCount();
        unicode = count;
      }
    } else if (tile.flagged) {
      type = 'flagged';
      unicode = '\u2691';
    } else {
      type = 'unexplored'; 
      unicode = '';
    }
    
    return (
      <div className={`tile ${type}`} onClick={this.handleClickEvent}>
        {unicode}
      </div>
    )
  }
}

export default Tile; 

  