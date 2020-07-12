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
        appBar: AppBar(
          elevation: 0,
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.orange,
              child: CircleAvatar(
                radius: 65,
                backgroundImage: CachedNetworkImageProvider(
                    'https://images.pexels.com/photos/3214734/pexels-photo-3214734.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Shayant Sital",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Shayant98@gmail.com",
              style: Theme.of(context)
                  .textTheme
                  .caption
                  .copyWith(fontWeight: FontWeight.bold),
            ),
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
                    builder: (_) => CreditOptions());
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
              height: 50,
            ),
            ActionButton(
              title: "Edit profile",
              icon:
                  Icon(FontAwesomeIcons.caretRight, color: Colors.orange[600]),
            ),
            SizedBox(
              height: 20,
            ),
            ActionButton(
              title: "Logout",
              icon:
                  Icon(FontAwesomeIcons.caretRight, color: Colors.orange[600]),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => ProfileViewModel(),
    );
  }
}

class CreditOptions extends StatelessWidget {
  const CreditOptions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: Icon(
            FontAwesomeIcons.qrcode,
            size: 18,
          ),
          title: Text("Scan QR code"),
        ),
        ListTile(
          leading: Icon(
            FontAwesomeIcons.pen,
            size: 18,
          ),
          title: Text("Write code"),
        )
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  final Function onpressed;
  final String title;
  final Icon icon;

  const ActionButton({Key key, this.onpressed, this.title, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () {},
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
