function newStack() {
  let stack = [];

  return {
    push(val) {
      stack.push(val);
    },

    pop() {
      return stack.pop();
    },
    
    printStack() {
      stack.forEach(val => console.log(val));
    }
  }
}

let test = newStack();

test.push('1');
test.push('2');
test.push('3');

test.printStack();

test.pop();
test.pop();
test.push('4');

test.printStack();