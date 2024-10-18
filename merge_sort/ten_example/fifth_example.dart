class MyDate {
  int day;
  int month;
  int year;

  MyDate(this.day, this.month, this.year);

  int compareTo(MyDate other) {
    if (year != other.year) {
      return year.compareTo(other.year);
    } else if (month != other.month) {
      return month.compareTo(other.month);
    } else {
      return day.compareTo(other.day);
    }
  }

  @override
  String toString() {
    return '$day/$month/$year';
  }
}

void merge(List<MyDate> arr, int left, int mid, int right) {
  int n1 = mid - left + 1;
  int n2 = right - mid;

  List<MyDate> leftArray = List.filled(n1, MyDate(0, 0, 0));
  List<MyDate> rightArray = List.filled(n2, MyDate(0, 0, 0));

  for (int i = 0; i < n1; i++) {
    leftArray[i] = arr[left + i];
  }
  for (int j = 0; j < n2; j++) {
    rightArray[j] = arr[mid + 1 + j];
  }

  int i = 0, j = 0, k = left;

  while (i < n1 && j < n2) {
    if (leftArray[i].compareTo(rightArray[j]) <= 0) {
      arr[k] = leftArray[i];
      i++;
    } else {
      arr[k] = rightArray[j];
      j++;
    }
    k++;
  }

  while (i < n1) {
    arr[k] = leftArray[i];
    i++;
    k++;
  }

  while (j < n2) {
    arr[k] = rightArray[j];
    j++;
    k++;
  }
}

void mergeSort(List<MyDate> arr, int left, int right) {
  if (left < right) {
    int mid = left + (right - left) ~/ 2;

    mergeSort(arr, left, mid);
    mergeSort(arr, mid + 1, right);

    merge(arr, left, mid, right);
  }
}

void main() {
  List<MyDate> dates = [
    MyDate(15, 6, 2020),
    MyDate(23, 11, 2019),
    MyDate(5, 1, 2021),
    MyDate(17, 8, 2020)
  ];

  print("Original dates:");
  dates.forEach((date) => print(date));

  mergeSort(dates, 0, dates.length - 1);

  print("\nSorted dates:");
  dates.forEach((date) => print(date));
}
