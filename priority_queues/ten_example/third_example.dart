class Patient {
  String name;
  int severity;

  Patient(this.name, this.severity);

  @override
  String toString() {
    return '$name (Severity: $severity)';
  }
}

class EmergencyRoom {
  List<Patient> patients = [];

  void admitPatient(Patient patient) {
    patients.add(patient);
    patients.sort((a, b) => b.severity.compareTo(a.severity));  // Ciddiyet derecesine göre sıralama
  }

  Patient? treatNextPatient() {
    return patients.isNotEmpty ? patients.removeAt(0) : null;
  }
}

void main() {
  EmergencyRoom er = EmergencyRoom();
  er.admitPatient(Patient('John', 5));
  er.admitPatient(Patient('Doe', 3));
  er.admitPatient(Patient('Alice', 7));

  while (er.patients.isNotEmpty) {
    Patient? patient = er.treatNextPatient();
    print('Treating: $patient');
  }
}
