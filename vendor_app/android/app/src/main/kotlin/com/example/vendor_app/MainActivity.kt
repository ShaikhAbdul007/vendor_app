package com.example.vendor_app

import android.os.Bundle
import android.telephony.PhoneStateListener
import android.telephony.TelephonyManager
import android.content.Context
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodChannel
import android.widget.Toast
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import android.Manifest
import android.content.pm.PackageManager

class MainActivity : FlutterActivity() {

    private val CHANNEL = "com.example.vendor_app/call"
    private val REQUEST_CODE_PERMISSION = 101
    private lateinit var callListener: CallListener

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(flutterEngine!!)

        // Requesting permission for reading phone state
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.READ_PHONE_STATE) != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.READ_PHONE_STATE), REQUEST_CODE_PERMISSION)
        } else {
            // Initialize PhoneStateListener if permission is granted
            val telephonyManager = getSystemService(Context.TELEPHONY_SERVICE) as TelephonyManager
            callListener = CallListener(this)
            telephonyManager.listen(callListener, PhoneStateListener.LISTEN_CALL_STATE)
        }

        // Setting up MethodChannel to communicate with Flutter
        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getCallStatus") {
                val number = callListener.getCurrentCallNumber()
                result.success(number) // Return current call number to Flutter
            } else {
                result.notImplemented()
            }
        }
    }

    // Handling permission result
    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<String>, grantResults: IntArray) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if (requestCode == REQUEST_CODE_PERMISSION) {
            if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                // Permission granted, initialize the PhoneStateListener
                val telephonyManager = getSystemService(Context.TELEPHONY_SERVICE) as TelephonyManager
                callListener = CallListener(this)
                telephonyManager.listen(callListener, PhoneStateListener.LISTEN_CALL_STATE)
            } else {
                Toast.makeText(this, "Permission denied to access phone state", Toast.LENGTH_SHORT).show()
            }
        }
    }
}
