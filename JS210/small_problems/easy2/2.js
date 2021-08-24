function logInBox(str) {
  size = str.length;

  exterior = '+-' + '-'.repeat(size) + '-+';
  interior = '| ' + ' '.repeat(size) + ' |';
  text = '| ' + str + ' |';

  [exterior, interior, text, interior, exterior].forEach (string => console.log(string));
}

logInBox('To boldly go where no one has gone before.');
logInBox('');