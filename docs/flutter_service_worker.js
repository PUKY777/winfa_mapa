'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "30e25717427e306fe8ec66a0341aacb2",
"assets/AssetManifest.bin.json": "351e6f08ddf5ad9d4084ca17f3f45ce6",
"assets/AssetManifest.json": "040b990fea3727a2f7a4a7823ed4c2e6",
"assets/assets/afiches/Afiche_Ermita.jpeg": "9b266f574c0a8f7900db49a074c4a39e",
"assets/assets/afiches/dream_festival.jpeg": "fb4d1c14ec9a232afd625db4a1ba1a54",
"assets/assets/afiches/festival_gastro.jpg": "e5dda174a01e67e6bed39628191fc75e",
"assets/assets/afiches/fexposucre2024.jpg": "a807b99e8f577d6abec559e74664e619",
"assets/assets/afiches/sucreton.jpg": "055b297d78dda9b4d69f3ee2689a4a05",
"assets/assets/fachadas/Aeropuerto.jpg": "234183591e47c5e24bf7593e4a0d492f",
"assets/assets/fachadas/BobaBlue.png": "36fc65b712bc2c1c5f96ba8ce748e433",
"assets/assets/fachadas/BokaDogs.png": "b0e863b3b623793f6dfc9154e3f27fbc",
"assets/assets/fachadas/CalleDeLosGatos.jpg": "08191176bc43a66ea0ec280e9a8877e3",
"assets/assets/fachadas/Casa%2520de%2520la%2520libertad.jpg": "f3253afb6693feeefb2bd205f7c8e852",
"assets/assets/fachadas/ConyChips.png": "90d1d0ea8be3440ed20eade0252b0e33",
"assets/assets/fachadas/edificio%2520cementerio.jpg": "41b49e51b9e6c4151029c603d35a5afa",
"assets/assets/fachadas/edificio%2520cretacico.jpg": "e5e4bcb4bbd3892b948ee53addc9bad2",
"assets/assets/fachadas/edificio%2520emapa.jpg": "0abafb765aafe9b3e34c4b24e981e204",
"assets/assets/fachadas/Edificio%2520INE.jpg": "461bebb2cd02ac9c6240a9865ac31866",
"assets/assets/fachadas/Edificio%2520Para%2520ti.png": "26ca615bc1ad09feeac63371c9ec6def",
"assets/assets/fachadas/edificio%2520senasag.jpg": "0bc59e6cde7297a3baef8ef3d6fc6fd4",
"assets/assets/fachadas/edificio%2520sure%25C3%25B1a.jpg": "009710bfdcbee27b93bee2d06f229c6d",
"assets/assets/fachadas/edificio%2520usfx.jpg": "b4cb00eb95b9b2568568487c42be4798",
"assets/assets/fachadas/edificio_cainco.jpg": "88a8271b5ce3f0256dc8a107c1941191",
"assets/assets/fachadas/edificio_fepch.png": "bf0a2f7e987c7251e2a36652b5edd853",
"assets/assets/fachadas/edificio_gadch.png": "86bf7a71b62aea92dafe450c3b1e2d6f",
"assets/assets/fachadas/edificio_gams.jpg": "fd0168930a6b3ac3e65f53724017fa0c",
"assets/assets/fachadas/edificio_senapi.png": "5a4cfea768e140915dd2f98d91ba745c",
"assets/assets/fachadas/edificio_sib.jpg": "6bd930606707a6a5c327f2cae5ba2f42",
"assets/assets/fachadas/edificio_sib.png": "2cf8dba79077f373115388f1d7f43e7d",
"assets/assets/fachadas/edificio_usfx.jpg": "94581d80b265151bdd53614e922e9adf",
"assets/assets/fachadas/fuente%2520bicentenrio.jpg": "4c799c9e63068b53f8997f73ec4ae6db",
"assets/assets/fachadas/parati.jpg": "4bc330129af4be8b481263d6d57f84be",
"assets/assets/fachadas/ParqueBolivar.png": "b6b292de290c5242b8475bec9519bbbc",
"assets/assets/fachadas/plaza%252025%2520de%2520mayo.jpg": "6ad8b78675c732a6242feab836c564d0",
"assets/assets/fachadas/recoleta.jpg": "6605cdb1e9a9984dec7d0549b0b0a767",
"assets/assets/fachadas/RegistrosInscripcionesUsfx.jpg": "d565c5de6648bfcc3f4efbe56cfcef9b",
"assets/assets/fachadas/SEGIP.jpg": "b88a6186680ff121dd5ab9d25cc8a5c0",
"assets/assets/fachadas/senasag.jpg": "b417f88aef6dbf9d678e016a4836f825",
"assets/assets/fachadas/ServiciosAcademicosUsfx.jpg": "66a527d61911f391f055a33bd5c3dbf1",
"assets/assets/fachadas/Tintamayu.jpg": "4bdae63322ce44714fa6983037d5bd39",
"assets/assets/fachadas/Torre%2520Eiffel.jpg": "b7d627a89f11de8abf82e1f4981f15c7",
"assets/assets/fachadas/Wow.png": "f911c33acec2395b37bd7f1df514d195",
"assets/assets/images/1ro.jpg": "aa11a91282eef8ce2ed5df12e06e43b7",
"assets/assets/images/2do.jpg": "a307a3b43396e39128d5ed6b260c7a08",
"assets/assets/images/3ro.jpg": "a4fe35815fcb6b6c3b1a51d2f0e5c0d3",
"assets/assets/images/BOLIVIA.png": "d9bd0fe4bdcc7e565b4a243adfc192a5",
"assets/assets/images/LOGOWINFA.png": "12fd0f4d186556b8b6e0574b56f825b3",
"assets/assets/images/WINFA.png": "b7b8bd0191843c8ee131f5f7cfa7bc99",
"assets/assets/logos/Amorocha.jpg": "d9f5f2090cb168164690850d591d5b16",
"assets/assets/logos/Aromatizate.jpg": "42302cfbc95635c3a984580a164b0481",
"assets/assets/logos/Asaderos%2520Vallejos.jpeg": "50c4afb19f90311a50211f1c25803268",
"assets/assets/logos/Biancopuro.jpg": "d71498c8d2354e21baba358659f66bab",
"assets/assets/logos/Bienmesabe.jpg": "ac31a8245b18297e829d2e6bd2501a9f",
"assets/assets/logos/Bolivia%2520Gastronomica%2520Sucre.jpg": "4a0897f0516c147328256941cb479dab",
"assets/assets/logos/BOLIVIA.png": "d9bd0fe4bdcc7e565b4a243adfc192a5",
"assets/assets/logos/C'kopas-Sky.jpg": "f438fe56f4876a91ba12666a8728c372",
"assets/assets/logos/CACH.png": "a20dfe2bb5ecb47c6fc487f4aa8e10c2",
"assets/assets/logos/CADECH.png": "62a6537d8e09bed7e9bca9e8ac6a8c8c",
"assets/assets/logos/Caf%25C3%25A9%2520Valentino.jpg": "b75c20a53b8c762fef1f49248677a867",
"assets/assets/logos/Cafeter%25C3%25ADa%2520Q'%2520Chalita.jpg": "af7ce0e28d4d62874298cb7184e32e7f",
"assets/assets/logos/CAINCO.png": "0fcdc51977b1819ac954880cad9b7494",
"assets/assets/logos/Carnes%2520y%2520Fuego.jpg": "039c3212a097aede300c1e7f598498b1",
"assets/assets/logos/Casa%2520Grande.jpg": "3a788cb92450581594c9439162eb62a8",
"assets/assets/logos/Cayanas.png": "b6233b4915143e3916b38e72c1318d92",
"assets/assets/logos/CEJC.jpg": "8d2a3795c2ff21c059b1cce1d6c90ceb",
"assets/assets/logos/CEPI.png": "1a77341c0758ed766308e6ed220352e9",
"assets/assets/logos/cic.jpg": "e071da454d2f48326c012b3c1847e728",
"assets/assets/logos/Ciudad%2520Blanca.jpg": "df5c7de634d517df9f839109c41c04d2",
"assets/assets/logos/Clandesttino.jpg": "8b701cd69b14027e2cba6ba8001fff9d",
"assets/assets/logos/comun%2520v7.jpg": "1f5b9e57af3473d97d1ad46517198c4e",
"assets/assets/logos/ConAmor.jpg": "2eccb80868578caeeeb939460fc17204",
"assets/assets/logos/cony%2520chips.png": "5b5609878bbcc05c2bd3952701f36b25",
"assets/assets/logos/Correo%2520del%2520Sur.jpg": "e7a8d468a4413e8c32f4a2f04d29813e",
"assets/assets/logos/Del%2520Molle.jpg": "e7bec48a641793471e10fc1564340087",
"assets/assets/logos/Del%2520R%25C3%25ADo%2520Resto%2520Bar.jpg": "ea902746aa3666e84921e889364de5f2",
"assets/assets/logos/descarga.png": "189525ef3efc80cf20d465385b02dc42",
"assets/assets/logos/DIANASPA.jpg": "cd7e8f497882662868f9d7febc7d8ff5",
"assets/assets/logos/DiningExperience.jpg": "89538e721ff07e09c5b03cfb2f6038e2",
"assets/assets/logos/DinoRex.jpg": "638ca0477988080fdaf3bbd45abf1f0f",
"assets/assets/logos/DoraditosChicken.jpg": "94f8d39fbeab767304905720238218a0",
"assets/assets/logos/DuendesPizza.jpg": "a8ea752bf32e2480845d90cfb58aefb2",
"assets/assets/logos/EMAS.jpg": "de1d5b6ea6da4354793abcdcf53aa522",
"assets/assets/logos/EMAS.png": "1a870a93192a6825323068c8b7eeaf48",
"assets/assets/logos/EntreCubiertos.jpg": "f5e79a22e65562eb960d53feebcdf8fb",
"assets/assets/logos/FEPCH.png": "181b49686e3f7a2f339214c9759c662b",
"assets/assets/logos/FEXPO.png": "b53f2f24165c5875344940abb9898a34",
"assets/assets/logos/FJV.png": "c44e14af6ccac25c4cec8393856a7ac0",
"assets/assets/logos/FogoGrill.jpg": "6ee75b373ea07d160c14249fdfc4cbc0",
"assets/assets/logos/Forest.jpg": "bd257aa4838b1d33456865a98abf1617",
"assets/assets/logos/FORSETI.jpg": "870877096e570eccced92faab44a537f",
"assets/assets/logos/GADCH.png": "0371b57fda447f1e5681de8ea83a3c46",
"assets/assets/logos/Gamasur.jpg": "83d3a290c2a0065ffe98ce9d8734bd24",
"assets/assets/logos/GAMS.png": "e5fcf60dcc56f12f78df5dbf7a0f0dba",
"assets/assets/logos/Gigantograf%25C3%25ADasChiriGraf.jpg": "d98f3d61c576fb33462be1919ddab997",
"assets/assets/logos/Greenrooftop.jpg": "6816f5d3dd1a82b36f416ddba263ae77",
"assets/assets/logos/Hambukas.jpg": "33ccd81d54211bf99f6e564605ac3762",
"assets/assets/logos/IGA.jpg": "3e5fb75edc6c1bc03ce0d3430e3cbf16",
"assets/assets/logos/IN.png": "e9f29942b3019dca5cfb41767d33a42c",
"assets/assets/logos/ITEC.jpg": "697ce1cb48140597e7dc2b6297038145",
"assets/assets/logos/jaranadisco.jpg": "8a109ec1c94832e43114d4bea1a39a47",
"assets/assets/logos/KachitaSpa.jpg": "27a80e3fd5e099bc6e420cf13f04d542",
"assets/assets/logos/Kaiseki.jpg": "a2550610781233bf79eedb303dc3eff4",
"assets/assets/logos/Kropka.jpg": "d97f168e38b57586c51e91f8320a4d07",
"assets/assets/logos/KYOTTO.jpg": "cbb70d73b63c0c4659f916530926f9c8",
"assets/assets/logos/LaCampi%25C3%25B1a.jpg": "cec5e5d0a9525971c002466b0ec89fc6",
"assets/assets/logos/LaCopa.jpg": "c8893f251aa6858d77ec4c4cc1664ce3",
"assets/assets/logos/LaCulta.jpg": "c8e3ae8b591c1f59b9e7ce4753c2a7c2",
"assets/assets/logos/LaKABRA.jpg": "3f157450704d0ba2835c04b29c8e211c",
"assets/assets/logos/LaMaisonDeco.jpg": "e197442caefeb225487d3aa4afd2b2b6",
"assets/assets/logos/LaMaja.jpg": "faa750e641257f3078cb10e660aba52e",
"assets/assets/logos/LANASCiudadBlanca.jpg": "c8107222d07d7e3329bfa4cd620844dd",
"assets/assets/logos/LaNona.jpg": "b7a86d2150bd4611dbd52de0d335994b",
"assets/assets/logos/LaPolonesa.jpg": "52a445975e4ea6787435eabaf07758c6",
"assets/assets/logos/LasFlamas.jpg": "0e9f9262c2df9576a2805fc42bbcbd72",
"assets/assets/logos/LaTERZA.jpg": "f024ea2d10878800af87d3db7b7fa5c4",
"assets/assets/logos/LaVecindadUrbanFood.jpg": "6402e4ee861e829ce62e491715bcb126",
"assets/assets/logos/LeBoucherAhumados.jpg": "d7fd10600ac8d9129889dc159f1f5426",
"assets/assets/logos/LocospPorLasTablitasExpress.jpg": "367fc5c2df1d1e52fcf2acf684bc90e4",
"assets/assets/logos/logo.png": "1c5665751b80b4f7a8203465c3f8df0a",
"assets/assets/logos/MariaBauer.jpg": "d195202e266064fa580036e64d5b61da",
"assets/assets/logos/MiAmigoFeliz.jpg": "41321602b084dc872ff5809b688baf4f",
"assets/assets/logos/MOVA.png": "63a3463c82ff5954879b1f464a9014b1",
"assets/assets/logos/Mr.B.jpg": "eb054c5fc8e9ff357295a0e6418bf555",
"assets/assets/logos/OnHotelBoutique.png": "6281f83d76cead843a55f95682a229af",
"assets/assets/logos/OpticaOrozco.jpg": "0bc097a944950048524c1281a7e6ac57",
"assets/assets/logos/Pepa%25C3%2591awy.jpg": "18c86e9cb32ab63dbcfa291023b62620",
"assets/assets/logos/PizzaPremier.jpg": "ee93ef28a4d422e69ead96c0120ee7a7",
"assets/assets/logos/PJV.png": "12ae5b42aa82fe6bcadafb0cfd19fe89",
"assets/assets/logos/PopChicken.jpg": "eda983f9168fa02f05722b40d1d1f2ba",
"assets/assets/logos/PPLEY.jpg": "04f4ca39a69a0aa436bec14e8cbb13f2",
"assets/assets/logos/Rapsodia.jpg": "2b5607db8e8261ee2bac0aa75b9875ea",
"assets/assets/logos/RestoBarChuruquella.jpg": "ab194efb6fe75be4957952d32b8d57b2",
"assets/assets/logos/RoacafFastFood.jpg": "985c007cdf61111f05a9202473fcd366",
"assets/assets/logos/RustiPapas.jpg": "91fa63fcdefbbf32a6c7f0d9ccd2bf6c",
"assets/assets/logos/Salchiquesos%2520.jpg": "54d157b242d68eda8eeb90332065c540",
"assets/assets/logos/SALVIETTI.png": "8001f87c0cba4d2dc10f224e409e2f0f",
"assets/assets/logos/SantaPacha.jpg": "6c4f9b78c30149891c4099cab616ca9b",
"assets/assets/logos/SEDES.png": "f2e10b82e5e66f9d063819a9e01abb53",
"assets/assets/logos/SEGIP.png": "df8a4bff826066408420b3120cd6391e",
"assets/assets/logos/SENAPI.png": "86fe96a7171a037d10949833c9e83528",
"assets/assets/logos/SENASAG.png": "f25768728ce1cc8ae46a2db20310b5ee",
"assets/assets/logos/SIB.png": "255dea571843b4415cf5b9dd100fec7b",
"assets/assets/logos/Sociedad%2520de%2520Estudios%2520Hist%25C3%25B3ricos%2520y%2520Patrimoniales,%2520Chuquisaca.jpg": "a47084f6a68ceed259c78df3ecea1ca2",
"assets/assets/logos/Sucr%25C3%25A9.jpg": "793d3a2101fd41a76476ee0f80ac35bd",
"assets/assets/logos/Sumaj%2520Wasi.jpg": "2cdabfeb958432107a93d3ca52069b91",
"assets/assets/logos/Sweet%2520Forest.jpg": "99c41e8a16b408d5ec50b66456bdc12e",
"assets/assets/logos/TioPollo.jpg": "3ea9ed7d1db41b9c64cc5ece4a5cb1cd",
"assets/assets/logos/TuTumas.jpg": "49ced95743aa2d1f1957e6d2daec0083",
"assets/assets/logos/usfx.png": "8f319c6b282293f3e5b02f1fd6e112b0",
"assets/assets/logos/WINFA.png": "b7b8bd0191843c8ee131f5f7cfa7bc99",
"assets/assets/logos/WOWcoffee.jpg": "24b04f0bb83799a13f6a0e5ea54e0188",
"assets/assets/RRSS/compartir.png": "a6c2b34f180a256188c0824551983c69",
"assets/assets/RRSS/facebook.png": "327ffc81ef4463d8afe6e060c381110c",
"assets/assets/RRSS/instagram.png": "e9482c5b59ed6a5b6e65e61d539f24c7",
"assets/assets/RRSS/pagina.png": "677c1161f80f03f7fc66669553fa2488",
"assets/assets/RRSS/qr.png": "d7303a1c6e2a86188a468e0bc883eb54",
"assets/assets/RRSS/tiktok.png": "bd9e53cc31c36030e3722ec75cfa4c2e",
"assets/assets/RRSS/whatsapp.png": "125b9a1570384e53a4c9ab7c8842b977",
"assets/assets/RRSS/youtube.png": "f7d34451834779581bf600fbd72addca",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "55383e3dda04bfae5c36c4edd2b4e2fc",
"assets/NOTICES": "9dacc0fa4a4827e84b2fd9fd9c0522de",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "89850ed2a49d4a248a89c824d149e1f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "ef15ac1e04153d43edd5655c762edfd0",
"/": "ef15ac1e04153d43edd5655c762edfd0",
"main.dart.js": "56e34cd66117ce8fa6517fdbad315c95",
"manifest.json": "1e7343a1dfe9ebde5db8e980a6f8326c",
"version.json": "4ebb1f029ada142ddabdf79949aeaf95"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
