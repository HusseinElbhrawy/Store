import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/constants/icons.dart';
import 'package:store_app/views/screens/feeds/widgets/feed_screen_item_widget.dart';
import 'package:store_app/views/screens/search/widgets/head_search_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const routeName = '/search';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            floating: true,
            pinned: true,
            delegate: HeaderSearchWidget(
              stackPaddingTop: 175,
              titlePaddingTop: 50,
              title: Text(
                "Search",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ConstColors.title,
                  fontSize: 24,
                ),
              ),
              stackChild: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 1,
                      blurRadius: 3,
                    ),
                  ],
                ),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  // controller: _searchTextController,
                  minLines: 1,
                  // focusNode: _node,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    hintText: 'Search',
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(MyIcons.close),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: false
                ? Column(
                    children: const [
                      SizedBox(height: 50),
                      Icon(MyIcons.search, size: 60),
                      SizedBox(height: 50),
                      Text(
                        'No results found',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  )
                : GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 240 / 420,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    children: List.generate(6, (index) {
                      return const FeedScreenItem();
                    }),
                  ),
          ),
        ],
      ),
    );
  }
}
