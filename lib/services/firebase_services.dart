import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/models/hotel.dart';
import 'package:hotel_booking_app/providers/hotel_provider.dart';
import 'package:provider/provider.dart';

class FirebaseServices{


 static getHotels(BuildContext context) async {
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('hotels');
    final hotelsDocs = await collectionReference.get();

    print("Hotel Data:: ${hotelsDocs.docs[0]["title"]}");

    List<Hotel> hotels = [];
    for (var hotel in hotelsDocs.docs) {
      hotels.add(
        Hotel(
          title: hotel["title"],
          rating: hotel["rating"],
          prices: hotel["prices"],
          mainImage: hotel["main_image"],
          otherImages: hotel["other_images"],
          amenities: hotel["amenities"],
        ));
    }
    context.read<HotelProvider>().addHotel(hotels: hotels);
  }
}