(function() {
  var _ = function(element) {
    u = {
      first: () => element[0],

      last: () => element[element.length - 1],

      without: (...val) => element.filter(el => !val.includes(el)),

      lastIndexOf: function(val) {
        let index = - 1;

        for (i = element.length - 1; i >= 0; i -= 1) {
          if (element[i] === val) {
            index = i;
            break;
          }
        }
      
        return index;
      },

      sample: function(num = 1) { 
        let result = [];
        let copy = element.slice();
      
        for (i = 1; i <= num; i += 1) {
          index = Math.floor(Math.random() * copy.length);
          result = result.concat(copy.splice(index, 1));
        }
      
        return num === 1 ? result[0] : result
      },

      findWhere: function(object) {
        for (i = 0; i < element.length; i += 1) {
          if (Object.keys(object).every(key => object[key] === element[i][key])) {
            return element[i];
          }
        }
      },

      where: function(object) {
        let result = [];

        element.forEach(obj => {
          if (Object.keys(object).every(key => object[key] === obj[key])) {
            result.push(obj);
          }
        })

        return result;
      },

      pluck: (key) => element.map(val => val[key]),

      keys: () => Object.keys(element),

      values: () => Object.values(element),

      pick: function(...prop) {
        let newObj = {};

        Object.keys(element).forEach(key => {
          if (prop.includes(key)) newObj[key] = element[key];
        })

        return newObj;
      },

      omit: function(...prop) {
        let newObj = {};

        Object.keys(element).forEach(key => {
          if (!prop.includes(key)) newObj[key] = element[key];
        })

        return newObj;
      },

      has: (key) => Object.keys(element).includes(key),
      

    }

  return u;
  };

  _.range = function(...val) {
    [arg1, arg2] = val.length === 1 ? [0, val[0]] : [val[0], val[1]];
    [start, end] = [Math.min(arg1, arg2), Math.max(arg1, arg2)];
    let size = end - start;

    return [...Array(size).keys()].map(num => num + start);
  }

  _.extend = function(oldObj, ...newObj) {
    newObj.reverse().forEach(obj => {
      for (let key in obj) oldObj[key] = obj[key];
    })
    return oldObj;
  }

  window._ = _;
})();
