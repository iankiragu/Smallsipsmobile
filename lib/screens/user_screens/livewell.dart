import 'package:flutter/material.dart';
import 'package:health_care/helper/common_widgets/commonwidgets.dart';
import 'package:health_care/helper/constant.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class LiveWellScreen extends StatefulWidget {
  static const routeName = '/liveWell';
  @override
  _LiveWellScreenState createState() => _LiveWellScreenState();
}

class _LiveWellScreenState extends State<LiveWellScreen> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: setHeaderTitle('Health Bot', Colors.white),
        backgroundColor: AppColor.themeColor,
        elevation: 1.0,
      ),
      body: Container(
        width: double.infinity,
        child: WebView(
          initialUrl: Uri.dataFromString(
                  '<html>'
                  '<body>'
                  '<div>'
                  '<iframe src="https://smallsips.azurewebsites.net/Chatbot" title="Julia" style="position: absolute; height: 100%; width: 100%; border: 2px solid #015eb8;"></iframe>'
                  '</div></body>'
                  '</html>',
                  mimeType: 'text/html')
              .toString(),
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
