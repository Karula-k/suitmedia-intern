import 'package:flutter/material.dart';
import 'package:suitmedia_intern/features/domain/entities/active_user.dart';
import 'package:suitmedia_intern/features/presentation/pages/homes_page.dart';
import 'package:suitmedia_intern/features/presentation/pages/user_list_pages.dart';

class UserPage extends StatelessWidget {
  final ActiveUser model;
  static const routeNamed = "/user_pages";
  const UserPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(HomePage.routeNamed);
            },
          ),
          title: const Text(
            "Second Screen",
            style: TextStyle(color: Colors.black),
          )),
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text("Welcome"),
                    Text(
                      model.username,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                model.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.teal[800])),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              UserListPage(username: model.username)));
                    },
                    child: const Text("Choose a user")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
