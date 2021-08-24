let invalidInput = str => typeof(str) !== 'string' || !str.match(/^(\d+((,\s|\-|:|\.\.)\d+)*|\s*)$/);

function nextNumber(array, str) {
  let result = Number(str);
  let digits = str.length; 
  let last = array.slice(-1)[0];

  if (array.length > 0) {
    if (result <= last) {
      do {
        result += 1;
      } while (result <= last || String(result).slice(-digits) !== str);
    }
  }

  return Number(result);
}

function convertShortRange(str) {
  const SEPARATORS = /[\-:(\.\.)]/g;
  let resultArray = [];

  if (invalidInput(str)) return null;
  if (str.trim() === '') return resultArray;

  let arr = str.split(',');

  arr.forEach((x) => {
    if (!x.match(SEPARATORS)) {
      resultArray.push(nextNumber(resultArray, x.trim()));
    } else {
      x.split(SEPARATORS).forEach((val, idx) => {
        if (idx === 0) {
          resultArray.push(nextNumber(resultArray, val.trim()));
        } else {
          let maxRange = nextNumber(resultArray, val.trim());
          for (let i = resultArray.slice(-1)[0] + 1; i <= maxRange; i += 1 ) {
            resultArray.push(i)
          }
        }
      })
    }
  })

  return resultArray;
}

console.log(convertShortRange("1, 3, 7, 2, 4, 1")); //[1, 3, 7, 12, 14, 21]
console.log(convertShortRange("1-3, 1-2")); // [1, 2, 3, 11, 12]
console.log(convertShortRange("1:5:2"));  //1, 2, 3, 4, 5, 6, ... 12
console.log(convertShortRange("104-2")); //104, 105, ... 112
console.log(convertShortRange("104-02"));  //104, 105, ... 202
console.log(convertShortRange("545, 64:11"));  //545, 564, 565, .. 611

console.log(convertShortRange("2"));  //[2]

console.log(convertShortRange("")); // []
console.log(convertShortRange("      ")); // []

console.log(convertShortRange([1, 3, 4])); // null
console.log(convertShortRange("1, 3, 4-5, a, 46")); // null
console.log(convertShortRange("1, 3, 4--5, 46")); // null
console.log(convertShortRange(",1, 3, 4-5, 46")); // null
console.log(convertShortRange("1, 3, 4-5, 46,")); // null

/*

ALGORYTHM:

Declare function.
Test validity of input, if needed return empty array

declare a result variable
Use split to get an array of strings. 
Iterate over that array with forEach, with index.

Fill in result going through the array, element by element.

  If just a number(no separator) => 
    If result empty put that number in result array (push) converting it to number
    else increment it if necessary(helper method) and push it in array
  
    If separator, call split method with regex 3 separators on it and map to convert to numbers
    [545] [545, [61, 11]]

    Iterate over elements of array:
      If index = 0 
        then add number to result following increment helper method with last element
      if index > 0
        determine number thanks to increment helper
        Add all element between two numbers in the result array (helper method)





Increment helper method(char, last array-element)
[545] 65 => [545, 565]
  if last array element < char, then return this element
  else declare variable num
  for loop:
    add one to num until String(num).slice(-String(num.length) === String(char))

  return this element

PEDAC

Input: String of numbers separated by , or one of three separators ('-' ':' '..').

Output: Array of numbers


RULES

Return the non abreviated numbers.

',' adds a number.
The other 3 separators add the numbers between the 2 numbers that the separator is between. 

To determine a number we have too look at the last one: 4 after 5 will be 14. After 3 it will be 4. 
It has to finish by the number, and to be greater than the last one. 

EXAMPLES:

Edge Cases: Non valid input:
  No string as input (other type)
  Non valid characters (can only have 10 numbers + 4 separators)
  More than one consecutive demarcator combination
  Begins or end with a demarcator

  Empty string ('' or '     ') should return empty array



  DATA STRUCTURE

  Use an array with split. 

*/