class Customer {
  String name;
  int priority;

  Customer(this.name, this.priority);

  @override
  String toString() {
    return '$name (Priority: $priority)';
  }
}

class TicketSystem {
  List<Customer> queue = [];

  void addCustomer(Customer customer) {
    queue.add(customer);
    queue.sort((a, b) => b.priority.compareTo(a.priority)); // Öncelik sıralaması
  }

  Customer? serveNextCustomer() {
    return queue.isNotEmpty ? queue.removeAt(0) : null; // En yüksek öncelikli müşteri
  }
}

void main() {
  TicketSystem system = TicketSystem();
  system.addCustomer(Customer('Alice', 1));
  system.addCustomer(Customer('Bob', 3));
  system.addCustomer(Customer('Charlie', 2));

  while (system.queue.isNotEmpty) {
    Customer? customer = system.serveNextCustomer();
    print('Serving: $customer');
  }
}
