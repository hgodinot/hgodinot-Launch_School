(function() {
  var _ = function(element) {
    u = {
      last: function() {
        return element[element.length - 1];
      },

      first: function() {
        return element[0];
      },

      without: function(...val) {
        return element.filter( x => !val.includes(x));
      },

      lastIndexOf : function(num) {
        return(element.lastIndexOf(num));
      },

      sample : function sample(n = 1) {
        let copyArr = element.slice();
        let result = [];
      
        for (i = 0; i <n; i += 1) {
          index = Math.floor((Math.random() * copyArr.length));
          console.log(index + " : " + copyArr[index]);
          result = result.concat(copyArr.splice(index, 1));
        } 
      
        return result.length === 1 ? result[0] : result
      },

      findWhere: function(matchingObject) {
        let result;
        
        for (i = 0; i < element.length; i += 1) {
      
          if (Object.keys(matchingObject).every(key => {
            return element[i][key] === matchingObject[key];
          })) {
            result = element[i];
            i = element.length;
          }
        }
      
        return result;
      },

      where: function(matchingObject) {
        let result = [];
  
        for (i = 0; i < element.length; i += 1) {

          if (Object.keys(matchingObject).every(key => {
            return element[i][key] === matchingObject[key];
          })) {
            result.push(element[i]);
          }
        }

        return result;
      },

      pluck: function(matchingKey) {
        let result = [];
      
        for (i = 0; i < element.length; i += 1) {
          if (Object.keys(element[i]).some(key => {
            return key === matchingKey;
          })) {
            result.push(element[i][matchingKey]);
          }
        }
      
        return result;
      },

      keys: function() {
        return Object.keys(element);
      },

      values: function() {
        return Object.values(element);
      },

      pick: function(...properties) {
        let newObject = {};

        properties.forEach(key => {
          if (element[key]) newObject[key] = element[key];
        })

        return newObject;
      },

      omit: function(...properties) {
        let newObject = {};

        Object.keys(element).forEach(key => {
          if (!properties.includes(key)) newObject[key] = element[key];
        })

        return newObject;
      },

      has: function(key) {
        return Object.keys(element).includes(key);
      }

    }

  return u;
  };

  _.range = function(...val) {
    let [min, max] = val.length === 2 ? [val[0], val[1]] : [0, val[0]];
    let length = max - min;

    return [...Array(length).keys()].map(x => x + min);
  }

  _.extend = function(...obj) {
    for (i = obj.length - 1; i >= 1; i -= 1) {
      Object.keys(obj[i]).forEach(key => {
        obj[0][key] = obj[i][key];
      })
    }
  
  return obj[0];
  }

  window._ = _;
})();
