import 'dart:collection';

class Patient {
  String name;
  int triageLevel; // 1: Acil, 5: Düşük öncelik

  Patient(this.name, this.triageLevel);
}

class EmergencyRoom {
  PriorityQueue<Patient> _patientQueue;

  EmergencyRoom() {
    _patientQueue = PriorityQueue<Patient>((a, b) => a.triageLevel.compareTo(b.triageLevel));
  }

  void addPatient(String name, int triageLevel) {
    _patientQueue.add(Patient(name, triageLevel));
  }

  void treatPatients() {
    while (_patientQueue.isNotEmpty) {
      var patient = _patientQueue.removeFirst();
      print('Treating patient: ${patient.name} with triage level ${patient.triageLevel}');
    }
  }
}

void main() {
  var er = EmergencyRoom();
  er.addPatient('John Doe', 2);
  er.addPatient('Jane Smith', 1);
  er.addPatient('Emily Davis', 3);
  
  er.treatPatients(); // Jane Smith, John Doe, Emily Davis
}
