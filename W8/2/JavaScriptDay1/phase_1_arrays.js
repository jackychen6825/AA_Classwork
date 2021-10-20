Array.prototype.uniq = function() {
  let uniq = [];
  this.forEach(function(ele){
    if (!uniq.includes(ele)) {
      uniq.push(ele);
    }
  })
  return uniq;
}

Array.prototype.twoSum = function() {
  let pairs = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this.length; j++) {
      if (this[i] + this[j] === 0 && j > i) {
        pairs.push([i, j]); 
      }
    }
  }
  return pairs;
}

Array.prototype.transpose = function() {
  let transposed = [];
  for (let i = 0; i < this[0].length; i++) {
    let row = []; 
    for (let j = 0; j < this.length; j++) {
      row.push(this[j][i]); 
    }
    transposed.push(row);
  }
  return transposed
} 


