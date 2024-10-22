class Packet {
  String source;
  String destination;
  int priority; // 1: yüksek öncelik, 5: düşük öncelik

  Packet(this.source, this.destination, this.priority);
}

class CustomPriorityQueue {
  List<Packet> _queue = [];

  // Paketi ekleyip ardından sıralama yapıyoruz
  void add(Packet packet) {
    _queue.add(packet);
    _queue.sort((a, b) => a.priority.compareTo(b.priority)); // Öncelik sırasına göre sırala
  }

  // İlk öğeyi alıp çıkarma
  Packet removeFirst() {
    if (_queue.isNotEmpty) {
      return _queue.removeAt(0); // En yüksek öncelikli öğeyi çıkar
    } else {
      throw Exception('Queue is empty');
    }
  }

  bool get isNotEmpty => _queue.isNotEmpty;
}

class TrafficManager {
  CustomPriorityQueue _packetQueue = CustomPriorityQueue(); // Başlatılıyor

  TrafficManager();

  void addPacket(String source, String destination, int priority) {
    _packetQueue.add(Packet(source, destination, priority));
  }

  void routePackets() {
    while (_packetQueue.isNotEmpty) {
      var packet = _packetQueue.removeFirst();
      print('Routing packet from ${packet.source} to ${packet.destination} with priority ${packet.priority}');
    }
  }
}


void main() {
  var trafficManager = TrafficManager();
  trafficManager.addPacket('Device A', 'Server 1', 3);
  trafficManager.addPacket('Device B', 'Server 2', 1);
  trafficManager.addPacket('Device C', 'Server 3', 2);
  
  trafficManager.routePackets(); // Device B to Server 2, Device C to Server 3, Device A to Server 1
}
