import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebsiteView extends StatefulWidget {
  const WebsiteView({Key? key}) : super(key: key);

  @override
  _WebsiteViewState createState() => _WebsiteViewState();
}

class _WebsiteViewState extends State<WebsiteView> {
  var searchController = TextEditingController();
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  String url = 'flutter.dev';
  String preUrl = 'https://';

  @override
  void initState() {

    super.initState();
    if(Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  TextField(
          controller: searchController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter URL Here',
            prefixIcon: const Icon(Icons.public,color: Colors.white,),
            suffixIcon: IconButton(
                onPressed: (){
                  setState(() {
                    url = searchController.text;

                    print('Url : https://$url');
                  });
                },
                icon: const Icon(Icons.search, color: Colors.white,)
            )
          ),
        ),
      ),
      body:  WebView(
        initialUrl: preUrl + url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
