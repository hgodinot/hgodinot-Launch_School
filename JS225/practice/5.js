function makeList() {
  let items = [];

  return {
    add(item) {
      items.push(item);
      console.log(item + ' added!');
    },

    remove(item) {
      items.splice(items.indexOf(item), 1);
      console.log(item + ' removed!');
    },

    list() {
      items.forEach(item => console.log(item));
      if (items.length === 0) console.log('The list is empty.');
    },
  }
}

let list = makeList();

list.add('peas');
//peas added!

list.list();
//peas

list.add('corn');
//corn added!

list.list();
//peas
//corn

list.remove('peas');
//peas removed!

list.list();
//corn