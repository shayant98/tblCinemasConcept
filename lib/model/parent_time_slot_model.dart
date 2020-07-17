import 'package:cloud_firestore/cloud_firestore.dart';

class ParentTimeSlot {
  final String id;
  final String start;
  final String end;
  final int seats;
  final int screen;
  final String date;
  final double price;
  final double kidsPrice;

  ParentTimeSlot(
      {this.price,
      this.kidsPrice,
      this.id,
      this.screen,
      this.date,
      this.start,
      this.end,
      this.seats});

  factory ParentTimeSlot.fromMap(DocumentSnapshot snapshot) => ParentTimeSlot(
        id: snapshot.documentID,
        start: snapshot.data['start'],
        end: snapshot.data['end'],
        seats: snapshot.data['seats'],
        screen: snapshot.data['screen'],
        date: snapshot.data['date'],
        price: snapshot.data['price'].toDouble(),
        kidsPrice: snapshot.data['kids_price'] == null
            ? snapshot.data['price'].toDouble()
            : snapshot.data['kids_price'].toDouble(),
      );
}
