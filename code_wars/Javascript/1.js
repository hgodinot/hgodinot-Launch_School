//Positions Average - 6Kyu Kata

function posComparisons(str1, str2) {
  let result = 0;

  for (let index = 0; index < str1.length; index += 1) {
   if (str1[index] === str2[index]) result += 1;
  }

   return result;
}

function posAverage(str) {
  let common_counter = 0;
  let combinations_counter = 0;
  let arr = str.split(', ');

  for (let i = 0; i < arr.length - 1; i += 1) {
    for (let idx = i + 1; idx < arr.length; idx += 1) {
      combinations_counter += 1;
      common_counter += posComparisons(arr[i], arr[idx]);
    }
  }

  return (common_counter / (combinations_counter * arr[0].length)).toFixed(12) * 100;
}



let str = "466960, 069060, 494940, 060069, 060090, 640009, 496464, 606900, 004000, 944096"
console.log(posAverage(str));

/*
PEDAC

Input: Str
Output: Number. Float with 10 decimals
Rules: Find % of common combinations

Combine first substr with 2 to n (all other). Then 2 to 3-n, 3 to 4-n, and so on till n-1 compared to n.
Increment a counter for each position in common.
Then, at the end, divide by total number of comparisons
*/