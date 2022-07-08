import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/Application/search/search_bloc.dart';
import 'package:netflix_app/Presentation/Widgets/main_title.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/Widgets/main_card.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 4),
            child: mainTitle(title: 'Movies & TV'),
          ),
          SbHeight20,
          Expanded(child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1 / 1.5,
                children: List.generate(20, (index) {
                  final movie = state.searchResultList[index];
                  return MainCard(
                    imgUrl: movie.posterImgUrl,
                  );
                }),
              );
            },
          ))
        ],
      ),
    );
  }
}
