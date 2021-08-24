function copyProperties(model, copy) {
  let copyCount = 0;

  for (let propertyName in model) {
    copy[propertyName] = model[propertyName];
    copyCount++;
  }

  return copyCount;
}

let hal = {
  model: 9000,
  enabled: true,
};

let sal = {};
console.log(copyProperties(hal, sal));  // 2
console.log(sal);                       // { model: 9000, enabled: true }