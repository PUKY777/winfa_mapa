import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({super.key});

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  GoogleMapController? mapController;
  LatLng? ubicacionActual;

  Map<String, bool> filtros = {
    "Agricultura": true,
    "Manufactura": true,
    "Servicios": true,
  };

  final Map<String, List<Map<String, dynamic>>> marcadores = {
    "Agricultura": [],
    "Manufactura": [],
    "Servicios": [
      {
        "nombre": "Casa de la Libertad",
        "sigla": "CasaLibertad",
        "latitud": -19.047582,
        "longitud": -65.260212,
        "direccion": "Calle 25 de Mayo",
        "foto": "assets/fachadas/Casa de la libertad.jpg",
        "horario": {
          "Lunes": "00:00 - 24:00",
          "Martes": "00:00 - 24:00",
          "Miércoles": "00:00 - 24:00",
          "Jueves": "00:00 - 24:00",
          "Viernes": "00:00 - 24:00",
          "Sábado": "00:00 - 24:00",
          "Domingo": "00:00 - 24:00",
        },
        "origen": "Sucre - Chuquisaca - Bolivia",
        "videopresentacion": "https://vm.tiktok.com/ZM6CKLby8/",
        "facebook": null,
        "whatsapp": null,
        "tiktok": null,
        "sitioWeb": null,
      },
      {
        "nombre": "Parque Bolívar",
        "sigla": "ParqueBolivar",
        "latitud": -19.042084,
        "longitud": -65.262295,
        "direccion": "Av. Hernando Siles esq. Pilinco",
        "foto": "assets/fachadas/ParqueBolivar.png",
        "horario": {
          "Lunes": "00:00 - 24:00",
          "Martes": "00:00 - 24:00",
          "Miércoles": "00:00 - 24:00",
          "Jueves": "00:00 - 24:00",
          "Viernes": "00:00 - 24:00",
          "Sábado": "00:00 - 24:00",
          "Domingo": "00:00 - 24:00",
        },
        "origen": "Sucre - Chuquisaca - Bolivia",
        "videopresentacion": "https://vm.tiktok.com/ZM6Qp3rvd/",
        "facebook": null,
        "whatsapp": null,
        "tiktok": null,
        "sitioWeb": null,
      },
    ],
  };

  @override
  void initState() {
    super.initState();
    obtenerUbicacion();
  }

  Future<void> obtenerUbicacion() async {
    bool servicio = await Geolocator.isLocationServiceEnabled();
    if (!servicio) return;

    LocationPermission permiso = await Geolocator.checkPermission();
    if (permiso == LocationPermission.denied) {
      permiso = await Geolocator.requestPermission();
      if (permiso == LocationPermission.denied) return;
    }

    Position posicion = await Geolocator.getCurrentPosition();
    setState(() {
      ubicacionActual = LatLng(posicion.latitude, posicion.longitude);
    });
  }

  Set<Marker> obtenerMarcadores() {
    Set<Marker> todos = {};
    filtros.forEach((grupo, visible) {
      if (visible) {
        for (var marcador in marcadores[grupo]!) {
          todos.add(
            Marker(
              markerId: MarkerId(marcador["sigla"]),
              position: LatLng(marcador["latitud"], marcador["longitud"]),
              infoWindow: InfoWindow(
                title: '', // vacío
                snippet: '', // vacío
              ),
              onTap: () => mostrarDetalles(marcador),
            ),
          );
        }
      }
    });
    return todos;
  }

  void mostrarDetalles(Map<String, dynamic> marcador) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(marcador["nombre"],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Image.asset(marcador["foto"], fit: BoxFit.cover),
                const SizedBox(height: 8),
                Text("Dirección: ${marcador["direccion"]}"),
                Text("Origen: ${marcador["origen"]}"),
                const SizedBox(height: 8),
                const Text("Horario:",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ...marcador["horario"].entries.map((e) => Text(
                      "${e.key}: ${e.value}",
                      style: const TextStyle(fontSize: 14),
                    )),
                const SizedBox(height: 10),
                if (marcador["videopresentacion"] != null)
                  ElevatedButton.icon(
                    onPressed: () =>
                        _abrirUrl(Uri.parse(marcador["videopresentacion"])),
                    icon: const Icon(Icons.play_circle_fill),
                    label: const Text("Video presentación"),
                  ),
                const SizedBox(height: 10),

                // 🔹 Redes sociales con .png
                Row(
                  children: [
                    if (marcador["facebook"] != null)
                      IconButton(
                        onPressed: () =>
                            _abrirUrl(Uri.parse(marcador["facebook"])),
                        icon: Image.asset(
                          "assets/facebook.png",
                          width: 32,
                          height: 32,
                        ),
                      ),
                    if (marcador["whatsapp"] != null)
                      IconButton(
                        onPressed: () =>
                            _abrirUrl(Uri.parse(marcador["whatsapp"])),
                        icon: Image.asset(
                          "assets/whatsapp.png",
                          width: 32,
                          height: 32,
                        ),
                      ),
                    if (marcador["tiktok"] != null)
                      IconButton(
                        onPressed: () =>
                            _abrirUrl(Uri.parse(marcador["tiktok"])),
                        icon: Image.asset(
                          "assets/tiktok.png",
                          width: 32,
                          height: 32,
                        ),
                      ),
                    if (marcador["sitioWeb"] != null)
                      IconButton(
                        onPressed: () =>
                            _abrirUrl(Uri.parse(marcador["sitioWeb"])),
                        icon: Image.asset(
                          "assets/pagina.png",
                          width: 32,
                          height: 32,
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () => compartirUbicacion(
                      marcador["nombre"],
                      marcador["latitud"].toString(),
                      marcador["longitud"].toString()),
                  icon: const Icon(Icons.share),
                  label: const Text("Compartir"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _abrirUrl(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('No se pudo abrir $url');
    }
  }

  void compartirUbicacion(String nombre, String lat, String lng) async {
    final enlace = "https://www.google.com/maps?q=$lat,$lng ($nombre)";
    final whatsappUrl = Uri.parse(
        "https://api.whatsapp.com/send?text=${Uri.encodeComponent(enlace)}");
    await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mapa Interactivo")),
      body: ubicacionActual == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: ubicacionActual!,
                    zoom: 15,
                  ),
                  mapType: MapType.hybrid,
                  markers: obtenerMarcadores(),

                  // 🚫 Quitar todos los controles y marcadores predeterminados
                  zoomControlsEnabled: false,
                  myLocationButtonEnabled: false,
                  mapToolbarEnabled: false,
                  compassEnabled: false,
                  myLocationEnabled: false,
                  trafficEnabled: false,
                  indoorViewEnabled: false,
                  buildingsEnabled: false,

                  // ✅ Aplica estilo moderno (sin POIs ni labels locales)
                  style: '''
                  [
                    {
                      "featureType": "poi",
                      "stylers": [{ "visibility": "off" }]
                    },
                    {
                      "featureType": "transit",
                      "stylers": [{ "visibility": "off" }]
                    },
                    {
                      "featureType": "road.local",
                      "elementType": "labels",
                      "stylers": [{ "visibility": "off" }]
                    }
                  ]
                  ''',
                ),

                // ✅ Filtros personalizados
                Positioned(
                  top: 10,
                  left: 10,
                  child: Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: filtros.keys.map((grupo) {
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Checkbox(
                                value: filtros[grupo],
                                onChanged: (valor) {
                                  setState(() => filtros[grupo] = valor!);
                                },
                              ),
                              Text(grupo),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
