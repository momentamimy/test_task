import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task/modules/home/domain/usecase/articles_usecase.dart';
import 'package:test_task/modules/home/home_di.dart';
import 'package:test_task/modules/home/presentation/screens/home_drawer.dart';
import 'package:test_task/modules/home/presentation/components/home/articles_list_view.dart';
import 'package:test_task/modules/home/presentation/provider/home_provider.dart';
import 'package:test_task/res.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) =>
            HomeProvider(articlesUseCase: hsl<GetAllArticlesUseCase>())
              ..getAllArticles(),
        builder: (context, child) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white.withOpacity(0.9),
              appBar: AppBar(
                backgroundColor: Colors.black,
                leading: Builder(
                  builder: (context) => // Ensure Scaffold is in context
                      IconButton(
                          icon: const Icon(Icons.menu, color: Colors.white),
                          onPressed: () => Scaffold.of(context).openDrawer()),
                ),
                title: const Text("LINK DEVELOPMENT",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Image.asset(
                      Res.search,
                      width: 25,
                    ),
                  )
                ],
              ),
              drawer: const HomeDrawer(),
              body: const ArticlesListView(),
            ),
          );
        });
  }
}
