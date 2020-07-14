import 'package:bltCinemas/ui/dumb_widgets/flat_busy_button.dart';
import 'package:bltCinemas/ui/dumb_widgets/input_field.dart';
import 'package:bltCinemas/ui/views/email_register/email_register_viewmodel.dart';
import 'package:bltCinemas/ui/views/startup/startup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class EmailRegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EmailRegisterViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("REGISTER"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Register",
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
                Text("Create an account...",
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
                          controller: model.firstNameController,
                          hint: "eg. Mahinder",
                          label: "First name",
                          validator: model.validateFirstName),
                      SizedBox(
                        height: 10,
                      ),
                      InputField(
                        controller: model.lastNametNameController,
                        hint: "eg. Jogi",
                        label: "Last name",
                        validator: model.validateLastName,
                      ),
                      SizedBox(
                        height: 10,
                      ),
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
                      SizedBox(
                        height: 10,
                      ),
                      InputField(
                        controller: model.confirmPasswordController,
                        inputType: TextInputType.emailAddress,
                        label: "Confirm password",
                        isPassword: true,
                        validator: model.validateConfirmPassword,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FlatBusyButton(
                  isBusy: model.isBusy,
                  onpressed: model.signUp,
                  buttonLabel: "REGISTER",
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    model.navigateToLogin();
                  },
                  child: Text(
                    "Already have an account? Let's sign in",
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
        ),
      ),
      viewModelBuilder: () => EmailRegisterViewModel(),
    );
  }
}
