let repeater = (str, num = 2) => str.split('').map(chr => chr.repeat(num)).join('');

console.log(repeater('Hello'));        // "HHeelllloo"
console.log(repeater('Good job!'));    // "GGoooodd  jjoobb!!"
console.log(repeater(''));             // ""
console.log(repeater('arty', 3));             // "aaarrrtttyyy"