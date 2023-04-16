import 'package:flutter/material.dart';

void main() {
  MyApp app = MyApp();
  runApp(app);
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.coffee_outlined),
            actions: [PopupMenuButton(
              itemBuilder: (context){
                return [
                  PopupMenuItem<int>(value: 0, child: Text("Roxo")),
                  PopupMenuItem<int>(value: 1, child: Text("Verde")),
                  PopupMenuItem<int>(value: 2, child: Text("Vermelho"))
                ];
              },
            )],
            title: const Text("Dicas"),
          ),
          body: DataBodyWidget(objects: [
            "La Fin Du Monde - Bock - 65 ibu",
            "Sapporo Premiume - Sour Ale - 54 ibu",
            "Duvel - Pilsner - 82 ibu"
          ]),
          bottomNavigationBar: NewNavBar(icons: [
            Icon(Icons.coffee_outlined),
            Icon(Icons.local_drink_outlined),
            Icon(Icons.flag_outlined),
          ]),
        ));
  }
}

class NewNavBar extends StatelessWidget {
  List<Icon> icons;
  NewNavBar({this.icons = const []});

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(onTap: botaoFoiTocado, 
      items: icons.map(
        (icon) => BottomNavigationBarItem(
          label: " ",
          icon: icon
        )
      ).toList()
    );
  }
}

class DataBodyWidget extends StatelessWidget {
  List<String> objects;
  DataBodyWidget( {this.objects = const [] });

  Expanded processarUmElemento(String obj){
    return Expanded(                
          child: Center(child: Text(obj)),
        );
  }
  @override
  Widget build(BuildContext context) {
    List<Expanded> allTheLines = objects.map(
      (obj) => Expanded(
        child : Center(child: Text(obj)),
      )
    ).toList();
    return Column(children: allTheLines);
  }
}


//https://zapp.run/edit/flutter-zh6206tfh630?entry=lib/main.dart&file=lib/main.dart
