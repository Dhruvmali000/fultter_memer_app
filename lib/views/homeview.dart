// ignore: unused_import
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fultter_memer_app/model/memes_response.dart';
import 'package:fultter_memer_app/services/api.dart';
import 'package:url_launcher/url_launcher.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: const Text('Memer App'),
        ),
        body: FutureBuilder<MemeData>(
          future: APis.getMeme(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.custom(
                  gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    repeatPattern: QuiltedGridRepeatPattern.inverted,
                    pattern: [
                      const QuiltedGridTile(2, 2),
                      const QuiltedGridTile(1, 1),
                      const QuiltedGridTile(1, 1),
                      const QuiltedGridTile(1, 2),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final meme = snapshot.data!.memes![index];
                      return InkWell(
                        onTap: () => launchUrl(Uri.parse(meme.url!)),
                        child: Stack(
                          children: [
                            Card(
                              child: CachedNetworkImage(
                                imageUrl: meme.url!,
                                fit: BoxFit.contain,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                color: Colors.black.withOpacity(0.5),
                                child: Text(
                                  meme.name!,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ));
            } else {
              return const Center(
                child: SizedBox.square(
                    dimension: 20.0, child: CircularProgressIndicator()),
              );
            }
          },
        ));
  }
}
