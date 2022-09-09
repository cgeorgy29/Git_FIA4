package com.example.tp1premiereapplication

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.Image
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material.icons.filled.MailOutline
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.clipToBounds
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontStyle
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.tp1premiereapplication.ui.theme.TP1PremiereApplicationTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            TP1PremiereApplicationTheme {
                // A surface container using the 'background' color from the theme
//                Surface(modifier = Modifier.fillMaxSize(), color = MaterialTheme.colors.background) {
//                    Greeting("Android")
//                }
            Head()
            }

        }
    }
}

@Composable
fun Greeting(name: String) {
    Text(text = "Hello $name!")
}

@Preview(showBackground = true)
@Composable
fun DefaultPreview() {
    TP1PremiereApplicationTheme {
        Greeting("Android")
    }
}

@Composable
fun Head() {
    Column(
        modifier = Modifier.fillMaxSize(),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center,
    ) {
        MonImage()
        NomPrenom()
        AboutSection()
        Links()
        StartButton()
    }
}

@Composable
fun MonImage() {
    Image(
        painterResource(id = R.mipmap.iledesmorts_foreground),
        contentDescription = "Antoine Vigneron",
        modifier = Modifier
            .size(200.dp)
            .clip(CircleShape)
            .border(2.dp, Color.Black, CircleShape)
            .fillMaxSize(),
        contentScale = ContentScale.Crop
    )
}

@Composable
fun NomPrenom(){
    Text(
        text = "Antoine Vigneron",
        textAlign = TextAlign.Center,
        fontSize = 30.sp
    )
}

@Composable
fun AboutSection() {
    Text(
        text = "Étudiant en école d'ingénieur informatique e-santé",
        textAlign = TextAlign.Center,
        fontSize = 15.sp
    )
    Text(
        text = "École d'ingénieurs ISIS",
        textAlign = TextAlign.Center,
        fontSize = 15.sp,
        fontStyle = FontStyle.Italic
    )
}

 @Composable
fun Links(){
    Spacer(modifier = Modifier.size(30.dp))
        Row(
        ) {
            Icon(
                imageVector = Icons.Filled.MailOutline,
                contentDescription = "Linkedin2",
            )

            Text(
                text = "antoine.vigneron@etud.univ-jfc.fr",
                fontSize = 13.sp)
        }
         Row(
         ) {
             Image(
                 painterResource(id = R.mipmap.linkedin_foreground),
                 contentDescription = "Linkedin",
                 modifier = Modifier.size(20.dp)
             )
            Text(
                text = "https://www.linkedin.com/in/antoine-vigneron-8010621b9/",
                fontSize = 13.sp)
         }
}


@Composable
fun StartButton(){
    Spacer(modifier = Modifier.size(50.dp))
    Button(
        onClick = { /*TODO*/ }
    ) {
        Text(text = "Démarrer")
    }
}