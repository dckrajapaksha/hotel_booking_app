import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hotel_booking_app/providers/hotel_provider.dart';
import 'package:hotel_booking_app/utility/app_colors.dart';
import 'package:hotel_booking_app/utility/app_const.dart';

import 'package:hotel_booking_app/widgets/most_relavant_widget.dart';
import 'package:provider/provider.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(AppConst.radius),
                        bottomRight: Radius.circular(AppConst.radius)),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1445019980597-93fa8acb246c?q=80&w=1474&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.5), BlendMode.darken))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Norway", style: TextStyle(color: Colors.white)),
                        InkWell(
                          onTap: () {
                            FirebaseAuth.instance.signOut();
                          },
                            child: Icon(
                          Icons.logout_outlined,
                          color: Colors.white,
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Hey, Martin Tell us where you want to go",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ],
                ),
              )
            ],
          ),
          Text("The Most Relevant"),
          SizedBox(
            height: AppConst.mostRelavantCardHeight,
            child:

                // Center(
                //   child: CircularProgressIndicator(),
                // ):

                Consumer<HotelProvider>(
              builder: (context, hotelProvider, child) {
                return hotelProvider.allHotelData.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: hotelProvider.allHotelData.length,
                        itemBuilder: (context, index) {
                          return MostRelavantWidget(
                            title: hotelProvider.allHotelData[index].title!,
                            rating: hotelProvider.allHotelData[index].rating!,
                            mainImage:
                                hotelProvider.allHotelData[index].mainImage!,
                            amenities:
                                hotelProvider.allHotelData[index].amenities!,
                          );
                        });
              },
            ),
          ),
        ],
      ),
    );
  }
}
