Array.prototype.myEach = function(callback) {
  let new_arr = this
  for (let i = 0; i < this.length; i++) {
    let element = this[i];
    callback(element);
  }
}

Array.prototype.myMap = function(callback) {
  let new_arr = []
  for (let i = 0; i < this.length; i++) {
    let element = this[i];
    new_arr.push(callback(element));
  }
  return new_arr;
}



Array.prototype.myReduce = function(callback, [optional]) {
  let accumulator = optional;
  if (optional === undefined) {
    accumulator = this[0]; 
  } 

  if (optional === undefined) {
    for (let i = 1; i < this.length; i++) {
      accumulator = callback(accumulator, this[i])
    }
  }
  for (let i = 0; i < this.length; i++) {
    accumulator = callback(accumulator, this[i])
  }
  return accumulator
 } 

 
