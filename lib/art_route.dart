import 'package:flutter/material.dart';
import './art_util.dart';

class ArtRoute extends StatelessWidget {
  final String art;
  const ArtRoute({Key? key, required this.art}) : super(key: key);
  static int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerHeader(
            child: Text(
              'Choose your art',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            decoration: BoxDecoration(
              color: Colors.yellow,
              image: DecorationImage(
                  image: AssetImage('galaxy.jpeg'), fit: BoxFit.fill),
            ),
          ),
          ListTile(
            title: Text(ArtUtil.CARAVAGGIO),
            trailing: Icon(Icons.art_track),
            onTap: () => changeRoute(context, ArtUtil.CARAVAGGIO),
          ),
          ListTile(
            title: Text(ArtUtil.MONET),
            trailing: Icon(Icons.art_track),
            onTap: () => changeRoute(context, ArtUtil.MONET),
          ),
          ListTile(
            title: Text(ArtUtil.VAN_GOGH),
            trailing: Icon(Icons.art_track),
            onTap: () => changeRoute(context, ArtUtil.VAN_GOGH),
          ),
        ],
      )),
      appBar: AppBar(
        title: Text('Navigating Art'),
        actions: [
          PopupMenuButton(
            // icon: Icon(Icons.image),
            itemBuilder: (BuildContext context) {
              return ArtUtil.menuItems.map((String item) {
                return PopupMenuItem<String>(
                  child: Text(item),
                  value: item,
                );
              }).toList();
            },
            onSelected: (String value) => changeRoute(context, value),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(art), fit: BoxFit.cover),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.lime[900],
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.art_track),
            label: ArtUtil.CARAVAGGIO,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.art_track),
            label: ArtUtil.MONET,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.art_track),
            label: ArtUtil.VAN_GOGH,
          ),
        ],
        onTap: (index) {
          String _artist = ArtUtil.menuItems[index];
          _currentIndex = index;
          changeRoute(context, _artist);
        },
      ),
    );
  }
}

void changeRoute(BuildContext context, String menuItem) {
  String image = '';
  switch (menuItem) {
    case ArtUtil.CARAVAGGIO:
      image = ArtUtil.IMG_CARAVAGGIO;
      break;
    case ArtUtil.MONET:
      image = ArtUtil.IMG_MONET;
      break;
    case ArtUtil.VAN_GOGH:
      image = ArtUtil.IMG_VAN_GOGH;
      break;
  }
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: ((context) => ArtRoute(
            art: image,
          )),
    ),
  );
}
