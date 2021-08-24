function allIndexsOf(first, second) {
  let results = [];
  let length1 = first.length;
  let length2 = second.length;

  for (let index1 = 0; index1 < length1; index1 += 1) {
    if (first[index1] === second[0]) {
      match = true;

      for (let index2 = 1; index2 < length2; index2 += 1) {
        if (first[index1 + index2] !== second[index2]) match = false;
      }

      if (match) results.push(index1);
    }
  }

  return results.length === 0 ? [-1] : results;
}

function indexOf(firstString, secondString) {
  return allIndexsOf(firstString, secondString)[0];
}

function lastIndexOf(firstString, secondString) {
  last = allIndexsOf(firstString, secondString).length;
  return allIndexsOf(firstString, secondString)[last - 1];
}

console.log(indexOf('Some strings', 's'));                      // 5
console.log(indexOf('Blue Whale', 'Whale'));                    // 5
console.log(indexOf('Blue Whale', 'Blute'));                    // -1
console.log(indexOf('Blue Whale', 'leB'));                      // -1

console.log(lastIndexOf('Some strings', 's'));                  // 11
console.log(lastIndexOf('Blue Whale, Killer Whale', 'Whale'));  // 19
console.log(lastIndexOf('Blue Whale, Killer Whale', 'all'));    // -1