function makeCounter() {
  let counter = 0;
  let counter2 = 0;

  const fun1 = function() {
    counter += 1;
    return counter;
  }

  const fun2 = function() {
    counter2 += 2;
    return counter2;
  }

  return [fun1, fun2];
}

let funs = makeCounter();
let fun1 = funs[0];
let fun2 = funs[1];
console.log(fun1()); // 1
console.log(fun2()); // 3