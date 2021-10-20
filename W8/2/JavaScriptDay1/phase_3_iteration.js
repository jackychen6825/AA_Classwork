Array.prototype.bubbleSort = function() {
  //bubble sort :333
  let sorted = false; 
  while (!sorted) {
    sorted = true; 
    for (let i = 0; i < this.length-1; i++) {
      if (this[i+1] < this[i]) {
        [this[i], this[i+1]] = [this[i+1], this[i]];
        sorted = false; 
      }
    }
  }
  return this;
}

//easyyyy peasy 

String.prototype.substrings = function() {
  let substrings = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i; j < this.length; j++) {
      substrings.push(this.slice(i,j));
    }
  }
  return substrings;
}

