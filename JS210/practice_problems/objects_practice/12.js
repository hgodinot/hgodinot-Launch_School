function greetings(...args) {
  let name = args[0].join(' ');
  let occupation = args[1]['title'] + ' ' + args[1]['occupation'];

  console.log(`Hello, ${name}! Nice to have a ${occupation} around.`);
}

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' });

