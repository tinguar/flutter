'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.json": "c2490654d7147146dd563203a705c328",
"assets/AssetManifest.smcbin": "43d62bda863bfb65a1d7510935cce029",
"assets/assets/fonts/Agustina.ttf": "dc2e22aeb9024b30a058c690a7f9f7ba",
"assets/assets/fonts/GoogleSansRegular.ttf": "b5c77a6aed75cdad9489effd0d5ea411",
"assets/assets/icon/icon.png": "44e893796971eba7a6251e4025ffc0e7",
"assets/assets/images/bg.jpg": "56a5e2b719f5333da3b5a4b64feceb93",
"assets/assets/images/bg.png": "e1ea722e9e7d66d0d117a74799eb6db8",
"assets/assets/images/profileimage.jpg": "439b023fe212f45de66cae6a0fbb733a",
"assets/assets/png/instagram.png": "26631a4043b14dff84180bdf51c3cacb",
"assets/assets/svg/check.svg": "bce7a581bb999caac446c9138a57a401",
"assets/assets/svg/css.svg": "f5da6f2582ec0f08a61d1860848c6cac",
"assets/assets/svg/dart.svg": "384ad99903293e87f01f49214db88050",
"assets/assets/svg/download.svg": "8c24d4679cb0c5297277321bf7b65d28",
"assets/assets/svg/flutter.svg": "356b8423fb4c37e3babe292a9e03c975",
"assets/assets/svg/github.svg": "76d344f08412543c74ccd1fb2493d607",
"assets/assets/svg/html.svg": "8ee96cee414aecdaf50a90e7b0ce361b",
"assets/assets/svg/javascript.svg": "1b8cb03034029e25cbec50f01246062b",
"assets/assets/svg/jimdo.svg": "60c1fab4168e2a47337480a18933c257",
"assets/assets/svg/linkedin.svg": "3d952ffcbf6ce58b59864d65c1f60a47",
"assets/assets/svg/tiktok.svg": "ba38f7527aa60bc10ab7083f6a55edbd",
"assets/assets/svg/twitter.svg": "8f662cde3e6a9aca24b77c1639d9423e",
"assets/assets/svg/vscode.svg": "46bd07edc24e28187b6af11cf510bef1",
"assets/assets/svg/wordpress.svg": "ee57ad49e31cf6a7733c61b1be9756e5",
"assets/FontManifest.json": "7d4d653134eda3ced81460d30e2eeac9",
"assets/fonts/MaterialIcons-Regular.otf": "62ec8220af1fb03e1c20cfa38781e17e",
"assets/NOTICES": "a4552b2fcf0cdd2d5674f8a5c7f8872b",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/profiling/canvaskit.js": "e275cb040a1d217b0f8f54b8fbd2ef52",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"favicon.ico": "d819bd5b7b43455c72d7b6733f6f385d",
"favicon.png": "3feb96895f8cdc07d62fa87bb8b25f19",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "44e893796971eba7a6251e4025ffc0e7",
"icons/Icon-512.png": "a73e9a3b065264182e70135acaf5536a",
"icons/Icon-maskable-192.png": "44e893796971eba7a6251e4025ffc0e7",
"icons/Icon-maskable-512.png": "a73e9a3b065264182e70135acaf5536a",
"index.html": "f2a8097de1fec8ee7ed4c25286ff089e",
"/": "f2a8097de1fec8ee7ed4c25286ff089e",
"main.dart.js": "5e5d335b949d3dccc6d1929d4a40c6a8",
"manifest.json": "fa412fbeada6699e394cf8112d1427ed",
"style.css": "8bd15b3279ccb3e8087feefce594d68d",
"version.json": "3c7953d24b89df7a5ecaf0815ed225ce"};
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
