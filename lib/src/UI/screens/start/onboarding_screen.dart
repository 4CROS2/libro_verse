import 'package:flutter/material.dart';
import 'package:libro_verse/src/UI/screens/providers/onboarding_provider.dart';
import 'package:libro_verse/src/UI/screens/start/views/page_content.dart';
import 'package:provider/provider.dart';
import '../../../../utils/constants/onboarding_texts.dart';

class OnBoardingScreen extends StatelessWidget {
   
  const OnBoardingScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    var onBoardingProvider = Provider.of<OnboardingProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          _OnBoardingPages(onBoardingProvider: onBoardingProvider),
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
              child: const _NextButton(),
            ),
          )
        ],
      )
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var onBoardingProvider = Provider.of<OnboardingProvider>(context);

    return ElevatedButton(
      onPressed: (){
        onBoardingProvider.currentPage = onBoardingProvider.getCurrentPage + 1;
      },
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(5),
        backgroundColor: MaterialStateProperty.all(const Color(0xffA8A6FF)),
        shape: MaterialStateProperty.all(const StadiumBorder())
      ),
      child: const Text('Next', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),)
    );
  }
}

class _OnBoardingPages extends StatelessWidget {
  const _OnBoardingPages({
    required this.onBoardingProvider,
  });

   final OnboardingProvider onBoardingProvider;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: onBoardingProvider.pageController,
      onPageChanged: (int index) {
        onBoardingProvider.currentPage = index;
      } ,
      children: [
        PageViewContent(
          titulo: OnBoardingText.title1,
          subtitulo: OnBoardingText.subtitle1,
          imagen: OnBoardingText.img1
        ),
        PageViewContent(
          titulo: OnBoardingText.title2,
          subtitulo: OnBoardingText.subtitle2,
          imagen: OnBoardingText.img2
        ),
        PageViewContent(
          titulo: OnBoardingText.title3,
          subtitulo: OnBoardingText.subtitle3,
          imagen: OnBoardingText.img3
        ),
      ],
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
    var onBoardingProvider = Provider.of<OnboardingProvider>(context);
    return Container(
      margin: EdgeInsets.only(bottom: size.height * 0.15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(active: onBoardingProvider.getCurrentPage == 0),
          const SizedBox(width: 10,),
          _Dot(active: onBoardingProvider.getCurrentPage == 1),
          const SizedBox(width: 10,),
          _Dot(active: onBoardingProvider.getCurrentPage == 2),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    super.key, required this.active,
  });

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 11,
      height: 11,
      decoration: BoxDecoration(
        color: active ? const Color(0xffA8A6FF) : const Color.fromARGB(255, 187, 187, 187),
        borderRadius: BorderRadius.circular(5)
      ),
    );
  }
}