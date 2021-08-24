 function concatenate(arr) {
  let result = '';

  for (let i = 0; i < arr.length; i += 1){
    result += arr[i];
  }

  return result;
 }


 console.log(concatenate([1, 'a', 4]));