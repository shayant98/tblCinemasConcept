import 'package:bltCinemas/ui/views/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
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
            Ink(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color(0xFF262626)),
              child: InkWell(
                onTap: () {
                  model.navigateToProfile();
                },
                splashColor: Colors.orange,
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  padding: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.orange[600],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Log in with Facebook",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Or sign in with"),
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
                  icon: Icon(FontAwesomeIcons.envelope),
                ),
              ],
            ),
          ],
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
