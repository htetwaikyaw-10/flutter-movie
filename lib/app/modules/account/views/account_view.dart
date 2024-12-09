import 'package:flutter/material.dart';
import 'package:flutter_movie_application/app/data/color_consts.dart';

import 'package:get/get.dart';

import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConsts.scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: ColorConsts.scaffoldBgColor,
        title: const Text('AccountView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AccountView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
