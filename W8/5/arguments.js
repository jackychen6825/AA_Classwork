function sum() {
    let sum = 0; 
    for (let i = 0; i < arguments.length; i++) {
        sum += arguments[i]; 
    }
    return sum 
}


function sum(...args) {
    let sum = 0;
    for (let i = 0; i < args.length; i++) {
        sum += args[i];
    }
    return sum
}

// console.log(sum(1, 2, 3, 4))
// console.log(sum(1, 2, 3, 4, 5))

Function.prototype.myBind = function (ctx) {
    let func = this;
    let bindArgs = Array.from(arguments).slice(1);

    return function () {
        let callArgs = Array.from(arguments); 
        let allArgs = bindArgs.concat(callArgs); 
        return func.apply(ctx, allArgs); 
    }
}

Function.prototype.myBind = function (ctx, ...args) {
    let func = this;
    let bindArgs = args;

    return function (...args) {
        let callArgs = args; 
        let allArgs = bindArgs.concat(callArgs); 
        return func.apply(ctx, allArgs); 
    }
}



class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind(pavlov, "meow", "Kush")();
// Pavlov says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "a tree"
markov.says.myBind(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBind(pavlov);
notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true

function curriedSum(args) {
    const numbers = []; 

    return function _curriedSum(number) {
        numbers.push(number); 
        if (numbers.length === args) {
            let sum = 0;
            for (let integer of numbers) {
                sum = sum + integer; 
            }
            return sum 
        } else {
            return _curriedSum 
        }
    }

    // return _curriedSum : also works 
} 

const testing = curriedSum(4);
console.log(testing(5)(30)(20)(1)) 

Function.prototype.curry = function () {
    
}