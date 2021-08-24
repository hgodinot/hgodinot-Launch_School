function partial(primary, arg1) {
  return function(arg2) {
    return primary(arg1, arg2);
  };
}

function greet(str1, str2) {
  console.log(str1[0].toUpperCase() + str1.slice(1) + ', ' + str2 + '!');
}

let sayHello = partial(greet, 'hello');

let sayHi = partial(greet, 'hi');

console.log(sayHello('Brandon'));
//Hello, Brandon!

console.log(sayHi('Sarah'));
//Hi, Sarah!

