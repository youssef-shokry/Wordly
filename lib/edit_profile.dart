import 'package:depi_final_project/widgets/custom_button.dart';
import 'package:depi_final_project/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'presentation/utils/app_colors.dart';
import 'presentation/utils/app_styles.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        backgroundColor: AppColors.paleLavender,
      ),

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: AlignmentGeometry.bottomEnd,
                children: [
                  CircleAvatar(
                    radius: 90,
                    backgroundColor: AppColors.darkBlue.withAlpha(50),

                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage("assets/images/Editing_Profile.png"),
                          width: 176,
                          height: 176,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.darkBlue,

                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: 30,
                      color: AppColors.wight,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              //-----------------------------------------------------------------------------
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20),
                color: AppColors.wight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Full Name",
                            style: AppStyles.blackInterSemiBoldDarkGrey14,
                          ),
                          Text(
                            "Required",
                            style: AppStyles.blackInterSemiBoldDarkGrey14,
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              hintText: "Enter Full Name",
                              prefixIcon: Icons.person_outline,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Email Address",
                            style: AppStyles.blackInterSemiBoldDarkGrey14,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.check,
                                color: Color(0xFF006747),
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Verified',
                                style: AppStyles.blackInterSemiBoldDarkGreen10,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              hintText: "Enter Email Address",
                              prefixIcon: Icons.email_outlined,
                              suffixIcon: Icons.verified,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(7),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                child: CustomButton(
                  textButton: "Save Changes",
                  font: AppStyles.blackInterSemiBoldWhite14,
                  backGroundColor: Color(0xff2563EB),
                ),
              ),

              SizedBox(height: 4),

              SizedBox(
                child: CustomButton(
                  textButton: "Cancel",
                  font: AppStyles.blackInterSemiBoldBlack14,
                  backGroundColor: Color(0xffEAEDFF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
