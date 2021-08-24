let invoices = {
  unpaid: [],
  paid: [],

  add: function(name, amount) {this.unpaid.push({name, amount})},

  payInvoice: function(clientName) {
    let newUnpaid = [];
    this.unpaid.forEach(invoice => invoice.name === clientName ? this.paid.push(invoice) : newUnpaid.push(invoice));
    this.unpaid = newUnpaid;
  },

  totalDue: function() {return this.unpaid.reduce((acc, el) => acc + el.amount, 0)},

  totalPaid: function() {return this.paid.reduce((acc, el) => acc + el.amount, 0)},
};

invoices.add('Due North Development', 250);
invoices.add('Moonbeam Interactive', 187.50);
invoices.add('Slough Digital', 300);
console.log(invoices.totalDue());

invoices.payInvoice('Due North Development');
invoices.payInvoice('Slough Digital');
console.log(invoices.totalPaid());
console.log(invoices.totalDue());