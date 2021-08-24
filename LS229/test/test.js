pluck = (key) => element.map(val => val[key]);


let element = [{ foo: "bar", idx: 0 }, { foo: "baz", idx: 1 }, { foo: "bar", idx: 2 }];
console.log(pluck("foo"));
console.log(pluck("idx"));


