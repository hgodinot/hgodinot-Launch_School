function objectsEqual(a, b) {
  if (Object.keys(a).length !== Object.keys(b).length) return false;

  for (i = 0; i < Object.keys(a).length; i += 1) {
    if (Object.keys(a)[i] !== Object.keys(b)[i] ||
        a[Object.keys(a)[i]] !== b[Object.keys(b)[i]]) return false;
  }

  return true;
}



console.log(objectsEqual({a: 'foo'}, {a: 'foo'}));                      // true
console.log(objectsEqual({a: 'foo', b: 'bar'}, {a: 'foo'}));            // false
console.log(objectsEqual({}, {}));                                      // true
console.log(objectsEqual({a: 'foo', b: undefined}, {a: 'foo', c: 1}));  // false