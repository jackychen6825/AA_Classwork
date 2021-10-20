function range(start, end) {
  
  if (start === end){
    return [end];
  }
  let arr = range(start, end-1); 
  arr.push(end-1);
  return arr;
}

function range(start, end) {
  
  if (start === end) {
    return [start]
  }

  let arr = [];
  arr.concat(range(start, end-1));
  return arr
  
  += 
}

