package com.matheusjuan.corebridge.android

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.matheusjuan.corebridge.CoreBridgeLib

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            CoreBridgeApp()
        }
    }
}

@Composable
fun CoreBridgeApp() {
    var message by remember { mutableStateOf("Carregando...") }

    LaunchedEffect(Unit) {
        message = CoreBridgeLib.hello("Android Nativo")
    }

    Surface(modifier = Modifier.fillMaxSize()) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(24.dp),
            verticalArrangement = Arrangement.Center,
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Text("Mensagem da ponte nativa:", fontSize = 20.sp)
            Spacer(modifier = Modifier.height(12.dp))
            Text(message, fontSize = 16.sp)
        }
    }
}
