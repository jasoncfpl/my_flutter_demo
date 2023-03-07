
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_flutter_demo/texture/lj_texture.dart';

// ignore: must_be_immutable
class OpenGLWidget extends StatefulWidget {
  OpenGLWidget({Key? key,
    this.width = 134,
    this.height = 132
  }):super(key:key);

  var width;
  var height;

  @override
  State<StatefulWidget> createState() {
    return _TextureState();
  }
}

class _TextureState extends State<OpenGLWidget> {

  final _externalPlugin = ExternalPlugin();

  @override
  void initState() {
    super.initState();
    initPlugin();
  }

  void initPlugin() async {
    await _externalPlugin.initialize(widget.width, widget.height);
    setState(() {

    });
  }

  @override
  void dispose() {
    super.dispose();
    _dispose();

  }

  _dispose() {
    _externalPlugin.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width.toDouble(),
        height: widget.height.toDouble(),
        child: _externalPlugin.isInitialized
            ? Texture(textureId: _externalPlugin.textureId!)
            : Container(color: Colors.blue)
    );
  }

}