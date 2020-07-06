import 'package:flutter/material.dart';

class TimeSlot extends StatelessWidget {
  final String startTime;
  final String endTime;
  final String type;

  const TimeSlot({this.startTime, this.type, this.endTime});

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: () {},
        splashColor: Colors.orange[600],
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xFF262626).withOpacity(0.7),
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  text: "$startTime - ",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: endTime,
                        style: Theme.of(context).textTheme.caption),
                  ],
                ),
              ),
              Container(
                child: Text(
                  type ?? '2D',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
