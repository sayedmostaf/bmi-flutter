import 'package:bmi/view/pages/home/widgets/home_view_app_bar.dart';
import 'package:bmi/view/pages/home/widgets/home_view_action_button.dart';
import 'package:bmi/view/pages/home/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerIsScrolled) {
          return <Widget>[
            const CustomAppBar(),
          ];
        },
        body: const SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HomeViewBody(),
              SizedBox(
                height: 20,
              ),
              HomeViewActionButton(),
            ],
          ),
        ),
      ),
    );
  }
}
