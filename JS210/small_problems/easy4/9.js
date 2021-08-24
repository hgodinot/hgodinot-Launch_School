function countOccurences(arr) {
  result = {};

  arr.forEach(wrd => result[wrd]? result[wrd] += 1 : result[wrd] = 1);

  Object.keys(result).forEach(key => console.log(`${key} => ${result[key]}`));
}

const vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
                'motorcycle', 'motorcycle', 'car', 'truck'];

countOccurences(vehicles);

// console output
// car => 4
// truck => 3
// SUV => 1
// motorcycle => 2