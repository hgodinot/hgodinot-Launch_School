function minilang(str) {
  let stack = [];
  let register = 0;

  let commands = str.split(' ');

  commands.forEach(command => {
    switch (command) {
    case 'PRINT':
      console.log(register);
      break;

    case 'PUSH':
      stack.push(register);
      break;

    case 'ADD':
      register += stack.pop();
      break;

    case 'SUB':
      register -= stack.pop();
      break;

    case 'MULT':
      register *= stack.pop();
      break;

    case 'DIV':
      register = Math.round(register / stack.pop());
      break;

    case 'REMAINDER':
      register %= stack.pop();
      break;

    case 'POP':
      register = stack.pop();
      break;

    default:
      register = Number(command);
    }
  });
}



minilang('PRINT');
// 0

minilang('5 PUSH 3 MULT PRINT');
// 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT');
// 5
// 3
// 8

minilang('5 PUSH POP PRINT');
// 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT');
// 5
// 10
// 4
// 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT');
// 6

minilang('4 PUSH PUSH 7 REMAINDER MULT PRINT');
// 12

minilang('-3 PUSH 5 SUB PRINT');
// 8

minilang('6 PUSH');
// (nothing is printed because the `program` argument has no `PRINT` commands)