import 'package:flutter/material.dart';
import 'package:hotel_booking_app/utility/app_const.dart';
import 'package:hotel_booking_app/widgets/facility_widget.dart';

class MostRelavantWidget extends StatelessWidget {
  final String title;
  final num rating;
  final String mainImage;
  final List<dynamic> amenities;
  const MostRelavantWidget({
    super.key,
    required this.title,
    required this.rating,
    required this.mainImage,
    required this.amenities,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 340,
        height: 340,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConst.radius),
            color: Color.fromARGB(255, 230, 228, 228)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(AppConst.radius),
                    child: Image.network(mainImage, width: 350,height: 200,fit: BoxFit.cover,)),
                Positioned(
                    top: 10,
                    right: 20,
                    child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppConst.radius),
                            color: Color.fromARGB(129, 158, 158, 158)),
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        )))
              ],
            ),
            Padding(padding: EdgeInsetsDirectional.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title),
                Row(
                  children: [Icon(Icons.star),Text("$rating")],
                )
              ],
            ),
            ),
            Padding(
              
              padding: const EdgeInsets.symmetric(horizontal: 10),
              
              child: SizedBox(
                
                width: 350,
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  
                  itemCount: amenities.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FacilityWidgets(
                      
                      facility:amenities[index],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
