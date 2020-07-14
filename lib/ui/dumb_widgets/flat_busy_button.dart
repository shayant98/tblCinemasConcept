import 'package:flutter/material.dart';

class FlatBusyButton extends StatelessWidget {
  final bool isBusy;
  final String buttonLabel;
  final Function onpressed;

  const FlatBusyButton(
      {@required this.isBusy, this.buttonLabel, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        color: Colors.orange[600],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          onpressed();
        },
        child: isBusy
            ? SizedBox(
                height: 23,
                width: 23,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                buttonLabel ?? "",
                style: Theme.of(context).textTheme.button,
              ));
  }
}
