function randomInt(min, max) {
  [min, max] = [Math.min(min, max), Math.max(min, max)];
  return Math.floor(Math.random() * (max - min + 1) + min);
}

console.log(randomInt(1, 5));