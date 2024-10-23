class JobPost {
  String title;
  int applications;

  JobPost(this.title, this.applications);
}

class CustomPriorityQueue {
  List<JobPost> _queue = [];

  // Listeyi başvuru sayısına göre (yüksekten düşüğe) sıralıyoruz
  void add(JobPost jobPost) {
    _queue.add(jobPost);
    _queue.sort((a, b) => b.applications.compareTo(a.applications)); // Başvuru sayısına göre sırala
  }

  // İlk öğeyi çıkarma
  JobPost removeFirst() {
    if (_queue.isNotEmpty) {
      return _queue.removeAt(0); // En yüksek başvuruya sahip işi çıkar
    } else {
      throw Exception('Queue is empty');
    }
  }

  bool get isNotEmpty => _queue.isNotEmpty;
}

class JobManager {
  CustomPriorityQueue _jobQueue = CustomPriorityQueue(); // PriorityQueue yerine CustomPriorityQueue

  void addJob(String title, int applications) {
    _jobQueue.add(JobPost(title, applications));
  }

  void displayJobs() {
    print('Job Posts sorted by applications:');
    while (_jobQueue.isNotEmpty) {
      var job = _jobQueue.removeFirst();
      print('${job.title}: ${job.applications} applications');
    }
  }
}

void main() {
  var manager = JobManager();
  manager.addJob('Software Engineer', 20);
  manager.addJob('Product Manager', 15);
  manager.addJob('Data Scientist', 25);
  
  manager.displayJobs(); // Data Scientist, Software Engineer, Product Manager
}
