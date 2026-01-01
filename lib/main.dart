import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'mapa.dart'; // 👈 Importamos la pantalla del mapa

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  final List<Map<String, dynamic>> items = [
    {
      "img": "assets/afiches/sucreton.jpg",
      "info": "https://ejemplo.com/info1",
      "redes": {
        "whatsapp": null,
        "facebook": null,
        "tiktok": null,
      }
    },
    {
      "img": "assets/images/2do.jpg",
      "info": null,
      "redes": {
        "whatsapp": null,
        "facebook": null,
        "tiktok": null,
      }
    },
    {
      "img": "assets/images/3ro.jpg",
      "info": null,
      "redes": {
        "whatsapp": null,
        "facebook": null,
        "tiktok": null,
      }
    },
  ];

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'No se pudo abrir $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/logos/WINFA.png', // 👈 asegúrate que existe
              height: 40,
            ),
            Image.asset(
              'assets/logos/BOLIVIA.png', // 👈 asegúrate que existe
              height: 40,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔹 Slider con controller
            CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                aspectRatio: 16 / 9,
                autoPlay: true,
                enlargeCenterPage: true,
                autoPlayInterval: const Duration(seconds: 7),
                height: 320, // 👈 Altura fija evita overflow
              ),
              items: items.map((item) {
                return SingleChildScrollView(
                  // 👈 evita que desborde
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        item["img"],
                        fit: BoxFit.cover,
                        width: 300.0,
                        height: 180, // 👈 límite de altura
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () => _launchURL(item["info"]),
                        child: const Text('Más Información'),
                      ),
                      const SizedBox(height: 8),
                      // 🔹 Redes sociales
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Image.asset('assets/RRSS/whatsapp.png',
                                height: 30, width: 30),
                            onPressed: () =>
                                _launchURL(item["redes"]["whatsapp"]),
                          ),
                          IconButton(
                            icon: Image.asset('assets/RRSS/facebook.png',
                                height: 30, width: 30),
                            onPressed: () =>
                                _launchURL(item["redes"]["facebook"]),
                          ),
                          IconButton(
                            icon: Image.asset('assets/RRSS/tiktok.png',
                                height: 30, width: 30),
                            onPressed: () =>
                                _launchURL(item["redes"]["tiktok"]),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            ),

            // 🔹 Botones de control del carrusel
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => _carouselController.previousPage(),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () => _carouselController.nextPage(),
                ),
              ],
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () =>
                  _launchURL('https://forms.gle/MMCdpTsqs8KwvmJeA'),
              child: const Text('Únete a nosotros'),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MapaPage()),
                );
              },
              child: const Text('Abrir Mapa'),
            ),

            const SizedBox(height: 20),

            const Text(
              'Productos y Servicios',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            // 🔹 Grid de imágenes
            SizedBox(
              height: 300, // 👈 altura fija
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                children: const [
                  Image(
                      image: AssetImage('assets/images/1ro.jpg'),
                      fit: BoxFit.cover),
                  Image(
                      image: AssetImage('assets/images/2do.jpg'),
                      fit: BoxFit.cover),
                  Image(
                      image: AssetImage('assets/images/3ro.jpg'),
                      fit: BoxFit.cover),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
