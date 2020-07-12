import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final Function onpressed;
  final String title;
  final Icon icon;

  const ActionButton({this.onpressed, this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () {
          onpressed();
        },
        splashColor: Colors.orange,
        borderRadius: BorderRadius.circular(40),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xFF262626),
              borderRadius: BorderRadius.circular(40)),
          padding: EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              icon,
            ],
          ),
        ),
      ),
    );
  }
}
