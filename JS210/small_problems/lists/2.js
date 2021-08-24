const NUMBERS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight',
                 'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 
                 'sixteen', 'seventeen', 'eighteen', 'nineteen']

function alphabeticNumberSort(arr) {
  return arr.slice().sort((a, b) => {
    if (NUMBERS[a] > NUMBERS[b]) {
      return 1;
    } else if (NUMBERS[a] < NUMBERS[b]) {
      return -1;
    } else {
      return 0;
    } 
  })
}

let numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]

console.log(alphabeticNumberSort(numbers));
// [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]

console.log(numbers);
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]

