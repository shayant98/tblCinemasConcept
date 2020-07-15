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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage('assets/images/movie_image.png'),
                  width: 350,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porttitor felis justo. ",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 50,
                ),
                ActionButton(
                  title: "Login with email",
                  icon: FontAwesomeIcons.envelope,
                  onpressed: model.navigateToEmailLogin,
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
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: FlatButton(
                        onPressed: () {
                          model.navigateToEmailRegister();
                        },
                        child: Text(
                          "Or create an account",
                          style: Theme.of(context).textTheme.caption,
                        ))),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Hero(
                    tag: "tbl-logo",
                    child: Image(
                      image: AssetImage('assets/images/tbl.png'),
                      width: 100,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
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
