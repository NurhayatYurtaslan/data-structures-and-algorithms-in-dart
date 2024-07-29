void main() {
  // List of email addresses with duplicates
  List<String> emailAddresses = [
    'alice@example.com',
    'bob@example.com',
    'charlie@example.com',
    'alice@example.com',
    'david@example.com',
  ];

  // Create a set to store unique email addresses
  Set<String> uniqueEmails = Set.from(emailAddresses);

  // Print unique email addresses
  print('Unique Email Addresses:');
  for (var email in uniqueEmails) {
    print('- $email');
  }
}
