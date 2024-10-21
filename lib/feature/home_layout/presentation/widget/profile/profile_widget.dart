import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/routes/page_route_name.dart';
import '../../../../../core/utils/Functions/validators/my_validators.dart';
import '../../../../../core/utils/widget/custom_text_form_field.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile "),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, PageRouteName.login);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.logout),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          children: [
            CustomTextFromField(
              inputType: TextInputType.name,
              labelText: "user name",
              hintText: "enter user name",
              controller: TextEditingController(),
              validator: (value) => MyValidators.validateNotEmpty(value: value),
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextFromField(
                    inputType: TextInputType.name,
                    labelText: "user name",
                    hintText: "enter user name",
                    controller: TextEditingController(),
                    validator: (value) =>
                        MyValidators.validateNotEmpty(value: value),
                  ),
                ),
                SizedBox(
                  width: 16.h,
                ),
                Expanded(
                  child: CustomTextFromField(
                    inputType: TextInputType.name,
                    labelText: "user name",
                    hintText: "enter user name",
                    controller: TextEditingController(),
                    validator: (value) =>
                        MyValidators.validateNotEmpty(value: value),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomTextFromField(
              inputType: TextInputType.emailAddress,
              labelText: "user name",
              hintText: "enter user name",
              controller: TextEditingController(),
              validator: (value) => MyValidators.validateEmail(value),
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomTextFromField(
              inputType: TextInputType.text,
              labelText: "user name",
              hintText: "enter user name",
              controller: TextEditingController(),
              validator: (value) => MyValidators.validatePassword(value),
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomTextFromField(
              inputType: TextInputType.text,
              labelText: "user name",
              hintText: "enter user name",
              controller: TextEditingController(),
              validator: (value) => MyValidators.validatePasswordConfirmation(
                password: TextEditingController().text,
                confirmPassword: TextEditingController().text,
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomTextFromField(
                inputType: TextInputType.phone,
                labelText: "user name",
                hintText: "enter user name",
                controller: TextEditingController(),
                validator: (value) => MyValidators.validatePhoneNumber(value)),
            SizedBox(
              height: 20.h,
            ),
            //  const SubmitRegisterWidget(),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      ),
    );
    ;
  }
}
