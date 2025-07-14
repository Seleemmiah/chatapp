import 'package:chat_app/components/my_drawer.dart';
import 'package:chat_app/components/useer_tile.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // chat and auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text('Home Page'),
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  // build a listv of users except from the current loggin user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        // error
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        // loading...
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading...');
        }

        // return list of users
        return ListView(
          children:
              snapshot.data!
                  .map<Widget>((UserData) => _buildUserListItem(UserData, context)).toList(),
        );
      },
    );
   }

    // build a list item for each user
    Widget _buildUserListItem(
      Map<String, dynamic> userData,
      BuildContext context,
    ) {
      // display all user except current user
      return UseerTile(
        text: userData['email'],
        onTap: () {
          // navigate to chat page with the selected user
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatPage(
              receiverEmail: userData['email'],
            )),
          );
        },
      );
    }
}
