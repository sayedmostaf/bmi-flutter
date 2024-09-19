import 'package:bmi/providers/person_provider.dart';
import 'package:bmi/utils/navigation_helper.dart';
import 'package:bmi/view/pages/height/widgets/height_view_app_bar.dart';
import 'package:bmi/view/pages/height/widgets/height_view_ruler_indicator.dart';
import 'package:bmi/view/pages/result/result_page.dart';
import 'package:bmi/view/widgets/curved_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeightPage extends StatefulWidget {
  const HeightPage({super.key});

  @override
  State<HeightPage> createState() => _HeightPageState();
}

int maxValue = 200;

class _HeightPageState extends State<HeightPage> {
  late var heightController = PageController();

  int _currentCentimeter = 144;
  late double _selectedHeight = 160;

  @override
  void initState() {
    super.initState();

    heightController =
        PageController(viewportFraction: .05, initialPage: _currentCentimeter);

    heightController.addListener(() {
      setState(() {
        int position = heightController.page!.floor();

        if (position != _currentCentimeter) {
          _currentCentimeter = position;
          _selectedHeight =
              ((_currentCentimeter.toInt() * 2.935) * maxValue) / 529.2;

          //set height

          trackAndSetHeight(context);
        }
      });
    });
  }

  void trackAndSetHeight(BuildContext context) {
    Provider.of<PersonProvider>(context, listen: false)
        .setPersonHeight(_selectedHeight.round());
  }

  @override
  void dispose() {
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const HeightViewAppBar(title: 'Height'),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Spacer(),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const RulerIndicator(),
                          LimitedBox(
                            maxHeight: size.height * .65,
                            child: Image.asset(
                              Provider.of<PersonProvider>(context)
                                      .isMaleSelected
                                  ? "assets/images/man_standing.png"
                                  : "assets/images/girl_standing.png",
                              height: _currentCentimeter * 2.94,
                              fit: BoxFit.fitHeight,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                        width: 80,
                        height: size.height * .65,
                        child: PageView.builder(
                            scrollDirection: Axis.vertical,
                            reverse: true,
                            padEnds: false,
                            itemBuilder: (context, index) {
                              int current = index + 1;
                              bool selectedCentimeter =
                                  _selectedHeight.round() == current;
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "$current",
                                    style: TextStyle(
                                        color: selectedCentimeter
                                            ? Colors.yellow
                                            : current % 5 == 0
                                                ? Colors.white
                                                : Colors.white.withOpacity(.5),
                                        fontWeight: current % 5 == 0
                                            ? FontWeight.bold
                                            : null),
                                  ),
                                  Container(
                                    color: current % 5 == 0
                                        ? Colors.white
                                        : Colors.white.withOpacity(.5),
                                    height: 2,
                                    width: current % 5 == 0 ? 15 : 10,
                                  )
                                ],
                              );
                            },
                            controller: heightController,
                            itemCount: maxValue))
                  ],
                ),
                CurvedButton(
                  onPressed: () {
                    Provider.of<PersonProvider>(context, listen: false)
                        .getPersonBodyMassIndex();
                    navigateToPageAndRemoveUntil(
                      context,
                      const ResultPage(),
                      false,
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }
}
