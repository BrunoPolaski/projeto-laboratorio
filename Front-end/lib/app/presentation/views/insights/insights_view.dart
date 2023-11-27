import 'package:app_facul/app/presentation/layout/custom_layout.dart';
import 'package:app_facul/app/presentation/themes/colors.dart';
import 'package:app_facul/app/presentation/themes/typography.dart';
import 'package:app_facul/app/presentation/views/home/home_page_view.dart';
import 'package:flutter/material.dart';

class InsightsView extends StatelessWidget {
  const InsightsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      horizontalPadding: 0,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: AppColors.purple,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: AppColors.purple,
                ),
                child: Text('Menu', style: AppTypography.textBodyWhite),
              ),
              ListTile(
                title: const Text('Home', style: AppTypography.textBodyPurple,),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage()));
                },
              ),
              ListTile(
                title: const Text('Insights', style: AppTypography.textBodyPurple,),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const InsightsView()));
                },
              ),
            ],
          ),
        ),
      ));
  }
}