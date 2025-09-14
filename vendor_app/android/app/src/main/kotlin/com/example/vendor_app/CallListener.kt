package com.example.vendor_app

import android.content.Context
import android.telephony.PhoneStateListener
import android.telephony.TelephonyManager
import android.util.Log

class CallListener(private val context: Context) : PhoneStateListener() {

    private var currentCallNumber: String? = null
    private var lastCallState: Int = TelephonyManager.CALL_STATE_IDLE

    override fun onCallStateChanged(state: Int, incomingNumber: String?) {
        super.onCallStateChanged(state, incomingNumber)

        when (state) {
            TelephonyManager.CALL_STATE_IDLE -> {
                // Call idle state, detect if missed or completed
                if (lastCallState == TelephonyManager.CALL_STATE_RINGING) {
                    // Missed call detected
                    Log.d("CallListener", "Missed call from: $incomingNumber")
                    currentCallNumber = incomingNumber
                }
                Log.d("CallListener", "Call ended or idle")
                currentCallNumber = null
            }
            TelephonyManager.CALL_STATE_RINGING -> {
                // Incoming call state
                Log.d("CallListener", "Incoming call from: $incomingNumber")
                currentCallNumber = incomingNumber
            }
            TelephonyManager.CALL_STATE_OFFHOOK -> {
                // Outgoing or incoming call active state
                Log.d("CallListener", "Call active with number: $incomingNumber")
                currentCallNumber = incomingNumber
            }
        }

        lastCallState = state // Update the last call state
    }

    fun getCurrentCallNumber(): String? {
        return currentCallNumber
    }
}
