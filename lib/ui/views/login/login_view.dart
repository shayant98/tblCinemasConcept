import 'package:bltCinemas/ui/dumb_widgets/action_button.dart';
import 'package:bltCinemas/ui/views/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("LOGIN"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: <Widget>[
              Image(image: AssetImage('assets/images/movie_image.png')),
              SizedBox(
                height: 20,
              ),
              Text(
                "Login to buy tickets, save movies for later",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 50,
              ),
              ActionButton(
                title: "Login with email",
                icon: FontAwesomeIcons.envelope,
              ),
              SizedBox(
                height: 20,
              ),
              Center(child: Text("Or sign in with")),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularButton(
                    icon: Icon(
                      FontAwesomeIcons.google,
                    ),
                    onPressed: model.googleLogIn,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircularButton(
                    icon: Icon(FontAwesomeIcons.facebookF),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Or create an account",
                        style: Theme.of(context).textTheme.caption,
                      ))),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
      onModelReady: (model) => model.init(),
    );
  }
}

class CircularButton extends StatelessWidget {
  final Icon icon;
  final Function onPressed;

  const CircularButton({Key key, this.icon, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFF262626), borderRadius: BorderRadius.circular(40)),
      child: IconButton(
        icon: icon,
        color: Colors.orange[600],
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}
