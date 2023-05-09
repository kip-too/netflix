import 'package:flutter/material.dart';
import 'package:netflix_clone1/cubits/cubits.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/data.dart';
import '../widgets/widgets_barrel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(() {
      context.read<AppBarCubit>().setOffSet(_scrollController.offset);
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        child: const Icon(Icons.cast),
        onPressed: () => print("cast"),
      ),
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: BlocBuilder<AppBarCubit, double>(
  builder: (context, scrollOffSet) {
    return CustomAppBar(scrollOffSet: scrollOffSet,);
  },
),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers:  [
           SliverToBoxAdapter(
            child: ContentHeader(featuredContent: sintelContent),
          ),
          SliverPadding(
              padding: const EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
              child: Previews(
                key: const PageStorageKey("previews"),
                title:"Previews",
                contentList: previews,
              ),
            ),
          ),
          SliverToBoxAdapter(
            key: const PageStorageKey("myList"),

            child: ContentList(
              title:'My List',
              contentList: myList,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 20.0),
            sliver: SliverToBoxAdapter(
              child: ContentList(
                key: const PageStorageKey("originals"),

                title:'Netflix Originals',
                contentList: originals,
                isoriginals: true,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: const PageStorageKey("trending"),

              title:'Trending',
              contentList: trending,
            ),
          ),
        ],
      ),
    );
  }
}
