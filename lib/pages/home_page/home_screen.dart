import 'package:flutter/material.dart';
import 'package:star_wars_excercise/constants/strings.dart';
import 'package:star_wars_excercise/pages/home_page/widgets/pagination.dart';
import '../../constants/colors.dart';
import '../menu_screen/menu_screen.dart';
import 'widgets/chars_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MenuScreen()));
              },
              icon: const Icon(Icons.settings))
        ],
        title: Row(
          children: const [
            Text(
              TITULO,
              style: TextStyle(color: AppColors.amber),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(
                width: 30,
                height: 30,
                image: AssetImage(
                  'assets/icons/alert.png',
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/stars_background.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Expanded(
                child: CharsList(
              scrollController: _scrollController,
            )),
            Pagination(scrollController: _scrollController)
          ],
        ),
      ),
    );
  }
}
