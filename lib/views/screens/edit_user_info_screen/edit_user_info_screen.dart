// import 'dart:developer';

// import 'package:dotted_decoration/dotted_decoration.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:store_app/controller/edit_user_info_controller.dart';
// import 'package:store_app/utils/style/colors.dart';
// import 'package:store_app/views/screens/landing/widgets/auth_button.dart';
// import 'package:store_app/views/widgets/custom_text_form_filed.dart';
// import 'package:store_app/views/widgets/loading_widget.dart';

// class EditUserInfoScreen extends StatelessWidget {
//   const EditUserInfoScreen({Key? key}) : super(key: key);
//   static const String routeName = '/editUserInfoScreen';
//   @override
//   Widget build(BuildContext context) {

//     Size size = MediaQuery.of(context).size;
//     var argument = Get.arguments;
//     // editInfoUserScreenController.initTextformfiledWithData(arguments: argument);
//     return Scaffold(
//       appBar: AppBar(),
//       body: Stack(
//         children: [
//           Form(
//             // key: editInfoUserScreenController.formKey,
//             child: SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 child: Column(
//                   children: [
//                     Container(
//                           height: 150,
//                           width: double.infinity,
//                           decoration: DottedDecoration(
//                             shape: Shape.box,
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                           child: InkWell(
//                             borderRadius: BorderRadius.circular(16),
//                             onTap: () {
//                               editInfoUserScreenController.chooseImage();
//                             },
//                             child: editInfoUserScreenController.imageFile !=
//                                     null
//                                 ? Container(
//                                     clipBehavior: Clip.antiAliasWithSaveLayer,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(16),
//                                     ),
//                                     child: Image.file(
//                                       editInfoUserScreenController.imageFile!,
//                                       width: double.infinity,
//                                       fit: BoxFit.fill,
//                                     ),
//                                   )
//                                 : Column(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                     children: [
//                                       Image.asset(
//                                         'assets/images/photo.png',
//                                         height: 70,
//                                       ),
//                                       Text(
//                                         'Update Your Image',
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .headline6,
//                                       ),
//                                     ],
//                                   ),
//                           ),
//                         ),
//                     const Divider(color: Colors.transparent),
//                     CustomTextWithTextFormFiled(
//                       title: 'Full Name',
//                       validator: (newValue) {
//                         if (newValue.isEmpty || newValue.length < 3) {
//                           return 'Unvalid value';
//                         }
//                         return null;
//                       },
//                       textInputAction: TextInputAction.next,
//                     ),
//                     CustomTextWithTextFormFiled(
//                       title: 'Email Address',
//                       validator: (newValue) {
//                         if (!GetUtils.isEmail(newValue)) {
//                           return 'Unvalid value';
//                         }
//                         return null;
//                       },
//                       textInputAction: TextInputAction.next,
//                     ),
//                     CustomTextWithTextFormFiled(
//                       title: 'Phone Number',
//                       keyboard: TextInputType.number,
//                       formatters: [
//                         FilteringTextInputFormatter.digitsOnly,
//                       ],
//                       validator: (newValue) {
//                         if (!GetUtils.isPhoneNumber(newValue)) {
//                           return 'Unvalid value';
//                         }
//                         return null;
//                       },
//                       textInputAction: TextInputAction.next,
//                     ),
//                     CustomTextWithTextFormFiled(
//                       title: 'Shipping Address',
//                       validator: (newValue) {
//                         if (newValue.isEmpty || newValue.length < 3) {
//                           return 'Unvalid value';
//                         }
//                         return null;
//                       },
//                       textInputAction: TextInputAction.done,
//                       onSubmit: (newValue) {
//                         log('End');
//                       },
//                     ),
//                     Container(
//                       height: 10,
//                       width: double.infinity,
//                       decoration: DottedDecoration(
//                         shape: Shape.line,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           LoadingWidget(
//             size: size,
//             visible: false,
//           ),
//         ],
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: AuthButton(
//           height: 55,
//           onTap: () {
//             Get.focusScope!.unfocus();
//             if (editInfoUserScreenController.formKey.currentState!
//                 .validate()) {}
//           },
//           title: 'Update',
//           bgColor: ConstColors.gradiendFStart,
//         ),
//       ),
//     );
//   }
// }

// class CustomTextWithTextFormFiled extends StatelessWidget {
//   const CustomTextWithTextFormFiled({
//     Key? key,
//     required this.title,
//     required this.validator,
//     this.keyboard,
//     this.formatters,
//     this.textInputAction,
//     this.onSubmit,
//   }) : super(key: key);
//   final String title;
//   final Function(String newValue) validator;
//   final TextInputType? keyboard;
//   final List<TextInputFormatter>? formatters;
//   final TextInputAction? textInputAction;
//   final ValueChanged<String>? onSubmit;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Divider(color: Colors.transparent),
//         Text(
//           title,
//           style: Theme.of(context).textTheme.headline6!.copyWith(
//                 fontWeight: FontWeight.bold,
//                 fontFamily: 'jannah',
//               ),
//         ),
//         CustomTextFormFiled(
//           onSubmit: onSubmit,
//           textInputAction: textInputAction,
//           formatters: formatters,
//           keyboard: keyboard,
//           hint: title,
//           iconData: Icons.title,
//           validator: (newValue) => validator(newValue!),
//         ),
//       ],
//     );
//   }
// }
