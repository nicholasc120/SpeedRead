import java.io.*;
import java.util.*;
import javax.swing.*;

String allText = "";
String [] allTextArr;
String book;

void setup() {
  size(500, 250);
  frameRate(60);
  fill(0);
  text("Press w to speed up, s to slow down, and space to pause", 100, 200);
  text("Press a to go back 10 words", 170, 230);
  textSize(32);
  text("Loading...", 200, 125);
    book = "1984.txt";
  //  book = "Shrek.txt";
  //  book = "theBeeMovie.txt";
  //  book = "GreatGatsby.txt";
/*
  File f = new File (dataPath(""));
  File[] listOfFiles = f.listFiles();
  String[] fileNames = new String [listOfFiles.length];
  for (int i = 0; i < listOfFiles.length; i++) {
    fileNames[i] = listOfFiles[i].getName();
  }
  //JComboBox comboBox = new JComboBox(fileNames);
  */
  try {
    Scanner sc = new Scanner(new File(dataPath(book)));
    while (sc.hasNext()) {
      allText += sc.nextLine() + " ";
    }
    sc.close();
    allTextArr = allText.split(" ");
    // println(allText);
  }
  catch (IOException e) {
    println(e);
  }
} 

int i =0, buffer = 8, count = 0;
boolean paused = false;

void draw() {
  background(#BFBFBF);
  fill(0);
  textSize(32);
  if (i < allTextArr.length) {
    if (allTextArr[i].matches(".*\\w.*")) {
      text(allTextArr[i], 230 - ((allTextArr[i].length()/2) * 10), 125);
      count++;
      if (count >= buffer && !paused) {
        count = 0; 
        i++;
      }
    } else {
      i++;
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    paused = !paused;
  }

  if (key == 'a') {
    if (i < 10) {
      i=0;
    } else {
      i-=10;
    }
  }
}
void keyReleased() {
  if (key == 'w' && buffer > 0) {
    println("speed");
    buffer --;
  }
  if (key == 's') {
    println("slow");
    buffer++;
  }
}
