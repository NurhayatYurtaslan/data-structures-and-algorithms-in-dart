import 'dart:collection';

class WeatherAlert {
  String message;
  int severity; // 1: düşük, 5: yüksek

  WeatherAlert(this.message, this.severity);
}

class WeatherAlertSystem {
  PriorityQueue<WeatherAlert> _alertQueue;

  WeatherAlertSystem() {
    _alertQueue = PriorityQueue<WeatherAlert>((a, b) => b.severity.compareTo(a.severity));
  }

  void addAlert(String message, int severity) {
    _alertQueue.add(WeatherAlert(message, severity));
  }

  void processAlerts() {
    while (_alertQueue.isNotEmpty) {
      var alert = _alertQueue.removeFirst();
      print('Processing alert: ${alert.message} (Severity: ${alert.severity})');
    }
  }
}

void main() {
  var system = WeatherAlertSystem();
  system.addAlert('Flood Warning', 5);
  system.addAlert('Wind Advisory', 2);
  system.addAlert('Heat Advisory', 3);
  
  system.processAlerts(); // Flood Warning, Heat Advisory, Wind Advisory
}
