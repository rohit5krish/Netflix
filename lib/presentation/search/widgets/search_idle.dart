import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/Application/search/search_bloc.dart';
import 'package:netflix_app/Presentation/Widgets/main_title.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/core/url.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const mainTitle(
            title: 'Top Searches',
          ),
          SbHeight20,
          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.idleList.isEmpty) {
                  return const Center(child: Text('The List is Empty'));
                } else if (state.isError) {
                  return const Center(child: Text('An error occured'));
                }
                return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final movie = state.idleList[index];
                      return TopSearch(
                        title: movie.title ?? movie.title2.toString(),
                        imageUrl: '$imgBaseUrl${movie.backImg}',
                      );
                    },
                    separatorBuilder: (context, index) => SbHeight20,
                    itemCount: state.idleList.length);
              },
            ),
          )
        ],
      ),
    );
  }
}

class TopSearch extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearch({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: size.width * 0.3,
          height: 70,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageUrl),
          )),
        ),
        SbWidth10,
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Icon(
          CupertinoIcons.play_circle,
          size: 50,
          color: whiteclr,
        )
      ],
    );
  }
}
