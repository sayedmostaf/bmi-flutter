import 'package:bmi/data/local/objectbox.g.dart';
import 'package:bmi/data/models/person.dart';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;

class ObjectBox {
  late final Store store;
  late final Box<Person> records;

  ObjectBox._create(this.store) {
    records = Box<Person>(store);
  }

  static Future<ObjectBox> create() async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    final storageDirectory = p.join(documentDirectory.path, "local-storage");
    final store = await openStore(directory: storageDirectory);
    return ObjectBox._create(store);
  }

  Stream<List<Person>> getRecords() {
    final queryBuilder = records.query()..order(Person_.dataCreated);
    return queryBuilder
        .watch(triggerImmediately: true)
        .map((query) => query.find());
  }

  void savedRecord(Person person) {
    records.put(person);
  }

  void removeRecord(int recordId) {
    records.remove(recordId);
  }
}
