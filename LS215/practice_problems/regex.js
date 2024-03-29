let isUrl = str => !!str.match(/^https?:\/\/\S+\.\S+$/g);


console.log(isUrl('http://launchschool.com'));   // -> true
console.log(isUrl('https://example.com'));       // -> true
console.log(isUrl('https://example.com hello')); // -> false
console.log(isUrl('   https://example.com'));    // -> false




let fields = str => str.split(/[ ,\t]+/);

console.log(fields("Pete,201,Student"));
// -> ['Pete', '201', 'Student']

console.log(fields("Pete \t 201    ,  TA"))
// -> ['Pete', '201', 'TA']

console.log(fields("Pete \t 201"));
// -> ['Pete', '201']

console.log(fields("Pete \n 201"));

// -> ['Pete', '\n', '201']




let mystery_math = str => str.replace(/[+\-*\/]/, '?');

console.log(mystery_math('4 + 3 - 5 = 2'));
// -> '4 ? 3 - 5 = 2'

console.log(mystery_math('(4 * 3 + 2) / 7 - 1 = 1'));
// -> '(4 ? 3 + 2) / 7 - 1 = 1'




let mysteriousMath = str => str.replace(/[+\-*\/]/, '?');


console.log(mysteriousMath('4 + 3 - 5 = 2'));           // -> '4 ? 3 ? 5 = 2'
console.log(mysteriousMath('(4 * 3 + 2) / 7 - 1 = 1')); // -> '(4 ? 3 ? 2) ? 7 ? 1 = 1'




let danish = str => str.replace(/\b(apple|blueberry|cherry)\b/, 'danish');

console.log(danish('An apple a day keeps the doctor away'));
// -> 'An danish a day keeps the doctor away'

console.log(danish('My favorite is blueberry pie'));
// -> 'My favorite is danish pie'

console.log(danish('The cherry of my eye'));
// -> 'The danish of my eye'

console.log(danish('apple. cherry. blueberry.'));
// -> 'danish. cherry. blueberry.'

console.log(danish('I love pineapple'));
// -> 'I love pineapple'




let formatDate = date => date.replace(/^(\d{4})-(\d{2})-(\d{2})/, '$3.$2.$1');

console.log(formatDate('2016-06-17')); // -> '17.06.2016'
console.log(formatDate('2016/06/17')); // -> '2016/06/17' (no change)





let formatOtherDate = date => date.replace(/^(\d{4})([\/\-])(\d{2})\2(\d{2})/, '$4.$3.$1');

console.log(formatOtherDate('2016-06-17')); //# -> '17.06.2016'
console.log(formatOtherDate('2017/05/03')); //# -> '03.05.2017'
console.log(formatOtherDate('2015/01-31')); //# -> '2015/01-31' (no change)
