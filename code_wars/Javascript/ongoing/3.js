//Bonuses 6 Kyu Kata

bonus = function(arr, s) {
  //let total = arr.reduce((a,c) => a + 1/c, 0);
  //return arr.map(e => Math.round(s*(1/e)/total))
}

console.log(bonus([22, 3, 15], 18228)); //[1860, 13640, 2728]
console.log(bonus([8, 14, 11], 23541)); //[10241, 5852, 7448]
console.log(bonus([8, 20, 17], 25281)); //[13515, 5406, 6360]
console.log(bonus([25, 22, 15, 22, 22], 5213)); //[858, 975, 1430, 975, 975]
console.log(bonus([10, 11, 30, 12, 17, 23, 30, 11, 17, 10], 1788210)); //[258060, 234600, 86020, 215050, 151800, 112200, 86020, 234600, 151800, 258060]

/*
PEDAC

Input: Array of numbers > 0 & number to share
Output: Array of numbers, same length are the input array. Sim is equal to the number argument

Rules: 

    B1 * 22 = B2 * 3 = B3 * 15 
&&  18228 = B1 + B2 + B3

22a = 3b = 15c 
a + b + c = 18228
a + 22/3a + 22/15a = 18228
15a + 110a + 22a = 18228 * 15
147a = 273420

[a, b, c...]
[max/a, max/b, max/c]
[[22, 22], [22, 3], [22, 15]]
  484, 66, 330


  [8, 14, 11], 23541
  8a = 14b = 11c
  


Bonus = (s/numbers of days off for all employees) employees

*/