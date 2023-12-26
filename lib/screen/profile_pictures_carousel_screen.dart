import 'package:flutter/material.dart';

// Экран детального отображения фотографий пользователя с помощью PageView
class ProfliePictureCarouselScreen extends StatefulWidget {
  ProfliePictureCarouselScreen(
      {super.key, required this.photosUrls, required this.checkedIndex})
      : assert(checkedIndex >= 0),
        assert(photosUrls.isNotEmpty),
        assert(photosUrls.length >= checkedIndex);
  // Список url's фотографий 
  final List<String> photosUrls;
  // Индекс нажатой на предыдущем экране фотографии, необходим для утсновки initialPage
  final int checkedIndex;
  @override
  State<ProfliePictureCarouselScreen> createState() =>
      _ProfliePictureCarouselScreenState();
}

class _ProfliePictureCarouselScreenState
    extends State<ProfliePictureCarouselScreen> {
  late final PageController pageViewController;
  @override
  void initState() {
    super.initState();
    pageViewController =
        PageController(initialPage: widget.checkedIndex, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListenableBuilder(
                listenable: pageViewController,
                builder: (context, child) {
                  // Отсчёт страниц для пользователья начинается с 1, а для контроллера с 0
                  final currentSlide = 1 +
                      (pageViewController.page?.ceil() ??
                          pageViewController.initialPage);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(
                          text: '$currentSlide/',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                          children: [
                            TextSpan(
                              text: '${widget.photosUrls.length}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            )
                          ]),
                    ),
                  );
                },
              ),
            ),
          ]),
      body: PageView.builder(
        controller: pageViewController,
        itemCount: widget.photosUrls.length,
        itemBuilder: (context, index) {
          return Padding(
            // Не добавляем отступы перед первой и после последней страницы
            padding: EdgeInsets.only(
                left: index == 0 ? 0 : 10,
                right: index == widget.photosUrls.length ? 0 : 10),
            child: Center(
              child: Hero(
                tag: widget.photosUrls[index],
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    widget.photosUrls[index],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
