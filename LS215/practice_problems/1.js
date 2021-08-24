let totalArea = (arr) => arr.map (x => x[0] * x[1])
                            .reduce((acc, el) => acc + el);


let totalSquareArea = (arr) => arr.filter (x => x[0] === x[1])
                                  .map (x => x[0] * x[1])
                                  .reduce((acc, el) => acc + el);


let rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

console.log(totalArea(rectangles));    // 141
console.log(totalSquareArea(rectangles));    // 121