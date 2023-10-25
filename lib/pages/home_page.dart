import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:mb_task5/pages/login_page.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void onTap() {
    Navigator.push(
      context,
      PageTransition(child: const  LoginPage(), type: PageTransitionType.fade),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: const Icon(null),
        backgroundColor: Colors.grey[100],
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        actions: [
          IconButton(
            onPressed: () => onTap(), 
            icon: Icon(
              Icons.shopping_basket_rounded,
              color: Colors.grey[800],
           ),
          ),
        ],
      ),
      body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Доставка еды',
                    style: TextStyle(
                      color: Colors.grey[80],
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        makeCategoryWidget(isActive: true, title: 'Пицца'),
                        makeCategoryWidget(isActive: false, title: 'Комбо'),
                        makeCategoryWidget(isActive: false, title: 'Роллы'),
                        makeCategoryWidget(isActive: false, title: 'Горячее'),
                        makeCategoryWidget(isActive: false, title: 'Паста'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Бесплатная доставка',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ), 
            ),
            Expanded(
              child: Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    makeItemWidget(imagePath: 'assets/001.jpg'),
                    makeItemWidget(imagePath: 'assets/002.jpg'),
                    makeItemWidget(imagePath: 'assets/003.jpg'),
                    makeItemWidget(imagePath: 'assets/004.jpg'),
                    makeItemWidget(imagePath: 'assets/005.jpg')
                  ],
                ),
              )
            ),
            const SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}

  Widget makeCategoryWidget({isActive,title}) {
    return AspectRatio(
      aspectRatio: isActive ? 3 : 2.5 / 1,
      child: Container(
        margin:  const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
        color: isActive ? Colors.yellow[700] : Colors.white,
        borderRadius: BorderRadius.circular(50),
        ),
        child: Align(
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.grey,
              fontSize: 18,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w100,
            ),
          ),
        ),
      ),
    );
  }

  Widget makeItemWidget({imagePath}) {
    return AspectRatio(
      aspectRatio:  1 / 1.5,
      child: GestureDetector(
        child: Container(
          margin:  const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(imagePath), 
              fit: BoxFit.cover
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient (
              begin: Alignment.bottomCenter,
              stops: const [.2 , .9],
              colors: [
               Colors.black.withOpacity(.9),
               Colors.black.withOpacity(.3)
              ],)
            ),
            child: const Padding(
              padding:  EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                        '299 P',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Chto-to',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        )
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
