import 'package:delivery/utils/colors.dart';
import 'package:delivery/utils/dimentions.dart';
import 'package:delivery/widgets/account_widget.dart';
import 'package:delivery/widgets/app_icon.dart';
import 'package:delivery/widgets/big_text.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: "Profile",
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top:Dimentions.height20),
        child: Column(
          children: [
            //profile icon
            AppIcon(
              icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: Dimentions.height45+Dimentions.height30,
              size: Dimentions.height15*10,
              ),
              SizedBox(height: Dimentions.height30,),
            
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                      //name
                  AccountWidget(
                    appIcon: AppIcon(
                  icon: Icons.person,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimentions.height10*5/2,
                  size: Dimentions.height10*5,
                  ), 
                    bigText: BigText(text: 'Jasmin')
                    ),
                    SizedBox(height: Dimentions.height30,),
                 //phone
                    AccountWidget(
                    appIcon: AppIcon(
                  icon: Icons.phone,
                  backgroundColor: AppColors.yellowColor,
                  iconColor: Colors.white,
                  iconSize: Dimentions.height10*5/2,
                  size: Dimentions.height10*5,
                  ), 
                    bigText: BigText(text: '98765xxxxx')
                    ),
                    SizedBox(height: Dimentions.height30,),
                  //email
                    AccountWidget(
                    appIcon: AppIcon(
                  icon: Icons.email,
                  backgroundColor: AppColors.yellowColor,
                  iconColor: Colors.white,
                  iconSize: Dimentions.height10*5/2,
                  size: Dimentions.height10*5,
                  ), 
                    bigText: BigText(text: 'jas@gmail.com')
                    ),
                    SizedBox(height: Dimentions.height30,),
                  //address
                    AccountWidget(
                    appIcon: AppIcon(
                  icon: Icons.location_on,
                  backgroundColor: AppColors.yellowColor,
                  iconColor: Colors.white,
                  iconSize: Dimentions.height10*5/2,
                  size: Dimentions.height10*5,
                  ), 
                    bigText: BigText(text: 'XYZ')
                    ),
                    SizedBox(height: Dimentions.height30,),
                   //message
                    AccountWidget(
                    appIcon: AppIcon(
                  icon: Icons.message_outlined,
                  backgroundColor: Colors.redAccent,
                  iconColor: Colors.white,
                  iconSize: Dimentions.height10*5/2,
                  size: Dimentions.height10*5,
                  ), 
                    bigText: BigText(text: 'Check messages')
                    ),
                    SizedBox(height: Dimentions.height30,),     
              
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}