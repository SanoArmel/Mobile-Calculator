//package example.calc;

/*import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.BatteryManager;
import android.widget.Toast;

public class BatteryLevelReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        int level = intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1);
        int scale = intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        float batteryPct = level * 100 / (float)scale;

        if (batteryPct >= 90 && intent.getIntExtra(BatteryManager.EXTRA_PLUGGED, -1) != 0) {
            Toast.makeText(context, "Battery is charging and has reached 90%", Toast.LENGTH_LONG).show();
        }
    }
}
\\
