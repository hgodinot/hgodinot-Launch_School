let bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];

function processBands(data) {
  data.forEach(band => {
    band.country = 'Canada';
    band.name = band.name.split(' ')
                         .map(wrd => wrd[0].toUpperCase() + wrd.slice(1))
                         .join(' ')
                         .split('')
                         .filter(chr => chr !== '.')
                         .join('');
  });

  return data;
}

console.log(processBands(bands));

/* should return:
[
  { name: 'Sunset Rubdown', country: 'Canada', active: false },
  { name: 'Women', country: 'Canada', active: false },
  { name: 'A Silver Mt Zion', country: 'Canada', active: true },
]
*/