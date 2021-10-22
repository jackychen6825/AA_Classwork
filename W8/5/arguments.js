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
    let bindArgs = Array.from(arguments);

    return function () {
        let callArgs = Array.from(arguments); 
        let allArgs = bindArgs.concat(callArgs); 
        return func.apply(ctx, allArgs); 
    }
}

