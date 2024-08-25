import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String description;
  final String image;

  const SlideInfo(
     this.title,
     this.description,
     this.image,
  );
}

final slides = <SlideInfo> [
  SlideInfo('Busca la comida', 'Adipisicing adipisicing eiusmod aliqua do. Voluptate enim non reprehenderit qui fugiat anim dolor duis veniam non cupidatat cillum. Qui nisi ut amet aliqua proident veniam deserunt occaecat eu.', 'assets/images/1.png'),
  SlideInfo('Entraga rapida', 'Irure ea non voluptate ea culpa aliquip labore aliqua. Ipsum labore officia cillum sint fugiat aute velit amet cupidatat. Veniam exercitation sunt duis sit sit labore sit dolore tempor.', 'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'Ut exercitation laborum amet culpa. Aliqua proident cillum enim incididunt. Dolor amet nostrud laboris adipisicing veniam minim voluptate amet sint ex Lorem. Consectetur exercitation est cupidatat do elit ut officia minim mollit.', 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {

  static const String name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageviewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map((slide) => _Slide(
                title: slide.title,
                description: slide.description,
                image: slide.image,
              )).toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Skip'),
              onPressed: () => context.pop(),
            ),
          ),

          endReached ? 
            Positioned(
              bottom: 30,
              right: 30,
              child: FadeInRight(
                from: 15,
                delay: const Duration(seconds: 1),
                child: FilledButton(
                  onPressed: () => context.pop(),
                  child: const Text('Comenzar'),
                ),
              )
            ) : const SizedBox(),
        ],
      ),

    );
  }
}

class _Slide extends StatelessWidget {

  final String title;
  final String description;
  final String image;

  const _Slide({ 
    required this.title, 
    required this.description, 
    required this.image
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final descriptionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image:AssetImage( image ) ),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(description, style: descriptionStyle),
          ],
        ),
      ),
    );
  }
}