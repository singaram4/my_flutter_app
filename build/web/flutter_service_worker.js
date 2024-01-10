'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "82f7d81884912fa961078bb1b4a3b7c4",
"index.html": "b4825612022a075d0a69cf2dc0a9b45f",
"/": "b4825612022a075d0a69cf2dc0a9b45f",
"main.dart.js": "548b6b14e20259cf405cdc9dda211bf4",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "66ef5871c3b4421f9abcd213f254ae18",
"assets/AssetManifest.json": "b2aa4abd3932480095dda0af825e3db2",
"assets/NOTICES": "25ff7b56bc59672c6cabca6a1190e145",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "398602ef6386b6646646b9af7af074b4",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/AssetManifest.bin": "78d878af85df2566ef8ca48731094934",
"assets/fonts/MaterialIcons-Regular.otf": "32fce58e2acb9c420eab0fe7b828b761",
"assets/assets/Slide%252020%2520-%2520Pregnancy.png": "4a5faaf94614f487f0d691a37cc36761",
"assets/assets/Slide%25203%2520-%2520Teens.png": "a22bd687a2cdc0cc1cde4256cee1fbcb",
"assets/assets/Slide%252031%2520-%2520Children.png": "bc39cbc64711b09ccef54a0780f00ec0",
"assets/assets/Slide%252021%2520-%2520Pregnancy.png": "9ae6200848de9e165caa4e12228e095f",
"assets/assets/Slide%252028%2520-%2520Infants.png": "0a719845f4722901270bfd132d96fa2e",
"assets/assets/sick_1.png": "dc9a7e58c8ce2b2f4741656d8f39a323",
"assets/assets/sick_3.png": "2ca3319390146251127a42e7bbb6408b",
"assets/assets/Slide%252013%2520-%2520Adults.png": "f44b242acc107b00234df1c7038e8663",
"assets/assets/sick_2.png": "9cc7502286c8cf450760fded77cf34c4",
"assets/assets/sick_6.png": "7af7a186082d1c10fa4bdd082755aba3",
"assets/assets/Lesson1_9.png": "ee22947216585c4b17861cd551f10eda",
"assets/assets/ross.jpg": "4b250a04b925db80e3861c30f48dbd10",
"assets/assets/Frugal.png": "58a2bdcb2c3c5b000bba4e0a490c1291",
"assets/assets/Slide%252035%2520-%2520Food%2520Guides_b.png": "35b4757760ccdc68705d362c8b203ccd",
"assets/assets/Lesson1_8.png": "1b546da962d355f8e0d693e6d499acb7",
"assets/assets/sick_7.png": "dd5f184f3d4e3a63c7e812ae7eb80e53",
"assets/assets/sick_5.png": "a6022e930f397412ec173b7398c97624",
"assets/assets/Slide%252032%2520-%2520Children.png": "19d98961720f66e62f4b39cef04b13bc",
"assets/assets/Lesson3_8.png": "cb2122db37ae1fbf8fca9b7ad65b98f5",
"assets/assets/Lesson3_9.png": "7c84af86b9faecd73b6aeaf11fdcaad6",
"assets/assets/Slide%25204%2520-%2520Teens.png": "f9e35ccfd522de9fb0ade1ffeee42b70",
"assets/assets/sick_4.png": "50e957ef2702a6513fb3a8bc8c2f78ae",
"assets/assets/Senga%2520Module%25201_3.png": "ed415bb1e0471dd117dca932af6a2547",
"assets/assets/Lesson1_10.png": "78b5c4e3130a69525b30db293a4f514c",
"assets/assets/lactation-2.png": "bec6369c5656362856bb5f24a2b96245",
"assets/assets/lactation-3.png": "45174f72704fd6125bc7dc8698de4d9e",
"assets/assets/Lesson3_14.png": "1a6df75671460fd58ea387e8020d8641",
"assets/assets/Senga%2520Module%25202-1.png": "642b5f0e613994925f8b175c7757ae2d",
"assets/assets/hygiene_1.png": "fa6be9fcd5bb1db45417df11d38d1144",
"assets/assets/Slide%252029%2520-%2520Children.png": "e8143cf46aa377af008bc52c8be4cc8a",
"assets/assets/Senga%2520Module%25201_2.png": "e9005a46181e2bddd1c86f2824127a18",
"assets/assets/Hygiene_3.png": "05152c5b5e40e737549b75a50fb1492e",
"assets/assets/Senga%2520Module%25202-3.png": "5eee7bd81a3b293161674ff005b01075",
"assets/assets/Slide%252012%2520-%2520Adults.png": "a9749cf87babb4cfa1b6b5ff87153644",
"assets/assets/lactation-1.png": "4d927d3e31da115d63789b1f28cd6b78",
"assets/assets/Slide%25205%2520-%2520Teens.png": "77b9d3bd2001552b6e4ca13073049737",
"assets/assets/Senga%2520Module%25202-2.png": "90c82b776514aaa44d5a8489ab3e077b",
"assets/assets/hygiene_2.png": "044b1234e72fea1b1b826d3dc2d0d876",
"assets/assets/Slide%252038%2520-%2520Food%2520Guides_b.png": "6dc58dc03798aa7f29bc5c5b5e3403d7",
"assets/assets/Lesson2_8.PNG": "f9f52a35fa136e38e0258499d97296d3",
"assets/assets/Senga%2520Module%25201_5.png": "a1b41bfe9a62737c133de485500e34dd",
"assets/assets/hygiene_6.png": "a157986eed8b7ea94c3fff85e0caa493",
"assets/assets/Senga%2520Module%25202-6.png": "689cd66ae9c709a1ff52aaee0e59c34b",
"assets/assets/Lesson3_13.png": "e15a9b44f0b4e3d34a1309d1f9940ce3",
"assets/assets/lactation-4.png": "031d9e5f2c753fcfe338160cbea15b30",
"assets/assets/lactation-5.png": "3c1ec1822a1f071868165900231af2a4",
"assets/assets/Slide%252037%2520-%2520Food%2520Guides_b.png": "fce73cde9da3a3599b45918c9dce4695",
"assets/assets/Lesson3_12.png": "eb8c92b2af22f66eec334ec94df76171",
"assets/assets/Senga%2520Module%25202-10.png": "ebd08514a8a21a42075b71534f006743",
"assets/assets/Senga%2520Module%25202-7.png": "d7ebfc3568f003a251f4c76fcdfaa446",
"assets/assets/Senga%2520Module%25201_4.png": "2ec0ec3c5aff1024d9ecfda37e5bb4ed",
"assets/assets/Lesson2_9.PNG": "1870c60141487db2796e1a6c6cac454b",
"assets/assets/Senga%2520Module%25201_6.png": "6e91f3f16e2afbec910c6bec04f96802",
"assets/assets/hygiene_5.png": "3cf86ae0f9df777cbaebb9cc54901010",
"assets/assets/Senga%2520Module%25202-5.png": "78bd4525f5db687bb703ea431978c298",
"assets/assets/Lesson3_10.png": "4b8b6a378bfce43152025c4e18ac55c8",
"assets/assets/Slide%252034%2520-%2520Food%2520Guides.png": "1840083c96b853708b091aacf8fe93e3",
"assets/assets/lactation-7.png": "ecc853b237c2b3007c387236bfbf9f6e",
"assets/assets/lactation-6.png": "afd06d52941b557bff8a4c6450b3e43b",
"assets/assets/Lesson3_11.png": "8537d8f136cd4c21f582adb4fe8ad51e",
"assets/assets/Senga%2520Module%25202-4.png": "4f78721630370e2550466bf596523e5b",
"assets/assets/hygiene_4.png": "6191545626d370208f33c6f242f323f7",
"assets/assets/Senga%2520Module%25201_7.png": "b3f92f846d64795a3cefe9737245efea",
"assets/assets/Lesson2_7.PNG": "7d872c5e79a19dfd4603607ed6fbfa3b",
"assets/assets/Senga%2520Module%25202-9.png": "e2ca45ae1e706744af271bb1667f99aa",
"assets/assets/M3S4.png": "eb7e23d13ed775faee0a3d25c922e21e",
"assets/assets/Lesson4_1.png": "41a4cf57f9ed6d9b8c1823f589ae931e",
"assets/assets/Slide%252011%2520-%2520Adults.png": "3836037c6af3e3f1a777d9882558f6c3",
"assets/assets/Slide%252027%2520-%2520Infants.png": "0240b5b51d921aa726af88b1cad2f73e",
"assets/assets/M3S5.png": "d43badff693929214994e31c512ab3c3",
"assets/assets/Senga%2520Module%25202-8.png": "fbd67f2ba58a4005fdd753e14da732d5",
"assets/assets/Lesson2_6.PNG": "46646a5b18b930e691447c4ac55e7f65",
"assets/assets/Lesson2_4.PNG": "033721b789887109e8aa1d6515e03e2f",
"assets/assets/Slide%25202%2520-%2520Table%2520of%2520Contents.png": "22b4e9dec65116e2183415ae765a1ac2",
"assets/assets/Slide%252036%2520-%2520Food%2520Guides_b.png": "fcbf6b5fb1e2310d5fd311b212c5fce4",
"assets/assets/Lesson4_2.png": "d5e8ce9430dde4601011887c8bad7f5e",
"assets/assets/M1S5.png": "05a37e62f5eb0bae74699c5fe1a22386",
"assets/assets/M1S4.png": "668d68d1ed302d70f218377c894fa207",
"assets/assets/Lesson4_3.png": "5a1361d15adca172937a570548c60e43",
"assets/assets/Slide%252022%2520-%2520Infants.png": "ebe824ab7c02df10a1ade81e4c4124d8",
"assets/assets/Slide%25206%2520-%2520Adults.png": "958cd07300488be3a7abb54b056f0a39",
"assets/assets/Lesson2_5.PNG": "ee3e19fb0ae6e2d3093d01454eb2a50c",
"assets/assets/Slide%252018%2520-%2520Pregnancy.png": "16bfa89a4c1497b18168c673013661f8",
"assets/assets/M3S2.png": "c91c38b666062b3be78ce617a7729006",
"assets/assets/WomenHealth.jpeg": "32f3a4d7fbf81cc02a1d6431a8202191",
"assets/assets/Slide%252026%2520-%2520Infants.png": "2c2325c59e115b9ca0c6a5edc9a92040",
"assets/assets/M1S1.png": "59f2f230b7a9d22a049875525eba63cc",
"assets/assets/Slide%252019%2520-%2520Pregnancy.png": "6cdb9b6c4f30528624f46421b8d51856",
"assets/assets/M3S3.png": "9525523c69c16b8ad12131a70b306cfc",
"assets/assets/Slide%25209%2520-%2520Adults.png": "e0ddee1c28dfe582e45590e4c863eee1",
"assets/assets/Lesson2_2.PNG": "1590aff3b7736bd7e872e25a6f2c567f",
"assets/assets/M3S1.png": "1372921ce8df436e701c1e83394e4e7f",
"assets/assets/M1S3.png": "aec1403ba0235fd83281be0bcb264bfd",
"assets/assets/Lesson4_4.png": "cd40b4311bfdaba7a2b8241caee9ae94",
"assets/assets/Lesson4_5.png": "aa811000743391b6e9a39663d16103f3",
"assets/assets/M1S2.png": "750a9a95c5128281718551bcd960a15c",
"assets/assets/Slide%252023%2520-%2520Infants.png": "e1b9b94a3d51353d2667b4b017a37f0e",
"assets/assets/Slide%25201%2520-%2520Cover%2520Page.png": "719503870cd95abaf65d3e43c1d62822",
"assets/assets/Lesson2_3.PNG": "79a5fd79170250f4bb4f28b9798a017e",
"assets/assets/Lesson5_2.png": "189ee81167a1b41306964397f87d736a",
"assets/assets/Slide%252016%2520-%2520Pregnancy.png": "4c33b623a756d288eb0ae302ea05cbfd",
"assets/assets/Senga%2520Module%25201-10.png": "9ec691d84880d191354917fec1517e57",
"assets/assets/Lesson1_6.png": "5119021df49790ac3b3337e2e76cf5aa",
"assets/assets/Senga%2520Module%25201-8.png": "2bd31027ec006fa392dc0a6ae9e2b5ab",
"assets/assets/Lesson3_4.png": "f5b5e47cb7de2fca512ae3fa8eb23268",
"assets/assets/Slide%252010%2520-%2520Adults.png": "4a08ef55f7c11a37951e67d6377d1aeb",
"assets/assets/Slide%252025%2520-%2520Infants.png": "648fa0bfd1a3a8a12bf06040bb1daa74",
"assets/assets/Lesson3_5.png": "4bb19a99943f4bc2be47d676665115c5",
"assets/assets/care_1.png": "ac3191ee73b3a4089967eeba34433e73",
"assets/assets/Senga%2520Module%25201-9.png": "7efc199fc93804b8285b7bf614253637",
"assets/assets/Slide%252017%2520-%2520Pregnancy.png": "3214e101a004a4fa82c4eec509e723bc",
"assets/assets/Lesson1_7.png": "a1144ed3950ef0fe03ccd4bebb3446d6",
"assets/assets/M2S6.PNG": "1a02e9d92a9e4ca2acfe125b328f1fda",
"assets/assets/Senga%2520Module%25201-11.png": "e56ea818a982d35d57c2824e2965b7a6",
"assets/assets/Lesson5_3.png": "7966129a342b2d7db687a8be9d2e7d1d",
"assets/assets/Lesson5_1.png": "79c39973a4f8d6365f70565e545161f9",
"assets/assets/Slide%25207%2520-%2520Adults.png": "dbd1e931bb33f413dc1e261707cd7696",
"assets/assets/Senga%2520Module%25201-13.png": "dc059d6b31becd6834ebbf3bb828c6ad",
"assets/assets/M2S4.png": "149aa9fda590023c510a90558d880713",
"assets/assets/Lesson1_5.png": "f8502c384194e28bb1597f59d85780c3",
"assets/assets/care_3.png": "8b1626cd3dcd0370fc48d6ec118c59a7",
"assets/assets/Lesson3_7.png": "0187b1ccd52f6dd176e02d5e13ffe19e",
"assets/assets/Slide%252014%2520-%2520Pregnancy.png": "95c4de7421cefa3377a7f2b28ec2196c",
"assets/assets/Lesson3_6.png": "0187b1ccd52f6dd176e02d5e13ffe19e",
"assets/assets/care_2.png": "c266f1112b6ad8d483a90b8d2dc59237",
"assets/assets/Slide%252033%2520-%2520Children.png": "33319d2140247b54b3ff17ed79087c2a",
"assets/assets/Lesson1_4.png": "76298e0f994f524ce3d5562e126ca750",
"assets/assets/M2S5.PNG": "88c3b349e9d176d14b7f4fbe5eb162d2",
"assets/assets/scu.jpg": "0999e540c796278500f96c9b4d57cbf1",
"assets/assets/Slide%252015%2520-%2520Pregnancy.png": "1b38e70db3d3cf20127f6ca99ca7d7c2",
"assets/assets/Senga%2520Module%25201-12.png": "24481ca1885b183acfe6a18863b28784",
"assets/assets/Lesson5_4.png": "b2dab31ae837dca535a978deefb382f7",
"assets/assets/Slide%252030%2520-%2520Children.png": "605fc0709ffd868d41472b7ffcb211b8",
"assets/assets/M2S1.png": "47a27a4b0fe3f61abf77728db2f6c45c",
"assets/assets/Lesson3_2.png": "23bd88b6d226e99a9cad07dcf7c3cef4",
"assets/assets/Lesson2_11.PNG": "16bd1c43ba312a9113301302cab16f02",
"assets/assets/Lesson2_10.PNG": "ad2c27fb632b4d785cf2dcbed7cf817d",
"assets/assets/Lesson3_3.png": "df083bed13df8b4cd7c585e6dde32fbe",
"assets/assets/Slide%252024%2520-%2520Infants.png": "f4aacf47dec57870f6423c9406d42ad1",
"assets/assets/Lesson1_1.png": "6358a0412e52ee0a6b1f368a5c13012e",
"assets/assets/SengaModule1_1.jpg": "624870c85e83ab7b0f6a615d0208b290",
"assets/assets/Lesson5_5.png": "00c4c49c4d2cd89d595fcd5e461d330c",
"assets/assets/M2S2.png": "3f4f37f0034f33dc184a52dcf24ec602",
"assets/assets/Lesson1_3.png": "9f2554b1f339af4570eadd5c6b18c7df",
"assets/assets/care_5.png": "cb2bfff57cb20adb6276318f8272a048",
"assets/assets/Lesson3_1.png": "4396a7cd125a61408c751a3fbeff74fd",
"assets/assets/Lesson2_12.PNG": "a4ab801dc3280c8abb3aaf0009e0e990",
"assets/assets/Lesson2-1.PNG": "710d7eafe93b83f16667a26a75f32692",
"assets/assets/care_4.png": "60316990eb883b6e3c23233b5c0f9544",
"assets/assets/Lesson1_2.png": "19a72d0da6387bcbe3359e26e2c971d9",
"assets/assets/M2S3.png": "47c2db26ecb6df62367764d33bea5ec6",
"assets/assets/Slide%25208%2520-%2520Adults.png": "c0ad0168e3edd38bcc00267e920023cf",
"assets/assets/Lesson5_6.png": "65cd1425b7e14705f6c02230fc41f568",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "4124c42a73efa7eb886d3400a1ed7a06",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "f87e541501c96012c252942b6b75d1ea",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "64edb91684bdb3b879812ba2e48dd487",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
