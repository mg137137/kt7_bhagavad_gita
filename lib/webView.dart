// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class WebView extends StatefulWidget {
//   const WebView({
//     super.key,
//   });
//
//   @override
//   State<WebView> createState() => _WebViewState();
// }
//
// class _WebViewState extends State<WebView> {
//   late WebViewController _controller;
//   bool _loading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             // Update loading bar.
//           },
//           onPageStarted: (String url) {},
//           onPageFinished: (String url) {
//             setState(() {
//               _loading = false;
//             });
//           },
//           onWebResourceError: (WebResourceError error) {},
//           onNavigationRequest: (NavigationRequest request) {
//             if (request.url.startsWith('https://www.youtube.com/')) {
//               return NavigationDecision.prevent;
//             }
//             return NavigationDecision.navigate;
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse('https://kingtechnology.in/'));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Expanded(
//             child: _loading
//                 ? const Center(child: CircularProgressIndicator())
//                 : WebViewWidget(controller: _controller)),
//       ],
//     );
//   }
// }
