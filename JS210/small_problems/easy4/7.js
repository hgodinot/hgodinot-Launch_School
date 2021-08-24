function multiplyList(...arr) {
  let result = [];

  arr[0].forEach((val, index) => {
    newVal = val

    for (i = 1; i < arr.length; i += 1) {
      newVal *= arr[i][index];
    }

    result.push(newVal);
  })

  return result;
}

console.log(multiplyList([3, 5, 7], [9, 10, 11]));    // [27, 50, 77]