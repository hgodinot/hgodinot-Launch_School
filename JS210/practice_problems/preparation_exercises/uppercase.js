function convert(str) {
  if (str.length > 10) {
    return str.toUpperCase();
  } else {
    return str;
  }
}

console.log(convert("hello world"));
console.log(convert ("hello"));