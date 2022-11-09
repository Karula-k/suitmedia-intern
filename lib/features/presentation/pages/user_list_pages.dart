import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_intern/core/enum/state_enum.dart';
import 'package:suitmedia_intern/features/domain/entities/active_user.dart';
import 'package:suitmedia_intern/features/domain/entities/user.dart';
import 'package:suitmedia_intern/features/presentation/pages/user_pages.dart';
import 'package:suitmedia_intern/features/presentation/provider/user_provider.dart';
import 'package:suitmedia_intern/features/presentation/widget/profile_or_icon.dart';

class UserListPage extends StatefulWidget {
  final String username;
  static const routeNamed = "/list_user";
  const UserListPage({Key? key, required this.username}) : super(key: key);

  @override
  State<UserListPage> createState() => _ListUserState();
}

class _ListUserState extends State<UserListPage> {
  int number = 0;
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<UserProvider>(context, listen: false)..fetchListUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          leading: const BackButton(
            color: Colors.black,
          ),
          title: const Text(
            "Third Screen",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Consumer<UserProvider>(
          builder: (context, value, _) {
            final state = value.statusUserList;
            if (state == RequestState.Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state == RequestState.Loaded ||
                state == RequestState.EndCheck) {
              return RefreshIndicator(
                onRefresh: () async {
                  number = 0;
                  return Provider.of<UserProvider>(context, listen: false)
                      .update();
                },
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollinfo) {
                    if (scrollinfo.metrics.pixels >=
                            scrollinfo.metrics.maxScrollExtent &&
                        state == RequestState.Loaded) {
                      Provider.of<UserProvider>(context, listen: false)
                          .nextPage(number);
                      number += 1;
                    }
                    return false;
                  },
                  child: ListView.separated(
                    itemCount: value.listUser.length + 1,
                    itemBuilder: (context, index) {
                      return index == value.listUser.length
                          ? const Center(
                              child: Text("you have reached bottom page"))
                          : UserTile(
                              data: value.listUser[index],
                              user: widget.username,
                            );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                  ),
                ),
              );
            } else if (state == RequestState.Empty) {
              return Center(child: Text(value.massage));
            } else if (state == RequestState.Error) {
              return Center(child: Text(value.massage));
            } else {
              return const Center(child: Text("Something wrong"));
            }
          },
        ));
  }

  @override
  void dispose() {
    super.dispose();
    number = 0;
  }
}

class UserTile extends StatelessWidget {
  final String user;
  final User data;
  const UserTile({
    Key? key,
    required this.data,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(UserPage.routeNamed,
            arguments: ActiveUser(
                name: '${data.firstName} ${data.lastName}', username: user));
      },
      leading: PictureOrIcon(linkImg: data.avatar, size: 50),
      title: Text(
        '${data.firstName} ${data.lastName}',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        data.email,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
