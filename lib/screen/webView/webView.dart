import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:path_provider/path_provider.dart';

enum _MenuOptions {
  navigationDelegate,
  userAgent,
  javascriptChannel,
  listCookies,
  clearCookies,
  addCookie,
  setCookie,
  removeCookie,
  loadFlutterAsset,
  loadLocalFile,
  loadHtmlString,
}

const String kExamplePage = '''
<!DOCTYPE html>
<html lang="en">
<head>
<title>Load file or HTML string example</title>
</head>
<body>

<h1>Local demo page</h1>
<p>
 This is an example page used to demonstrate how to load a local file or HTML
 string using the <a href="https://pub.dev/packages/webview_flutter">Flutter
 webview</a> plugin.
</p>

</body>
</html>
''';

class WebViewPage extends StatefulWidget {
  const WebViewPage({required this.controller, super.key});

  final WebViewController controller;

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  var loadingPercentage = 0;
  final cookieManager = WebViewCookieManager();

  @override
  void initState() {
    super.initState();
    widget.controller
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
          },
          onNavigationRequest: (navigation) {
            final host = Uri.parse(navigation.url).host;
            if (host.contains('youtube.com')) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Blocking navigation to $host',
                  ),
                ),
              );
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'SnackBar',
        onMessageReceived: (message) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message.message)));
        },
      );
  }

  Future<void> _onListCookies(WebViewController controller) async {
    final String cookies = await controller
        .runJavaScriptReturningResult('document.cookie') as String;
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(cookies.isNotEmpty ? cookies : 'There are no cookies.'),
      ),
    );
  }

  Future<void> _onClearCookies() async {
    final hadCookies = await cookieManager.clearCookies();
    String message = 'There were cookies. Now, they are gone!';
    if (!hadCookies) {
      message = 'There were no cookies to clear.';
    }
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> _onAddCookie(WebViewController controller) async {
    await controller.runJavaScript('''var date = new Date();
  date.setTime(date.getTime()+(30*24*60*60*1000));
  document.cookie = "FirstName=John; expires=" + date.toGMTString();''');
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Custom cookie added.'),
      ),
    );
  }

  Future<void> _onSetCookie(WebViewController controller) async {
    await cookieManager.setCookie(
      const WebViewCookie(name: 'foo', value: 'bar', domain: 'flutter.dev'),
    );
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Custom cookie is set.'),
      ),
    );
  }

  Future<void> _onRemoveCookie(WebViewController controller) async {
    await controller.runJavaScript(
        'document.cookie="FirstName=John; expires=Thu, 01 Jan 1970 00:00:00 UTC" ');
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Custom cookie removed.'),
      ),
    );
  }

  Future<void> _onLoadFlutterAssetExample(
      WebViewController controller, BuildContext context) async {
    await controller.loadFlutterAsset('assets/www/index.html');
  }

  Future<void> _onLoadLocalFileExample(
      WebViewController controller, BuildContext context) async {
    final String pathToIndex = await _prepareLocalFile();

    await controller.loadFile(pathToIndex);
  }

  static Future<String> _prepareLocalFile() async {
    final String tmpDir = (await getTemporaryDirectory()).path;

    final File indexFile = File('$tmpDir/www/index.html');

    await Directory('$tmpDir/www').create(recursive: true);
    await indexFile.writeAsString(kExamplePage);

    return indexFile.path;
  }

  Future<void> _onLoadHtmlStringExample(
      WebViewController controller, BuildContext context) async {
    await controller.loadHtmlString(kExamplePage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView'),
        actions: [
          Row(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () async {
                  final messenger = ScaffoldMessenger.of(context);
                  if (await widget.controller.canGoBack()) {
                    await widget.controller.goBack();
                  } else {
                    messenger.showSnackBar(
                      const SnackBar(content: Text('No back history item')),
                    );
                    return;
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () async {
                  final messenger = ScaffoldMessenger.of(context);
                  if (await widget.controller.canGoForward()) {
                    await widget.controller.goForward();
                  } else {
                    messenger.showSnackBar(
                      const SnackBar(content: Text('No forward history item')),
                    );
                    return;
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.replay),
                onPressed: () {
                  widget.controller.reload();
                },
              ),
              PopupMenuButton<_MenuOptions>(
                onSelected: (value) async {
                  switch (value) {
                    case _MenuOptions.navigationDelegate:
                      await widget.controller
                          .loadRequest(Uri.parse('https://youtube.com'));
                      break;
                    case _MenuOptions.userAgent:
                      final userAgent = await widget.controller
                          .runJavaScriptReturningResult('navigator.userAgent');
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('$userAgent'),
                      ));
                      break;
                    case _MenuOptions.javascriptChannel:
                      await widget.controller.runJavaScript('''
var req = new XMLHttpRequest();
req.open('GET', "https://api.ipify.org/?format=json");
req.onload = function() {
  if (req.status == 200) {
    let response = JSON.parse(req.responseText);
    SnackBar.postMessage("IP Address: " + response.ip);
  } else {
    SnackBar.postMessage("Error: " + req.status);
  }
}
req.send();''');
                      break;
                    case _MenuOptions.clearCookies:
                      await _onClearCookies();
                      break;
                    case _MenuOptions.listCookies:
                      await _onListCookies(widget.controller);
                      break;
                    case _MenuOptions.addCookie:
                      await _onAddCookie(widget.controller);
                      break;
                    case _MenuOptions.setCookie:
                      await _onSetCookie(widget.controller);
                      break;
                    case _MenuOptions.removeCookie:
                      await _onRemoveCookie(widget.controller);
                      break;
                    case _MenuOptions.loadFlutterAsset:
                      await _onLoadFlutterAssetExample(
                          widget.controller, context);
                      break;
                    case _MenuOptions.loadLocalFile:
                      await _onLoadLocalFileExample(widget.controller, context);
                      break;
                    case _MenuOptions.loadHtmlString:
                      await _onLoadHtmlStringExample(
                          widget.controller, context);
                      break;
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem<_MenuOptions>(
                    value: _MenuOptions.navigationDelegate,
                    child: Text('Navigate to YouTube'),
                  ),
                  const PopupMenuItem<_MenuOptions>(
                    value: _MenuOptions.userAgent,
                    child: Text('Show user-agent'),
                  ),
                  const PopupMenuItem<_MenuOptions>(
                    value: _MenuOptions.javascriptChannel,
                    child: Text('Lookup IP Address'),
                  ),
                  const PopupMenuItem<_MenuOptions>(
                    value: _MenuOptions.clearCookies,
                    child: Text('Clear cookies'),
                  ),
                  const PopupMenuItem<_MenuOptions>(
                    value: _MenuOptions.listCookies,
                    child: Text('List cookies'),
                  ),
                  const PopupMenuItem<_MenuOptions>(
                    value: _MenuOptions.addCookie,
                    child: Text('Add cookie'),
                  ),
                  const PopupMenuItem<_MenuOptions>(
                    value: _MenuOptions.setCookie,
                    child: Text('Set cookie'),
                  ),
                  const PopupMenuItem<_MenuOptions>(
                    value: _MenuOptions.removeCookie,
                    child: Text('Remove cookie'),
                  ),
                  const PopupMenuItem<_MenuOptions>(
                    value: _MenuOptions.loadFlutterAsset,
                    child: Text('Load Flutter Asset'),
                  ),
                  const PopupMenuItem<_MenuOptions>(
                    value: _MenuOptions.loadHtmlString,
                    child: Text('Load HTML string'),
                  ),
                  const PopupMenuItem<_MenuOptions>(
                    value: _MenuOptions.loadLocalFile,
                    child: Text('Load local file'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          WebViewWidget(
            controller: widget.controller,
          ),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
            ),
        ],
      ),
    );
  }
}
