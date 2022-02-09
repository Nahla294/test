import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/models/test_data_list.dart';
import 'package:graduation_project/shared/components/componenets.dart';

// ignore: must_be_immutable
class ReportScreen extends StatelessWidget {
  // ignore: deprecated_member_use
  List ans = List(38);
  ReportScreen(this.ans, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConditionalBuilder(
        condition: true,
        builder: (context) => ListView.separated(
          itemCount: questions.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: buildReport(
              questions[index].image,
              'Your answer : ' + ans[index],
              'Normal view : ' +
                  questions[index].answer.keys.firstWhere(
                      (k) => questions[index].answer[k].toString() == 'true',
                      orElse: () => null),
              'Color blindness : ' + questions[index].colorBlind,
            ),
          ),
          separatorBuilder: (context, index) => DividerReport(),
        ),
        fallback: (context) => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
