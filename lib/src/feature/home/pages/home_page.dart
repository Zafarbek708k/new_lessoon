import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:new_lessoon/src/data/entity/unsplash_model.dart';
import 'package:new_lessoon/src/data/repository/app_repository_implements.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  UnSplashModel? unSplashModel;
  final AppRepositoryImplements repository = AppRepositoryImplements();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    log("fetchData");
    setState(() {
      isLoading = true;
    });

    unSplashModel = await repository.fetchData();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
          child: isLoading
              ? const CircularProgressIndicator()
              : unSplashModel != null
                  ? ListView.builder(
                      itemCount: unSplashModel!.results!.length,
                      itemBuilder: (context, index) {
                        if (index + 4 < unSplashModel!.results!.length) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: CustomShapeImage(
                              model1: unSplashModel!.results![index],
                              model2: unSplashModel!.results![index + 1],
                              model3: unSplashModel!.results![index + 2],
                              model4: unSplashModel!.results![index + 3],
                              model5: unSplashModel!.results![index + 4],
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    )
                  : const Text("No data available"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh_outlined),
        onPressed: () async {
          await fetchData();
        },
      ),
    );
  }
}

class CustomShapeImage extends StatelessWidget {
  const CustomShapeImage({
    super.key,
    required this.model1,
    required this.model2,
    required this.model3,
    required this.model4,
    required this.model5,
  });

  final Result model1;
  final Result model2;
  final Result model3;
  final Result model4;
  final Result model5;

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: [
        StaggeredGridTile.count(
          crossAxisCellCount: 3,
          mainAxisCellCount: 2,
          child: Tile(
            index: 0,
            model: model1,
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 2,
          child: Tile(
            index: 1,
            model: model2,
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 2,
          child: Tile(
            index: 2,
            model: model3,
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 2,
          child: Tile(
            index: 3,
            model: model4,
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 4,
          mainAxisCellCount: 2,
          child: Tile(
            index: 4,
            model: model5,
          ),
        ),
      ],
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({super.key, required this.index, required this.model});

  final Result model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.blueGrey,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Image.network(
                model.urls!.full ?? "https://cdn.pixabay.com/photo/2017/02/12/21/29/false-2061131_640.png",
                fit: BoxFit.contain,
              )),
              Text(model.updatedAt.toString())
            ],
          ),
        ),
      ),
    );
  }
}
