import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:mb_task5/pages/home_page.dart';

class LoginPage extends StatefulBuilder {
  const LoginPage({super.key, required super.builder});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void onTap() {
    Navigator.push(
      context, 
      PageTransition(child: const HomePage(), type: PageTransitionType.fade)
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration:  const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/intro.jpg'),fit: BoxFit.cover,),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.8),
              Colors.black.withOpacity(.2),
            ]),
          ),
          child: Padding(
            padding:  const EdgeInsets.all(20.0),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Заказать доставку? Просто!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20,),
                const Text('Выбрать ресторан в своем городе \nили на своей улице',
                style: TextStyle(
                  color: Colors.white,
                  height: 1.4,
                  fontSize: 18,
                ),),
                SizedBox(height: 100,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius:  BorderRadius.circular(10),
                    gradient: const LinearGradient(colors: [Colors.yellow, Colors.orange]),
                  ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    onPressed:() => onTap(),
                    child: const Text(
                      'ЗАКАЗАТЬ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                const Align(
                  child: Text(
                    'Быстрая доставка до двери 24/7.',
                    style: TextStyle(color: Colors.white70,fontSize: 16,),
                  ),
                ),
                const SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}