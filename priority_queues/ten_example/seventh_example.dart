import 'dart:collection';

class JobPost {
  String title;
  int applications;

  JobPost(this.title, this.applications);
}

class JobManager {
  PriorityQueue<JobPost> _jobQueue;

  JobManager() {
    _jobQueue = PriorityQueue<JobPost>((a, b) => b.applications.compareTo(a.applications));
  }

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
