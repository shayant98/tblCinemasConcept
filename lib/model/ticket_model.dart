import 'package:cloud_firestore/cloud_firestore.dart';

class Ticket {
  final String id;
  final String title;
  final List<String> categories;
  final int adults;
  final int kids;
  final String date;
  final String time;
  final bool redeemed;
  final Timestamp redeeemDate;
  final String code;
  final int screen;

  Ticket(
      {this.adults,
      this.kids,
      this.date,
      this.time,
      this.redeemed,
      this.redeeemDate,
      this.code,
      this.screen,
      this.title,
      this.categories,
      this.id});

  factory Ticket.fromMap(DocumentSnapshot snapshot) => Ticket(
        id: snapshot.documentID,
        kids: snapshot.data['kids'],
        adults: snapshot.data['adults'],
        date: snapshot.data['date'],
        time: snapshot.data['time'],
        redeemed: snapshot.data['redeemed'],
        redeeemDate: snapshot.data['redeem_date'],
        code: snapshot.data['code'],
        screen: snapshot.data['screen'],
        title: snapshot.data['title'],
        categories: snapshot.data['categories'].cast<String>(),
      );

  Map<String, dynamic> toJson() => {};
}
