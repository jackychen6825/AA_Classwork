Function.prototype.inherits = function (parent) {
  // function Surrogates() {};
  // Surrogates.prototype = parent.prototype;
  // this.prototype = new Surrogates();
  // this.prototype.constructor = parent;
  this.prototype = Object.create(parent.prototype);
  this.prototype.constructor = this;
}

function MovingObject () {}

MovingObject.prototype.move = function () {
console.log('Is moving!')
}

function Ship () {}
Ship.inherits(MovingObject);

Ship.prototype.sail = function () {
  console.log('Is Sailing')
}

function Asteroid () {}
Asteroid.inherits(MovingObject);

Asteroid.prototype.hit = function () {
  console.log('asteroid is hit')
}

const s = new Ship();
const a = new Asteroid();

s.move();
a.move();



