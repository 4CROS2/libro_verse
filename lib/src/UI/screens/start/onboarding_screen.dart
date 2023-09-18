import 'package:flutter/material.dart';
import 'package:libro_verse/src/UI/screens/providers/onboarding_provider.dart';
import 'package:libro_verse/src/UI/screens/start/views/page_content.dart';
import 'package:provider/provider.dart';
import '../../../../utils/constants/onboarding_texts.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController = PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        OnBoardingPages(pageController: _pageController,),
        Align(
          alignment: Alignment.bottomCenter,
          child: _Dots(size: size),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: size.height * 0.03),
            width: 200,
            height: 65,
            child: _NextButton(pageController: _pageController,),
          ),
        )
      ],
    ));
  }
}

class _NextButton extends StatelessWidget {
   _NextButton({
    required this.pageController,
  });

  PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingProvider>(
  builder: (context, onBoardingProvider,children) {
    return ElevatedButton(
        onPressed: () {
          pageController.animateToPage(onBoardingProvider.getCurrentPage + 1, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
          onBoardingProvider.updateCurrentPage(onBoardingProvider.getCurrentPage + 1);
        },
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(5),
            backgroundColor: MaterialStateProperty.all(const Color(0xffA8A6FF)),
            shape: MaterialStateProperty.all(const StadiumBorder())),
        child: const Text(
          'Next',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ));
  },
);
  }
}



class OnBoardingPages extends StatelessWidget {

  OnBoardingPages({required this.pageController});

  PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingProvider>(
      builder: (context, onBoardingProvider, child) {
        return PageView(
          controller: pageController,
          onPageChanged: (int index) {
            onBoardingProvider.updateCurrentPage(index);
          },
          children: [
            PageViewContent(
                titulo: OnBoardingText.title1,
                subtitulo: OnBoardingText.subtitle1,
                imagen: OnBoardingText.img1),
            PageViewContent(
                titulo: OnBoardingText.title2,
                subtitulo: OnBoardingText.subtitle2,
                imagen: OnBoardingText.img2),
            PageViewContent(
                titulo: OnBoardingText.title3,
                subtitulo: OnBoardingText.subtitle3,
                imagen: OnBoardingText.img3),
          ],
        );
      },
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingProvider>(
  builder: (context, onBoardingProvider, children) {
    return Container(
      margin: EdgeInsets.only(bottom: size.height * 0.15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(active: onBoardingProvider.getCurrentPage == 0),
          const SizedBox(
            width: 10,
          ),
          _Dot(active: onBoardingProvider.getCurrentPage == 1),
          const SizedBox(
            width: 10,
          ),
          _Dot(active: onBoardingProvider.getCurrentPage == 2),
        ],
      ),
    );
  },
);
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    super.key,
    required this.active,
  });

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 11,
      height: 11,
      decoration: BoxDecoration(
          color: active
              ? const Color(0xffA8A6FF)
              : const Color.fromARGB(255, 187, 187, 187),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
