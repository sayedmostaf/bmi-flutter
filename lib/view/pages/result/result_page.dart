import 'package:bmi/providers/person_provider.dart';
import 'package:bmi/view/pages/result/widgets/bmi_display_container.dart';
import 'package:bmi/view/pages/result/widgets/body_composition_action_buttons.dart';
import 'package:bmi/view/pages/result/widgets/body_composition_row.dart';
import 'package:bmi/view/pages/result/widgets/body_composition_text.dart';
import 'package:bmi/view/pages/result/widgets/result_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider = Provider.of<PersonProvider>(context, listen: true);
    var person = provider.getPerson;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const ResultAppBar(),
          ];
        },
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                BMIDisplayContainer(person: person),
                SizedBox(height: size.height * .04),
                const BodyCompositionText(),
                SizedBox(height: size.height * .04),
                BodyCompositionRow(person: person),
                SizedBox(height: size.height * .04),
                ActionButtons(size: size, provider: provider, person: person),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
