function slice(array, begin, end) {
  result = [];

  for (i = begin; i < array.length; i += 1){
    if (i < end) result.push(array[i]);
  }

  return result;
}

function splice(array, start, deleteCount, ...args) {
  deleteCount = Math.min(deleteCount, array.length - start); 
  let postStartDelete = []; 
  let deletedValues = []; 

  while (array.length > start) { 
    postStartDelete.unshift(array.pop());
  }

  args.forEach(val => array.push(val)); 

  for (let i = 0; i < deleteCount; i += 1) { 
    deletedValues.push(postStartDelete.shift());
  }

  while (postStartDelete.length > 0) { 
    array.push(postStartDelete.shift());
  }

  return deletedValues;
}



console.log(slice([1, 2, 3], 1, 2));               // [2]
console.log(slice([1, 2, 3], 2, 0));               // []
console.log(slice([1, 2, 3], 5, 1));               // []
console.log(slice([1, 2, 3], 0, 5));               // [1, 2, 3]

const arr1 = [1, 2, 3];
console.log(slice(arr1, 1, 3));                     // [2, 3]
console.log(arr1);                                  // [1, 2, 3]


console.log() //Space for tests readability.

console.log(splice([1, 2, 3], 1, 2));              // [2, 3]
console.log(splice([1, 2, 3], 1, 3));              // [2, 3]
console.log(splice([1, 2, 3], 1, 0));              // []
console.log(splice([1, 2, 3], 0, 1));              // [1]



console.log(splice([1, 2, 3], 1, 0, 'a'));         // []



const arr2 = [1, 2, 3];
console.log(splice(arr2, 1, 1, 'two'));             // [2]
console.log(arr2);                                  // [1, "two", 3]

const arr3 = [1, 2, 3];
console.log(splice(arr3, 1, 2, 'two', 'three'));    // [2, 3]
console.log(arr3);                                  // [1, "two", "three"]

const arr4 = [1, 2, 3];
console.log(splice(arr4, 1, 0));                    // []
console.log(splice(arr4, 1, 0, 'a'));               // []
console.log(arr4);                                  // [1, "a", 2, 3]

const arr5 = [1, 2, 3];
console.log(splice(arr5, 0, 0, 'a'));               // []
console.log(arr5);                                  // ["a", 1, 2, 3]
