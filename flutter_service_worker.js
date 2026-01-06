'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "847950c39f6001376fbf8be75595504a",
"version.json": "009c9e65172e010890f7f65fde438006",
"favicon.ico": "ba898922e253c0477d9f1b55df7cb9b7",
"index.html": "3cf38e039b2dc918e534e05543f7592a",
"/": "3cf38e039b2dc918e534e05543f7592a",
"loader.css": "03106e85fee6a3d2b1dfaa029c3d903d",
"main.dart.js": "932b736bb5045cabbfb5b4cc7ef9887f",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"icons/apple-touch-icon.png": "efd3b8735a120bff880575936e4d5f92",
"icons/icon-192.png": "8b2d32a51965075f82fe6b6b039e0504",
"icons/icon-192-maskable.png": "71db95405a348fa5a3707d6740fa5ec6",
"icons/icon-512-maskable.png": "dcc480b1b0de0d616c3f4de94f3af17b",
"icons/icon-512.png": "e41810034fc705809f2f49f616ce77fc",
"manifest.json": "37b80a07c3b70aa079cf240dac7c9cb4",
"assets/AssetManifest.json": "6d0b0a548b670f64951f6bfcf80ce7ea",
"assets/NOTICES": "9bc95e41090d971c518e709e8108526c",
"assets/FontManifest.json": "e7a8ac59d8afb605105e0c930a01d5ca",
"assets/AssetManifest.bin.json": "37255ab9285aaa4324ae3e75dcc79cf7",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "5ce8f93620817f251ccf7a96dee7c8b3",
"assets/fonts/MaterialIcons-Regular.otf": "4e9819a84be64d667e9d3149dd95d162",
"assets/assets/svg/appStoreIcon.svg": "fdabfe2454168f46f347de05ad0bec63",
"assets/assets/svg/githubIcon.svg": "c23a95fcb4b1d25765107e4e73b06438",
"assets/assets/svg/playStoreIcon.svg": "bd8f2843df647e82df054df459b65bb1",
"assets/assets/svg/web.svg": "536d826998555dafe48c0bf3fa911ff0",
"assets/assets/images/githubLight.webp": "a4327a3cd7f65c62ca2278f24ec191dc",
"assets/assets/images/appStoreDark.webp": "403bb4d0de38b4f52def836a1cc6ae1a",
"assets/assets/images/flutter.png": "4262c71228b7aa391e995fe5f1d57795",
"assets/assets/images/github.png": "076ce7fa990e1f7e3b8bc100d18ea57e",
"assets/assets/images/playStoreLight.webp": "143ce5365ba85a0b69734f21a35f9407",
"assets/assets/images/githubDark.webp": "f68f2c37572e0de1f403c2082c4ca154",
"assets/assets/images/linkedIn.png": "7b346791428ac52714a40fe2bfbbba44",
"assets/assets/images/profile.jpg": "13d94f997790534504a18b4333ec98e3",
"assets/assets/images/whatsapp.png": "8aff8f460ecdcccabdc31826777a6ef1",
"assets/assets/images/appStoreLight.webp": "4c2a777da39a272c98e211b59dd7b5e6",
"assets/assets/images/playStoreDark.webp": "bd53eacf529da22ac3d3fecd5ad1384b",
"assets/assets/appIcons/free2score.png": "07cba29c7802af7aa30e7a8adcd74c01",
"assets/assets/appIcons/fitrefect.jpg": "9adce65946b4f1a6e39baba14dcfdea9",
"assets/assets/appIcons/mukhtara.png": "97bfa124fd20b13add8cbf999fe97e60",
"assets/assets/appIcons/domino.jpg": "db502247f012302c4db1347b18a1fe9b",
"assets/assets/fonts/Nunito-ExtraBold.ttf": "a1007cb176b5b6fbfa37f5a662bb0818",
"assets/assets/fonts/Sacramento-Regular.ttf": "0c8e69ac621ffbdfdb997bef9b5aa312",
"assets/assets/fonts/Nunito-Regular.ttf": "78fa1a608ece83db66b4b1b7c20b969b",
"assets/assets/fonts/Nunito-SemiBold.ttf": "89a76cea4a0f0e2eeaaccaf2afbad11b",
"assets/assets/fonts/Nunito-Bold.ttf": "a69d02bf1d69ee833dfefdb5d21eec9b",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b"};
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
