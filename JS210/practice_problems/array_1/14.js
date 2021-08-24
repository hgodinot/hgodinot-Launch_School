let join = (array, separator) => {
  string = '';

  array.forEach(element => string += String(element) + separator);

  return string.substr(0, string.length - separator.length);
}


console.log(join(['bri', 'tru', 'wha'], 'ck '));       // 'brick truck wha'
console.log(join([1, 2, 3], ' and '));                 // '1 and 2 and 3'