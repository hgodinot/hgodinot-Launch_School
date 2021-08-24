readSync = require('readline-sync');

noun = readSync.question('Enter a noun: ');
verb = readSync.question('Enter a verb: ');
adjective = readSync.question('Enter an adjective: ');
adverb = readSync.question('Enter an adverb: ');

console.log(`Do you ${verb} your ${adjective} ${noun} ${adverb}? That's hilarious!`);
