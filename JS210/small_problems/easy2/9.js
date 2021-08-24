const CAP_START = 'A'.charCodeAt(); //65
const CAP_END = 'Z'.charCodeAt(); //90
const LOW_START = 'a'.charCodeAt(); //97
const LOW_END = 'z'.charCodeAt(); //122

function isLetter(char){
  num = char.charCodeAt();
  return (num >= CAP_START && num <= CAP_END) || (num >= LOW_START && num <= LOW_END);
}

function cleanUp(str) {
  let result = '';
  let space = ''
  
  for (i=0; i < str.length; i += 1) {
    if (isLetter(str[i])) {
      result += space + str[i];
      space = '';
    } else {
      if (space === '') space = ' ';
    }
  }

  return result + space;
}

console.log(cleanUp("---what's my +*& line?"));    // " what s my line "