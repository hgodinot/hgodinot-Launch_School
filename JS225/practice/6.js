function makeBank() {
  function makeAccount(number) {
    let balance = 0;
    let transactions = [];

    return {
      deposit(amount) {
        transactions.push({type: "deposit", amount: amount});
        balance += amount;
        return amount;
      },

      withdraw(amount) {
        if (amount > balance) {
          amount = balance;
        }

        transactions.push({type: "withdraw", amount: amount});
        balance -= amount;
        return amount;
      },

      balance() {
        return balance;
      },

      number() {
        return number;
      },

      transactions() {
        return transactions;
      },
    };
  }

  return {
    accounts: [],
    openAccount() {
      let number = this.accounts.length + 101;
      let account = makeAccount(number);
      this.accounts.push(account);
      return account;
    },

    transfer(source, destination, amount) {
      return destination.deposit(source.withdraw(amount));
    },
  };
}

let bank = makeBank();
let account = bank.openAccount();

console.log(account.balance());

console.log(account.deposit(17));

let secondAccount = bank.openAccount();
console.log(secondAccount.number());

console.log(account.transactions());


