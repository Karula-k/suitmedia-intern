import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_intern/core/enum/state_enum.dart';
import 'package:suitmedia_intern/features/domain/entities/active_user.dart';
import 'package:suitmedia_intern/features/presentation/pages/user_pages.dart';
import 'package:suitmedia_intern/features/presentation/provider/palindrom_provider.dart';
import 'package:suitmedia_intern/features/presentation/widget/background_scaffold.dart';

class HomePage extends StatefulWidget {
  static const routeNamed = '/home_pages';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controlerPalindrom = TextEditingController();

  final _controlerUser = TextEditingController();
  @override
  void dispose() {
    _controlerPalindrom.dispose();
    _controlerUser.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
        image: const AssetImage('assets/background.png'),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Image.asset(
                  'assets/btn_add_photo.png',
                  width: 120,
                  height: 120,
                ),
              ),
              TextColumn(
                controllerPalindrom: _controlerPalindrom,
                controllerUser: _controlerUser,
              ),
              ListButton(
                controllerPalindrom: _controlerPalindrom,
                controllerUser: _controlerUser,
              ),
            ],
          ),
        ));
  }
}

//all TextField widget
class TextColumn extends StatelessWidget {
  final TextEditingController controllerPalindrom;
  final TextEditingController controllerUser;
  const TextColumn(
      {Key? key,
      required this.controllerUser,
      required this.controllerPalindrom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.8,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controllerUser,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Name",
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(15)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controllerPalindrom,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Palindrom",
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(15)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//all Button widget
class ListButton extends StatelessWidget {
  final TextEditingController controllerPalindrom;
  final TextEditingController controllerUser;
  const ListButton(
      {Key? key,
      required this.controllerPalindrom,
      required this.controllerUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        SizedBox(
          width: width * 0.8,
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
                backgroundColor: MaterialStateProperty.all(Colors.teal[800])),
            onPressed: () {
              String textTest = controllerPalindrom.text;
              controllerPalindrom.clear();
              if (textTest.isNotEmpty) {
                Provider.of<PalindromProvider>(context, listen: false)
                    .fetchPalindrom(textTest);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                      child: AlertDialog(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          title: const Text(""),
                          content: Consumer<PalindromProvider>(
                            builder:
                                (BuildContext context, value, Widget? child) {
                              final state = value.state;
                              if (state == RequestState.Loading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state == RequestState.Loaded) {
                                return Text(
                                    "$textTest ,${value.result.returnText}");
                              } else {
                                return Text(value.massage);
                              }
                            },
                          ),
                          actions: [
                            TextButton(
                                child: const Text("Ok"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                })
                          ]),
                    );
                  },
                );
              }
            },
            child: const Text(
              "CHECK",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.8,
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
                backgroundColor: MaterialStateProperty.all(Colors.teal[800])),
            onPressed: () {
              if (controllerUser.text.isNotEmpty) {
                Navigator.of(context).pushNamed(UserPage.routeNamed,
                    arguments: ActiveUser(
                        username: controllerUser.text,
                        name: "Selected User Name"));
                controllerUser.clear();
              }
            },
            child: const Text(
              "NEXT",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
