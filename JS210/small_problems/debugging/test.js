/*
function makeCounter() {
  let counter = 0;

  return function() {
    counter += 1;
    return counter;
  }
}


let incrementCounter = makeCounter();
incrementCounter();
console.log(incrementCounter()); // 1
console.log(incrementCounter()); // 2


function tester() {
  return 5;
}

console.log(tester());
*/


function makeCounter() {
  let counter = 0;

  const fun1 = function() {
    counter += 1;
    return counter;
  }

  const fun2 = function() {
    counter += 2;
    return counter;
  }

  return [fun1, fun2];
}

let funs = makeCounter();
let fun1 = funs[0];
let fun2 = funs[1];
console.log(fun1()); // 1
console.log(fun2()); // 3
console.log(funs); 
//console.log(funs()); error