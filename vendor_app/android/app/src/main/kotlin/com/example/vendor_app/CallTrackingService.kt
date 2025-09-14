package com.example.vendor_app

import android.telephony.PhoneStateListener
import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.IBinder
import android.telephony.TelephonyManager
import androidx.core.app.NotificationCompat

// Import CallListener here
import com.example.vendor_app.CallListener

class CallTrackingService : Service() {
    private lateinit var telephonyManager: TelephonyManager
    private lateinit var callListener: CallListener

    override fun onCreate() {
        super.onCreate()
        startForegroundService()
        startCallTracking()
    }

    private fun startForegroundService() {
        val channelId = "call_tracking_service"
        val channelName = "Call Tracking Service"

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(channelId, channelName, NotificationManager.IMPORTANCE_LOW)
            val manager = getSystemService(NotificationManager::class.java)
            manager.createNotificationChannel(channel)
        }

        val notification: Notification = NotificationCompat.Builder(this, channelId)
            .setContentTitle("Call Tracking Active")
            .setContentText("App is tracking incoming and outgoing calls")
            .setSmallIcon(R.drawable.ic_launcher)
            .build()

        startForeground(1, notification)
    }

    private fun startCallTracking() {
        // Pass the context to the CallListener
        callListener = CallListener(this)
        telephonyManager = getSystemService(Context.TELEPHONY_SERVICE) as TelephonyManager
        telephonyManager.listen(callListener, PhoneStateListener.LISTEN_CALL_STATE)
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        return START_STICKY
    }

    override fun onBind(intent: Intent?): IBinder? {
        return null
    }
}
