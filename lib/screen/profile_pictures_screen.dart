import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/interactors/profile_picture_interactor.dart';
import 'package:surf_flutter_courses_template/screen/profile_pictures_carousel_screen.dart';

// Начальный экран приложения
class ProfilePicturesScreen extends StatelessWidget {
  const ProfilePicturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // Надпись Постограм
          title: Image.asset('assets/image 1.png'),
          centerTitle: true,
        ),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                  future:
                      context.read<ProfilePicturesInteractor>().getPhotosUrls(),
                  builder: (context, snapshot) => snapshot.hasData
                      ? _ProfileGridPictures(
                          listOfUrls: snapshot.data ?? [],
                        )
                      : const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// виджет для отображения в виде grid фотографий на начальном экране приложения
class _ProfileGridPictures extends StatelessWidget {
  const _ProfileGridPictures({required this.listOfUrls});
  final List<String> listOfUrls;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      crossAxisCount: 3,
      shrinkWrap: true,
      children: listOfUrls
          .map(
            (e) => GestureDetector(
              child: Hero(
                tag: e,
                child: Image.network(
                  e,
                  fit: BoxFit.fitHeight,
                ),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfliePictureCarouselScreen(
                    checkedIndex: listOfUrls.indexOf(e),
                    photosUrls: listOfUrls,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
