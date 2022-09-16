import 'package:flutter/material.dart';

class SideBarScreen extends StatefulWidget {
  const SideBarScreen({Key? key}) : super(key: key);

  @override
  State<SideBarScreen> createState() => _SideBarScreenState();
}

class _SideBarScreenState extends State<SideBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.transparent,
                    child: Image(
                      image: AssetImage("assets/a.jpg"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(width: 10),
                const Text(
                  "Manage by Account",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(width: 10),
                const Text(
                  "My Order",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(width: 10),
                const Text(
                  "Address",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(width: 10),
                const Text(
                  "Saved Store",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(width: 10),
                const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                )
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 80, bottom: 20),
            child: Text(
              "Lieferlein.de",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
