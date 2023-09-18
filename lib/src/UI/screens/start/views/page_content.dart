import 'package:flutter/material.dart';

class PageViewContent extends StatelessWidget {
   
  const PageViewContent({
    Key? key, 
    required this.titulo, 
    required this.subtitulo, 
    required this.imagen
  }) : super(key: key);

  final String titulo;
  final String subtitulo;
  final String imagen;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffEDEDFF),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15),
            margin: const EdgeInsets.only(bottom: 15),
            width: double.infinity,
            height: 450,
            child: Center(
              child: Image.asset(imagen, width: 500, height: 600)
            )
          ),
          Text(titulo, textAlign: TextAlign.center, style: const TextStyle(fontSize: 33, fontWeight: FontWeight.bold),),
          Text(subtitulo, textAlign: TextAlign.center, style: const TextStyle(fontSize: 19),),
        ],
      ),
    );
  }
}