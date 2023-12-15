import 'package:consulta_de_puntos/src/models/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'more.dart';
import 'package:consulta_de_puntos/src/widgets/promo_card.dart';
import 'package:consulta_de_puntos/src/utils/constants.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
    State<HomeScreen> createState() => _HomeScreenState();
}
  
class _HomeScreenState extends State<HomeScreen>{
  int _selectedIndex = 0;
  int _currentCarouselIndex = 0;
  final PageController _pageController = PageController();
  final CarouselController _carouselController = CarouselController();
  final List<String> imgList = [
    'assets/images/wp4.jpg',
    'assets/images/Zelda.png',
    'assets/images/SunsetCat.png',
    'assets/images/StrawHatPirates.png',
    'assets/images/Samurai.jpg',
    'assets/images/Desert.png',
  ];

  void _onItemTapped(int index){
    _pageController.jumpToPage(index);
    }

  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<AuthState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(Config.homeName),
        centerTitle: true,
      ),
      body: PageView(
        controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        children: <Widget>[
          // Home Page
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // Carrusel de Imagenes
                CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentCarouselIndex = index; // Actualiza el índice del carrusel
                      });
                      },
                  ),
                  items: imgList.map((item) => Center(
                    child: ClipRRect(borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(item, fit: BoxFit.cover, width: MediaQuery.of(context).size.width * 0.9),
                      ),
                    )).toList(),
                ),
                // Botones para los Items del Carrusel
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _carouselController.animateToPage(entry.key),
                      child: Container(
                        width: 9.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentCarouselIndex == entry.key
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColor.withOpacity(0.3),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                // Otros widgets para la página Home
                const PromotionTile(
                  title: 'A un paso de ser tuyo',
                  imagePath: 'assets/images/Bridge.png',
                ),
                const PromotionTile(
                  title: 'Oferta Especial',
                  imagePath: 'assets/images/Carro.png',
                ),
                const PromotionTile(
                  title: 'Promocion del Dia',
                  imagePath: 'assets/images/Citynord.png',
                ),
              ],
            ),
          ),
          MorePage(isLoggedIn: authState.isLoggedIn)
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
    );
  }
}