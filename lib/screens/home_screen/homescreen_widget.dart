import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roshanpaladiya_firebase/screens/edit_screen/edit_screen.dart';
import 'package:roshanpaladiya_firebase/screens/home_screen/homescreen_controller.dart';
import 'package:roshanpaladiya_firebase/utils/string_res.dart';

AppBar homeAppbar() => AppBar(
      leading: IconButton(
        onPressed: () => Get.to(() => const EditProfileScreen()),
        icon: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.blueGrey,
      title: const Text(
        StringRes.homeAppbarText,
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        GetBuilder<HomeScreenController>(
          builder: (controller) => IconButton(
            onPressed: controller.onPressedAddAccountButton,
            icon: IconButton(
              onPressed: () => controller.onPressedAddNewUser(),
              icon: const Icon(Icons.account_circle),
              color: Colors.white,
            ),
          ),
        ),
        GetBuilder<HomeScreenController>(
          builder: (controller) => IconButton(
            onPressed: () => controller.onPressedLogOutButton(),
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );

Widget loginUserData() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const SizedBox(height: 20),
      GetBuilder<HomeScreenController>(
        id: 'LoginUserData',
        builder: (controller) => Card(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Container(
            height: 150,
            width: 330,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color(0xffa8edea),
                Color(0xfffed6e3),
              ]),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login User',
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 65,
                          width: Get.width / 3,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Text(
                            controller.loginUser!.name![0].capitalize
                                .toString(),
                            style: const TextStyle(color: Colors.black,fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.loginUser?.name.toString() ?? '',
                          style: const TextStyle(color: Colors.black),
                        ),
                        Text(
                          controller.loginUser?.email ?? '',
                          style: const TextStyle(color: Colors.black),
                        ),
                        Text(
                          controller.loginUser?.state ?? '',
                          style: const TextStyle(color: Colors.black),
                        ),    Text(
                          controller.loginUser?.pincode ?? '',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      showData(),
    ],
  );
}

Widget showData() {
  return Expanded(
    child: GetBuilder<HomeScreenController>(
      id: 'SignUpUserData',
      builder: (controller) => ListView.builder(
        itemCount: controller.allUserList?.length,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            color: Colors.teal,
            shape: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(35),
              ),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  controller.allUserList![index].name![0].capitalize.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              title: Text(
                controller.allUserList![index].name.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                controller.allUserList![index].email.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
