import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Flutter + Material 3 :)'),
      ),
      body: const _HomeView(),
      drawer: SideMenu(scaffoldkey: scaffoldKey,)
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    appMenuItems;

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final item = appMenuItems[index];
        return _CustomListTile(item: item);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.item,
  });

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(item.icon, color: colors.primary),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      title: Text(item.title),
      subtitle: Text(item.subTitle),
      onTap: () {
        //Navigator.of(context).push(
        //  MaterialPageRoute(
        //    builder: (context) => const ButtonsScreen()
        //  )
        //);

        //Navigator.pushNamed(context, item.link);

        
        //estas dos ultimas son partes de GoRouter
        //context.pushNamed(CardsScreen.name);
        context.push(item.link);
      },
    );
  }
}
