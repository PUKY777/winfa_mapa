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
      {
        "nombre": "Fuente Bicentenario",
        "sigla": "FuenteBicentenario",
        "latitud": -19.0411727,
        "longitud": -65.2653485,
        "direccion": "Kilometro 7 (plaza aniceto arce)",
        "foto": "assets/fachadas/FuenteBicentenario.png",
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
        "videopresentacion": null,
        "facebook": null,
        "whatsapp": null,
        "tiktok": null,
        "sitioWeb": null,
      },
      {
        "nombre": "La Rotonda",
        "sigla": "LaRotonda",
        "latitud": -19.039371,
        "longitud": -65.264385,
        "direccion": "Ladislao Cabrera",
        "foto": "assets/fachadas/LaRotonda.png",
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
        "videopresentacion": null,
        "facebook": null,
        "whatsapp": null,
        "tiktok": null,
        "sitioWeb": null,
      },
      {
        "nombre": "Parque del Bicentenario",
        "sigla": "ParqueDelBicentenario",
        "latitud": -19.042084,
        "longitud": -65.262295,
        "direccion": "",
        "foto": "assets/fachadas/ParqueDelBicentenario.png",
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
        "videopresentacion": null,
        "facebook": null,
        "whatsapp": null,
        "tiktok": null,
        "sitioWeb": null,
      },
      {
        "nombre": "Parque Infantil Litoral",
        "sigla": "ParqueInfantilLitoral",
        "latitud": -19.039542,
        "longitud": -65.240537,
        "direccion": "Estados Unidos - Cuba",
        "foto": "assets/fachadas/ParqueInfantilLitoral.png",
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
        "videopresentacion": null,
        "facebook": null,
        "whatsapp": null,
        "tiktok": null,
        "sitioWeb": null,
      },
      {
        "nombre": "Parque Libertadores",
        "sigla": "ParqueLibertadores",
        "latitud": -19.040926,
        "longitud": -65.239871,
        "direccion": "C. San Martin - Santa Lucia",
        "foto": "assets/fachadas/ParqueLibertadores.png",
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
        "videopresentacion": null,
        "facebook": null,
        "whatsapp": null,
        "tiktok": null,
        "sitioWeb": null,
      },
      {
        "nombre": "Parque Mariscal Antonio Jose de Sucre A",
        "sigla": "ParqueA",
        "latitud": -19.028793,
        "longitud": -65.262414,
        "direccion": "Av. Miguel Peredo Argandona",
        "foto": "assets/fachadas/ParqueA.png",
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
        "videopresentacion": null,
        "facebook": null,
        "whatsapp": null,
        "tiktok": null,
        "sitioWeb": null,
      },
      {
        "nombre": "Parque Mariscal Antonio Jose de Sucre B",
        "sigla": "ParqueB",
        "latitud": -19.0280444,
        "longitud": -65.2607752,
        "direccion": "Av. Miguel Peredo Argandona",
        "foto": "assets/fachadas/ParqueB.png",
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
        "videopresentacion": null,
        "facebook": null,
        "whatsapp": null,
        "tiktok": null,
        "sitioWeb": null,
      },
      {
        "nombre": "Parque Multipropósito",
        "sigla": "ParqueMultipropósito",
        "latitud": -19.034552,
        "longitud": -65.268612,
        "direccion": "",
        "foto": "assets/fachadas/ParqueMultipropósito.png",
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
        "videopresentacion": null,
        "facebook": null,
        "whatsapp": null,
        "tiktok": null,
        "sitioWeb": null,
      },
      {
        "nombre": "Parque Simon Bolivar",
        "sigla": "ParqueSimonBolivar",
        "latitud": -19.042059,
        "longitud": -65.262293,
        "direccion": "Esq. Pilinco, Venezuela Avenue)",
        "foto": "assets/fachadas/ParqueSimonBolivar.png",
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
        "videopresentacion": null,
        "facebook": null,
        "whatsapp": null,
        "tiktok": null,
        "sitioWeb": null,
      },
      {
        "nombre": "Parque Villa Margarita",
        "sigla": "ParqueVillaMargarita",
        "latitud": -19.017565,
        "longitud": -65.251669,
        "direccion": "",
        "foto": "assets/fachadas/ParqueVillaMargarita.png",
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
        "videopresentacion": null,
        "facebook": null,
        "whatsapp": null,
        "tiktok": null,
        "sitioWeb": null,
      },
      {
        "nombre": "Plaza 25 de Mayo",
        "sigla": "Plaza25DeMayo",
        "latitud": -19.047883,
        "longitud": -65.259599,
        "direccion": "Plaza 25 de Mayo",
        "foto": "assets/fachadas/Plaza25DeMayo.png",
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
        "videopresentacion": null,
        "facebook": null,
        "whatsapp": null,
        "tiktok": null,
        "sitioWeb": null,
      },
      {
        "nombre": "Plaza Alto de la Alianza",
        "sigla": "PlazaAltodelaAlianza",
        "latitud": -19.038598,
        "longitud": -65.253788,
        "direccion": "Av. Jaime Mendoza - Junin",
        "foto": "assets/fachadas/PlazaAltodelaAlianza.png",
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
        "videopresentacion": null,
        "facebook": null,
        "whatsapp": null,
        "tiktok": null,
        "sitioWeb": null,
      },
      {
        "nombre": "Plaza Aniceto Arce",
        "sigla": "PlazaAnicetoArce",
        "latitud": -19.040665,
        "longitud": -65.265768,
        "direccion": "Ladislao Cabrera",
        "foto": "assets/fachadas/PlazaAnicetoArce.png",
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
        "videopresentacion": null,
        "facebook": null,
        "whatsapp": null,
        "tiktok": null,
        "sitioWeb": null,
      },
      {
        "nombre": "Plaza Azurduy",
        "sigla": "PlazaAzurduy",
        "latitud": -19.044960,
        "longitud": -65.241164,
        "direccion": "Santa Lucia",
        "foto": "assets/fachadas/PlazaAzurduy.png",
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
        "videopresentacion": null,
        "facebook": null,
        "whatsapp": null,
        "tiktok": null,
        "sitioWeb": null,
      },
      {
        "nombre": "Plaza Hermandad",
        "sigla": "PlazaHermandad",
        "latitud": -19.038500,
        "longitud": -65.242526,
        "direccion": "Av. Emilio Mendizabal - Destamento 317",
        "foto": "assets/fachadas/PlazaHermandad.png",
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
        "videopresentacion": null,
        "facebook": null,
        "whatsapp": null,
        "tiktok": null,
        "sitioWeb": null,
      },
      {
        "nombre": "Plaza Maria J. Mujia",
        "sigla": "PlazaMariaJ.Mujia",
        "latitud": -19.053660,
        "longitud": -65.267093,
        "direccion": "J. M. Linares",
        "foto": "assets/fachadas/PlazaMariaJ.Mujia.png",
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
        "videopresentacion": null,
        "facebook": null,
        "whatsapp": null,
        "tiktok": null,
        "sitioWeb": null,
      },
      {
        "nombre": "Plaza Maximo y Felix Villagarra Morales",
        "sigla": "PlazaMaximoyFelixVillagarraMorales",
        "latitud": -19.030111,
        "longitud": -65.258871,
        "direccion": "Gregorio Pacheco - Laguna Chuquisaca",
        "foto": "assets/fachadas/PlazaMaximoyFelixVillagarraMorales.png",
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
        "videopresentacion": null,
        "facebook": null,
        "whatsapp": null,
        "tiktok": null,
        "sitioWeb": null,
      },
      {
        "nombre": "Plaza Oscar Crespo",
        "sigla": "PlazaOscarCrespo",
        "latitud": -19.054979,
        "longitud": -65.262742,
        "direccion": "Av. Chuquisaca",
        "foto": "assets/fachadas/PlazaOscarCrespo.png",
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
        "videopresentacion": null,
        "facebook": null,
        "whatsapp": null,
        "tiktok": null,
        "sitioWeb": null,
      },
      {
        "nombre": "Plaza Pedro de Anzurez",
        "sigla": "PlazaPedrodeAnzurez",
        "latitud": -19.054527,
        "longitud": -65.253988,
        "direccion": "Dalence esq. Polanco",
        "foto": "assets/fachadas/PlazaPedrodeAnzurez.png",
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
        "videopresentacion": null,
        "facebook": null,
        "whatsapp": null,
        "tiktok": null,
        "sitioWeb": null,
      },
      {
        "nombre": "Plaza Puca Puca",
        "sigla": "PlazaPucaPuca",
        "latitud": -19.026495,
        "longitud": -65.253181,
        "direccion": "Camargo – C1",
        "foto": "assets/fachadas/PlazaPucaPuca.png",
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
        "videopresentacion": null,
        "facebook": null,
        "whatsapp": null,
        "tiktok": null,
        "sitioWeb": null,
      },
      {
        "nombre": "Plaza Rafael Garcia Rosquella",
        "sigla": "PlazaRafaelGarciaRosquella",
        "latitud": -19.054210,
        "longitud": -65.262787,
        "direccion": "Trinidad esq. Bolivar",
        "foto": "assets/fachadas/PlazaRafaelGarciaRosquella.png",
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
        "videopresentacion": null,
        "facebook": null,
        "whatsapp": null,
        "tiktok": null,
        "sitioWeb": null,
      },
      {
        "nombre": "Plaza Simon Rodriguez",
        "sigla": "PlazaSimonRodriguez",
        "latitud": -19.041090,
        "longitud": -65.254428,
        "direccion": "Aniceto Arce - Berdecio",
        "foto": "assets/fachadas/PlazaSimonRodriguez.png",
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
        "videopresentacion": null,
        "facebook": null,
        "whatsapp": null,
        "tiktok": null,
        "sitioWeb": null,
      },
      {
        "nombre": "Plaza Vicente Camargo",
        "sigla": "PlazaVicenteCamargo",
        "latitud": -19.049868,
        "longitud": -65.252198,
        "direccion": "Camargo – C1",
        "foto": "assets/fachadas/PlazaVicenteCamargo.png",
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
        "videopresentacion": null,
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
      {
        "nombre": "Plaza Victorino Gutierrez",
        "sigla": "PlazaVictorinoGutierrez",
        "latitud": -19.052680,
        "longitud": -65.252057,
        "direccion": "Belisario Boeto esq. Fotun",
        "foto": "assets/fachadas/PlazaVictorinoGutierrez.png",
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
        "videopresentacion": null,
        "facebook": null,
        "whatsapp": null,
        "tiktok": null,
        "sitioWeb": null,
      },
      {
        "nombre": "Instituto Nacional de Estadistica",
        "sigla": "I.N.E.",
        "latitud": -19.051729,
        "longitud": -65.260594,
        "direccion": "Calle Bolívar N° 825, entre calles La Paz y Azurduy",
        "foto": "assets/fachadas/Edificio_INE.jpg",
        "horario": {
          "Lunes": "08:30 - 16:30",
          "Martes": "08:30 - 16:30",
          "Miércoles": "08:30 - 16:30",
          "Jueves": "08:30 - 16:30",
          "Viernes": "08:30 - 16:30",
          "Sábado": "00:00 - 24:00",
          "Domingo": "00:00 - 24:00",
        },
        "origen": "Sucre - Chuquisaca - Bolivia",
        "videopresentacion": null,
        "facebook": "https://www.facebook.com/ineboliviaoficial",
        "whatsapp": "https://wa.me/59168106559",
        "tiktok": "https://www.tiktok.com/@ine_bolivia",
        "sitioWeb": "https://www.ine.gob.bo",
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

                // 🔹 Redes sociales con .png
                Row(
                  children: [
                    if (marcador["videopresentacion"] != null)
                      IconButton(
                        onPressed: () =>
                            _abrirUrl(Uri.parse(marcador["videopresentacion"])),
                        icon: Image.asset(
                          "assets/RRSS/videopresentacion.png", // ícono de video
                          width: 32,
                          height: 32,
                        ),
                      ),
                    const SizedBox(height: 10),
                    if (marcador["facebook"] != null)
                      IconButton(
                        onPressed: () =>
                            _abrirUrl(Uri.parse(marcador["facebook"])),
                        icon: Image.asset(
                          "assets/RRSS/facebook.png",
                          width: 32,
                          height: 32,
                        ),
                      ),
                    if (marcador["whatsapp"] != null)
                      IconButton(
                        onPressed: () =>
                            _abrirUrl(Uri.parse(marcador["whatsapp"])),
                        icon: Image.asset(
                          "assets/RRSS/whatsapp.png",
                          width: 32,
                          height: 32,
                        ),
                      ),
                    if (marcador["tiktok"] != null)
                      IconButton(
                        onPressed: () =>
                            _abrirUrl(Uri.parse(marcador["tiktok"])),
                        icon: Image.asset(
                          "assets/RRSS/tiktok.png",
                          width: 32,
                          height: 32,
                        ),
                      ),
                    if (marcador["sitioWeb"] != null)
                      IconButton(
                        onPressed: () =>
                            _abrirUrl(Uri.parse(marcador["sitioWeb"])),
                        icon: Image.asset(
                          "assets/RRSS/pagina.png",
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
