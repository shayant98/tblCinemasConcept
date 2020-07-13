import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ActionButton extends StatelessWidget {
  final Function onpressed;
  final String title;
  final IconData icon;

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
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    icon,
                    color: Colors.orange[600],
                    size: 18,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Icon(FontAwesomeIcons.caretRight)
            ],
          ),
        ),
      ),
    );
  }
}
