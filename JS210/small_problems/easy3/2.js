function numGame() {
  const Order = ['1st', '2nd', '3rd', '4th', '5th', 'last'];
  let answers = [];
  let readline = require('readline-sync');

  Order.forEach(ord => answers.push(readline.question(`Enter the ${ord} number: `)));
  
  let successMessage = `The number ${answers[5]} appears in [${answers}].`
  let failureMessage = `The number ${answers[5]} does not appear in [${answers}].`

  return answers.slice(0, 5).includes(answers[5])? successMessage : failureMessage;
}

console.log(numGame());
