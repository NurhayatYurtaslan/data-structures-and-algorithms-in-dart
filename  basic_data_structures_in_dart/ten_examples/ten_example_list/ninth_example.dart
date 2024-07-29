void main() {
  // List of transactions
  List<Transaction> transactions = [
    Transaction(1500.00, 'Salary'),
    Transaction(-100.00, 'Groceries'),
    Transaction(-50.00, 'Transportation'),
    Transaction(200.00, 'Freelance'),
    Transaction(-500.00, 'Rent'),
    Transaction(-20.00, 'Entertainment'),
    Transaction(300.00, 'Investments'),
  ];

  // Calculate total income and expenses
  double totalIncome = calculateTotalIncome(transactions);
  double totalExpenses = calculateTotalExpenses(transactions);

  // Group transactions by category
  Map<String, List<Transaction>> groupedTransactions = groupTransactionsByCategory(transactions);

  // Print total income and expenses
  print('Total Income: \$${totalIncome}');
  print('Total Expenses: \$${totalExpenses}');

  // Print grouped transactions
  print('Transactions by Category:');
  for (var category in groupedTransactions.keys) {
    print('- $category:');
    for (var transaction in groupedTransactions[category]!) {
      print('  - Amount: \$${transaction.amount}');
    }
  }
}

// Transaction class to hold transaction details
class Transaction {
  double amount;
  String category;

  Transaction(this.amount, this.category);
}

// Method to calculate total income
double calculateTotalIncome(List<Transaction> transactions) {
  return transactions.where((transaction) => transaction.amount > 0).fold(0.0, (sum, transaction) => sum + transaction.amount);
}

// Method to calculate total expenses
double calculateTotalExpenses(List<Transaction> transactions) {
  return transactions.where((transaction) => transaction.amount < 0).fold(0.0, (sum, transaction) => sum + transaction.amount.abs());
}

// Method to group transactions by category
Map<String, List<Transaction>> groupTransactionsByCategory(List<Transaction> transactions) {
  Map<String, List<Transaction>> grouped = {};

  for (var transaction in transactions) {
    if (!grouped.containsKey(transaction.category)) {
      grouped[transaction.category] = [];
    }
    grouped[transaction.category]!.add(transaction);
  }

  return grouped;
}
