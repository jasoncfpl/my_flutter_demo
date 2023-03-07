package com.example.my_flutter_demo

import android.app.Activity
import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Rect
import android.util.Log
import android.view.Surface
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry
import io.flutter.view.TextureRegistry

class ExternalPlugin: FlutterPlugin, MethodChannel.MethodCallHandler, ActivityAware {
    companion object {
        private const val TAG = "ExternalPlugin"

        @JvmStatic
        fun registerWith(registrar: PluginRegistry.Registrar) {
            val channel = MethodChannel(registrar.messenger(), "external_plugin")
            channel.setMethodCallHandler(ExternalPlugin())
        }
    }

    private lateinit var channel : MethodChannel
    private lateinit var textureRegistry: TextureRegistry
    private lateinit var surfaceEntry: TextureRegistry.SurfaceTextureEntry
    private lateinit var context: Context
    private lateinit var activity: Activity

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {

        channel = MethodChannel(binding.binaryMessenger, "external_plugin")
        channel.setMethodCallHandler(this)
        textureRegistry = binding.textureRegistry
        context = binding.applicationContext
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
//        val arguments = call.arguments
        val arguments = call.arguments<Map<String,Int>>()
        Log.i(TAG, "onMethodCall: " + call.method)
        if (call.method == "create") {

            val width = arguments["width"] as Int
            val height = arguments["height"] as Int

            /// 获取图片地址
            val url = arguments["url"]

            val options = BitmapFactory.Options()
            options.inPreferredConfig= Bitmap.Config.ARGB_4444;


            //图片下载过程/读取Native本地icon
            val bitmap = BitmapFactory.decodeResource(context.getResources(), R.drawable.image,options) as
                    Bitmap

            surfaceEntry = textureRegistry.createSurfaceTexture()
            val textureId = surfaceEntry.id()
            /// 创建Surface实例加载surfaceTexture

            val surface = Surface(surfaceEntry.surfaceTexture().apply {
                setDefaultBufferSize(width!!, height!!)
            })
            /// 画布绘制bitmap 纹理映射
            val srcRect = Rect(0,0,bitmap.width,bitmap.height)
            val desRect = Rect(0,0,width,height)
            val canvas = surface.lockCanvas(desRect)

            canvas.drawBitmap(bitmap, srcRect, desRect, null)

            bitmap.recycle()
            surface.unlockCanvasAndPost(canvas)
            result.success(textureId)
        } else if ("dispose" == call.method){
            surfaceEntry.release()
        }
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
        Log.i(TAG, "onAttachedToActivity: " + binding.activity)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        TODO("Not yet implemented")
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        TODO("Not yet implemented")
    }

    override fun onDetachedFromActivity() {
        Log.i(TAG, "onDetachedFromActivity: ")
        TODO("Not yet implemented")
    }
}