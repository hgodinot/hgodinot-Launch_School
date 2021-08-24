let splice = (array, start, num) => {
  let removedValues = [];

  for (let i = start; i < array.length; i += 1) {
    if ( i < start + num ) {
      removedValues.push(array[i]);
    }

    array[i] = array[i + num];
  }

  array.length -= num;
  return removedValues;
}

let count = [1, 2, 3, 4, 5, 6, 7, 8];
console.log(splice(count, 2, 5));                   // [ 3, 4, 5, 6, 7 ]
console.log(count);                                 // [ 1, 2, 8 ]

/* Longer way to do it:

let splice = (array, start, num) => {
  let removedValues = array.slice(start, start + num);
  let keptValues = [];

  for (let i = 0; i < array.length; i += 1) {
    if (i < start || i > start + num - 1) {
      keptValues.push(array[i]);
    }
  }

  array.length = keptValues.length;
  for (let i = 0; i < array.length; i += 1 ) {
    array[i] = keptValues[i];
  }


  return removedValues;
}
*/
