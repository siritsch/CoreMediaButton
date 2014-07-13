import 'dart:html';
import 'dart:js';
import 'package:polymer/polymer.dart';

/**
 * A Polymer click counter element.
 */
@CustomTag('my-toolbar')
class MyToolbar extends PolymerElement {
  @published bool phoneScreen = false;
  @published String queryParam = "";

  MyToolbar.created() : super.created() {
  }

  @override
  void domReady() {
    document.body.on['core-media-change'].listen(onCoreMediaChange);
    Element mediaQuery = $['MediaQuery'];
    mediaQuery.attributes['query'] = queryParam;
  }
  
  void onCoreMediaChange(Event e) {
    var detail = new JsObject.fromBrowserObject(e)['detail'];

    phoneScreen = detail['matches'];    
  }
}

