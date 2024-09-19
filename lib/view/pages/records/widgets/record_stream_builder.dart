import 'package:bmi/data/models/person.dart';
import 'package:bmi/view/pages/records/widgets/no_record_found.dart';
import 'package:bmi/view/pages/records/widgets/record_bmi_tile.dart';
import 'package:flutter/material.dart';

class RecordStreamBuilder extends StatelessWidget {
  final Stream<List<Person>> streamPerson;

  const RecordStreamBuilder({super.key, required this.streamPerson});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: streamPerson,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Something went wrong"),
          );
        }

        List<Person> records = snapshot.data as List<Person>;
        return records.isEmpty
            ? const NoRecordsFoundWidget()
            : ListView.builder(
                itemCount: records.length,
                itemBuilder: (context, index) {
                  return SavedBmiTile(
                    record: records[index],
                  );
                },
              );
      },
    );
  }
}
