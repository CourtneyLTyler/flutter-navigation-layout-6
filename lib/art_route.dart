import 'package:flutter/material.dart';
import './art_util.dart';

class ArtRoute extends StatelessWidget {
  final String art;
  const ArtRoute({Key? key, required this.art}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
