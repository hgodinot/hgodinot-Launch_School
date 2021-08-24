function sayAge(name, min, max) {
  [min, max] = [Math.min(min, max), Math.max(min, max)];
  let age = Math.floor(Math.random() * (max - min + 1)) + min;
  return `${name} is ${age} years old!`;
}

console.log(sayAge('Teddy', 11, 9));
console.log(sayAge('Teddy', 20, 200));