import 'dart:async';

class VanillaBloc {
  int counter = 0;

  StreamController<int> counterController = StreamController<int>();

  StreamSink<int> get inCounter => counterController.sink;
  Stream<int> get outCounter => counterController.stream;

  void incrementCounter() {
    counter++;
    inCounter.add(counter);
  }

  void decrementCounter() {
    counter--;
    inCounter.add(counter);
  }
}
