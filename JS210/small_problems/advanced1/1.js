const template1 = 'The ${adjective} brown ${noun} ${adverb} ' +
                  '${verb} the ${adjective} yellow ' +
                  '${noun}, who ${adverb} ${verb} his ' +
                  '${noun} and looks around.';

const template2 = "The ${noun} ${verb} the ${noun}'s ${noun}.";

function madlibs(template) {
  const REPLACEMENT_TEXTS = {
  adjective: ['quick', 'lazy', 'sleepy', 'noisy', 'hungry'],
  noun: ['fox', 'dog', 'head', 'leg', 'tail'],
  verb: ['jumps', 'lifts', 'bites', 'licks', 'pats'],
  adverb: ['easily', 'lazily', 'noisily', 'excitedly'],
  };

function replaceText(match) {
  const key = match.replace(/[^a-z]/g, '');
  const index = Math.floor(Math.random() * REPLACEMENT_TEXTS[key].length);
  return REPLACEMENT_TEXTS[key][index];
  }

  return template.replace(/\${[a-z]+}/g, replaceText);
}

console.log(madlibs(template1));
console.log(madlibs(template2));