import 'package:barcode_scan/barcode_scan.dart';
import 'package:bltCinemas/ui/dumb_widgets/action_button.dart';
import 'package:bltCinemas/ui/views/profile/profle_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            elevation: 0,
            title: Text("PROFILE"),
          ),
          body: (model.dataReady)
              ? Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.orange,
                      child: CircleAvatar(
                        radius: 65,
                        backgroundImage:
                            CachedNetworkImageProvider(model.data.photoUrl),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      model.data.displayName,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(model.data.email,
                        style: Theme.of(context).textTheme.caption),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 2,
                      width: 50,
                      color: Colors.grey[800],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (_) => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(
                                  FontAwesomeIcons.qrcode,
                                  size: 18,
                                ),
                                title: Text("Scan QR code"),
                                onTap: () {
                                  model.initScan();
                                },
                              ),
                              ListTile(
                                leading: Icon(
                                  FontAwesomeIcons.creditCard,
                                  size: 18,
                                ),
                                title: Text("Add Credit via code"),
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0)),
                                          child: Container(
                                            padding: EdgeInsets.all(20),
                                            height: 200,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Add credit",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                TextField(
                                                  controller: model
                                                      .codeInputEditingController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  autofocus: true,
                                                  decoration: InputDecoration(
                                                    labelText: "Code",
                                                    hintText: "000-000-0000",
                                                    fillColor: Colors.white,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      borderSide: BorderSide(),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    FlatButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "CANCEL",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .button,
                                                      ),
                                                    ),
                                                    FlatButton(
                                                      color: Colors.orange[600],
                                                      onPressed: () {
                                                        model.addCreditByCode();
                                                      },
                                                      child: Text(
                                                        "ADD",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .button,
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                              )
                            ],
                          ),
                        );
                      },
                      color: Colors.orange[600],
                      child: Text(
                        "ADD CREDITS",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Credits: \$${model.data.credits ?? '0.00'}",
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ActionButton(
                      title: "Edit profile",
                      icon: FontAwesomeIcons.userEdit,
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // ActionButton(
                    //     title: "Logout",
                    //     onpressed: model.logout,
                    //     icon: FontAwesomeIcons.signOutAlt),
                    SizedBox(
                      height: 20,
                    ),
                    ActionButton(
                      title: "Settings",
                      onpressed: model.logout,
                      icon: FontAwesomeIcons.cog,
                    ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
      viewModelBuilder: () => ProfileViewModel(),
    );
  }
}
