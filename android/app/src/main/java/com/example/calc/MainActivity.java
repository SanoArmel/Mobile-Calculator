/*package example.calc;

import io.flutter.embedding.android.FlutterActivity;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.os.Bundle;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.widget.Toast;

public class MainActivity extends FlutterActivity {
    private ConnectivityReceiver connectivityReceiver;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // Register the connectivity receiver
        connectivityReceiver = new ConnectivityReceiver();
        IntentFilter filter = new IntentFilter(ConnectivityManager.CONNECTIVITY_ACTION);
        registerReceiver(connectivityReceiver, filter);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        // Unregister the receiver
        unregisterReceiver(connectivityReceiver);
    }

    // Define the connectivity receiver
    public class ConnectivityReceiver extends BroadcastReceiver {
        @Override
        public void onReceive(Context context, Intent intent) {
            boolean noConnectivity = intent.getBooleanExtra(ConnectivityManager.EXTRA_NO_CONNECTIVITY, false);
            if (noConnectivity) {
                Toast.makeText(context, "No internet connection", Toast.LENGTH_SHORT).show();
            } else {
                Toast.makeText(context, "Internet connected", Toast.LENGTH_SHORT).show();
            }
        }
    }
}
\\
