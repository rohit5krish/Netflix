import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/Application/downloads/downloads_bloc.dart';
import 'package:netflix_app/Presentation/Widgets/app_bar_widget.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/core/url.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  final _widgetsList = [
    const _SmartDownload(),
    const Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'Downloads',
          )),
      body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) {
            return _widgetsList[index];
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 30);
          },
          itemCount: _widgetsList.length),
    );
  }
}

class _SmartDownload extends StatelessWidget {
  const _SmartDownload({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings,
          color: whiteclr,
        ),
        Text('Smart Downloads')
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImages());
    });
    return Column(
      children: [
        const Text(
          'Introducing Downloads For You',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        SbHeight20,
        Text(
          "We'll Download a personalized selection of \nmovies and shows for you, so there's \nalways something to watch on your \ndevice.",
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(builder: (context, state) {
          return SizedBox(
            width: size.width,
            height: size.width,
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : state.downloads.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: size.width * 0.33,
                            backgroundColor: Colors.grey.withOpacity(0.3),
                          ),
                          DownloadsImageWidget(
                            images:
                                '$imgBaseUrl${state.downloads[0].posterPath}',
                            imgMargin:
                                const EdgeInsets.only(left: 160, bottom: 20),
                            angle: 20,
                            size: Size(size.width * 0.32, size.width * 0.50),
                          ),
                          DownloadsImageWidget(
                            images:
                                '$imgBaseUrl${state.downloads[1].posterPath}',
                            imgMargin:
                                const EdgeInsets.only(right: 160, bottom: 20),
                            angle: -20,
                            size: Size(size.width * 0.32, size.width * 0.50),
                          ),
                          DownloadsImageWidget(
                            images:
                                '$imgBaseUrl${state.downloads[2].posterPath}',
                            imgMargin: const EdgeInsets.only(left: 0),
                            size: Size(size.width * 0.35, size.width * 0.55),
                          ),
                        ],
                      ),
          );
        }),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
              color: Colors.blueAccent[700],
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Set Up',
                  style: TextStyle(
                    color: whiteclr,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
        ),
        SbHeight10,
        MaterialButton(
            color: whiteclr,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'See what you can download',
                style: TextStyle(
                  color: bgcolor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.images,
    required this.imgMargin,
    required this.size,
    this.angle = 0,
  }) : super(key: key);

  final double angle;
  final String images;
  final EdgeInsets imgMargin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: imgMargin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(images),
            )),
      ),
    );
  }
}
