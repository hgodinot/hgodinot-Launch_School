function isBalanced(str){
  let count = 0;

  let arrayParanthesis = str.replace(/[^\(\)]/g, '').split('');

  for (i = 0; i <arrayParanthesis.length; i += 1) {
    if (arrayParanthesis[i] === '(') {
      count += 1;
    } else if (arrayParanthesis[i] === ')') {
      count -= 1;
      if (count < 0) return false;
    }
  }

  return count === 0;
}

console.log(isBalanced('What (is) this?'));        // true
console.log(isBalanced('What is) this?'));         // false
console.log(isBalanced('What (is this?'));         // false
console.log(isBalanced('((What) (is this))?'));    // true
console.log(isBalanced('((What)) (is this))?'));   // false
console.log(isBalanced('Hey!'));                   // true
console.log(isBalanced(')Hey!('));                 // false
console.log(isBalanced('What ((is))) up('));       // false