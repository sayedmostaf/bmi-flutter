import 'package:bmi/data/models/person.dart';
import 'package:bmi/main.dart';
import 'package:bmi/view/pages/records/widgets/record_detail_dialog.dart';
import 'package:bmi/view/pages/records/widgets/record_stream_builder.dart';
import 'package:bmi/view/pages/records/widgets/records_app_bar.dart';
import 'package:flutter/material.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  showRecordDetails(Person record) {
    showDialog(
      context: context,
      builder: (context) => RecordDetailsDialog(record: record),
    );
  }

  @override
  Widget build(BuildContext context) {
    var streamPerson = localStorage.getRecords();
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const RecordsAppBar(),
          ];
        },
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: RecordStreamBuilder(streamPerson: streamPerson),
          ),
        ),
      ),
    );
  }
}
