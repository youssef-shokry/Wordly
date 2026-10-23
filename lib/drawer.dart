import 'package:depi_final_project/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';

class WordlyDrawer extends StatefulWidget {
  const WordlyDrawer({super.key});

  @override
  State<WordlyDrawer> createState() => _WordlyDrawerState();
}

class _WordlyDrawerState extends State<WordlyDrawer> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.horizontal(
          right: Radius.circular(25),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    "Wordly",
                    style: TextStyle(
                      color: Color(0xff004ac6),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.close),
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/images/bitmoji_avatar.png'),
              ),
              title: Text(
                'Elena Vance',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              subtitle: Text('Lead Localizan', style: TextStyle(fontSize: 13)),
            ),
            Divider(color: Color(0xffedf0ff)),
            ListTile(
              leading: Icon(Icons.translate),
              title: Text(
                'Translate',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text(
                'History',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              trailing: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '48',
                  style: TextStyle(fontSize: 12, color: Colors.blue),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.star_border),
              title: Text(
                'Favourites',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              trailing: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '8',
                  style: TextStyle(fontSize: 12, color: Colors.blue),
                ),
              ),
            ),
            SwitchListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),

              // leading: ,
              title: Text(
                'Floating Assistant',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              secondary: Icon(Icons.auto_awesome),
              value: isSwitched,
              activeTrackColor: AppColors.electricBlue,
              inactiveThumbColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Settings',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Spacer(),
            Divider(color: Color(0xffedf0ff)),
            Padding(
              padding: const EdgeInsets.only(bottom: 7, left: 6),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text(
                  'Sign Out',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
