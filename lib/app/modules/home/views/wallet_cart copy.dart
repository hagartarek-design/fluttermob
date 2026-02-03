import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';

class WalletCard2 extends StatelessWidget {
   WalletCard2({super.key});

      final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
      final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    return GetBuilder<HomeController>(builder: (controller){return  Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width:328,
            height:172,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF3A5AFF), Color(0xFF6B8CFF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child:  Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "رصيدك",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "${controller.profileData?['balance']??"0"} جنية",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ID: 2341289",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "09/25",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
Positioned(
  top:isMobile?93: 100,left:isMobile?-141.61: -136.86,
  child:  Container(
              width:isMobile?334.25: 323.04,
              height:isMobile?211.26: 226,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),),SizedBox(width: 100,),
Positioned(
  top:isMobile?12.15: 4.04,left:isMobile?197: 4.06,
  child:SizedBox(
        width: 94.49,height: 96.92,child: Image.asset('assets/Group_3.png' ) ,) 
)
      ,
          Positioned(
            top:isMobile?-32.74: -142,
            left: isMobile?135.37: 130,
            child: Container(
              width: isMobile?334.25: 323,
              height:isMobile?211.26: 226,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
        ],
      ),
    );});
      }
}
