import 'package:bltCinemas/ui/dumb_widgets/flat_busy_button.dart';
import 'package:bltCinemas/ui/dumb_widgets/input_field.dart';
import 'package:bltCinemas/ui/views/email_login/email_login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class EmailLoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EmailLoginViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("LOGIN"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Login",
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Sign in using an existing account",
                        style: Theme.of(context).textTheme.caption),
                    SizedBox(
                      height: 50,
                    ),
                    Form(
                      key: model.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InputField(
                            controller: model.emailController,
                            inputType: TextInputType.emailAddress,
                            label: "Email",
                            validator: model.validateEmail,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InputField(
                            controller: model.passwordController,
                            inputType: TextInputType.emailAddress,
                            label: "Password",
                            isPassword: true,
                            validator: model.validatePassword,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FlatBusyButton(
                      isBusy: model.isBusy,
                      onpressed: model.login,
                      buttonLabel: "LOGIN",
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        model.navigateToSignUp();
                      },
                      child: Text(
                        "Don't have an account? Let's create one",
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Hero(
                        tag: "tbl-logo",
                        child: Image(
                          image: AssetImage('assets/images/tbl.png'),
                          width: 100,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => EmailLoginViewModel(),
    );
  }
}
