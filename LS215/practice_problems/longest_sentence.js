let longText = 'Four score and seven years ago our fathers brought forth' +
  ' on this continent a new nation, conceived in liberty, and' +
  ' dedicated to the proposition that all men are created' +
  ' equal.' +
  ' Now we are engaged in a great civil war, testing whether' +
  ' that nation, or any nation so conceived and so dedicated,' +
  ' can long endure. We are met on a great battlefield of that' +
  ' war. We have come to dedicate a portion of that field, as' +
  ' a final resting place for those who here gave their lives' +
  ' that that nation might live. It is altogether fitting and' +
  ' proper that we should do this.' +
  ' But, in a larger sense, we can not dedicate, we can not' +
  ' consecrate, we can not hallow this ground. The brave' +
  ' men, living and dead, who struggled here, have' +
  ' consecrated it, far above our poor power to add or' +
  ' detract. The world will little note, nor long remember' +
  ' what we say here, but it can never forget what they' +
  ' did here. It is for us the living, rather, to be dedicated' +
  ' here to the unfinished work which they who fought' +
  ' here have thus far so nobly advanced. It is rather for' +
  ' us to be here dedicated to the great task remaining' +
  ' before us -- that from these honored dead we take' +
  ' increased devotion to that cause for which they gave' +
  ' the last full measure of devotion -- that we here highly' +
  ' resolve that these dead shall not have died in vain' +
  ' -- that this nation, under God, shall have a new birth' +
  ' of freedom -- and that government of the people, by' +
  ' the people, for the people, shall not perish from the' +
  ' earth.';

let severalPointsOne = 'Point. Exclamation point! An interrogation point?';

let severalPointsTwo = 'Interrogation? A point. An exclamation point!'

let severalPointsThree = 'Exclamation! An interrogation? A simple point.'




let cleanStrings = (str, idx) => idx ? str.slice(1) : str;

function splitAndKeep(array, point) {
  const POINTS = /[\.\?!]/;


  array = array.map(text => {
    return text.split(point)
               .map(str => str.slice(-1).match(POINTS) ? str : str + point);
  })

  return array.flat();
}

function longestSentence(text) {
  let sentences = splitAndKeep([text], '.');
  sentences = splitAndKeep(sentences, '!');
  sentences = splitAndKeep(sentences, '?');
  
  sentences = sentences.map(cleanStrings);

  let sentencesLength = sentences.map(str => str.split(' ').length);

  let maxLength = Math.max(...sentencesLength);
  let maxIndex = sentencesLength.indexOf(maxLength); 

  console.log('\n' + sentences[maxIndex]);
  console.log('\nThe longest sentence has ' + maxLength + ' words.');
}



longestSentence(longText);
longestSentence(severalPointsOne);
longestSentence(severalPointsTwo);
longestSentence(severalPointsThree);


/* Easy version just adding a point at the end

let cleanStrings = (str, idx) => idx ? str.slice(1) : str;

function longestSentence(text) {
  let sentences = text.split(/[\.\?!]/).map(cleanStrings);

  let sentencesLength = sentences.map(str => str.split(' ').length);

  let maxLength = Math.max(...sentencesLength);
  let maxIndex = sentencesLength.indexOf(maxLength); 

  console.log(sentences[maxIndex] + '.');
  console.log('\nThe longest sentence has ' + maxLength + ' words.');
}


Or a very efficient and short Regex, better:

function longestSentence(text) {
  let sentences = text.match(/\w[^!?\.]*(!|\?|\.)/g);

  sentences.sort((a, b) => b.split(" ").length - a.split(" ").length);

  console.log(`${sentences[0]}\n\nThe longest sentence has ${sentences[0].split(" ").length} words.`);
}

*/



