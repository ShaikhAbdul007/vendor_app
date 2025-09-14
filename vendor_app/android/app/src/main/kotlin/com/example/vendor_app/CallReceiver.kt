package com.example.vendor_app

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.telephony.TelephonyManager
import android.util.Log

class CallReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action == "android.intent.action.PHONE_STATE") {
            val state = intent.getStringExtra(TelephonyManager.EXTRA_STATE)
            val incomingNumber = intent.getStringExtra(TelephonyManager.EXTRA_INCOMING_NUMBER)

            if (state == TelephonyManager.EXTRA_STATE_RINGING) {
                Log.d("CallReceiver", "Incoming call detected: $incomingNumber")
            }

            if (state == TelephonyManager.EXTRA_STATE_OFFHOOK) {
                Log.d("CallReceiver", "Call answered or outgoing: $incomingNumber")
            }

            if (state == TelephonyManager.EXTRA_STATE_IDLE) {
                Log.d("CallReceiver", "Call ended or missed: $incomingNumber")
            }

            // Foreground Service ko start karo (taaki background me bhi call track ho)
            val serviceIntent = Intent(context, CallTrackingService::class.java)
            context.startForegroundService(serviceIntent)
        }
    }
}
