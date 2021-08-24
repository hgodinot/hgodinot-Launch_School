Object.prototype.delegate = function(object, methodName, ...args) {
  return function() {
    return object[methodName].apply(object, args);
  }
}



const foo = {
  name: 'test',
  bar(greeting) {
    console.log(`${greeting} ${this.name}`);
  },
};

const baz = {
  qux: delegate(foo, 'bar', 'hello'),
};

baz.qux();   // logs 'hello test';

foo.bar = () => { console.log('changed'); };

baz.qux();          // logs 'changed'


function test(one, two, ...args) {
  console.log(args)
}