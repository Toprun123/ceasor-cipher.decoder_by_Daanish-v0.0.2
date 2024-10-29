import javax.swing.*;
import java.awt.datatransfer.StringSelection;
import java.awt.Toolkit;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.Transferable;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.UnsupportedFlavorException;

String answer;
String a1="";
String lastx1="";
String lastx2="";
String lastx3="";
String lastx4="";
String lastx5="";
String lastx6="";
String lastx7="";
String lastx8="";
String xs ="";
String v = "v 0.0.9";

float x = 550;
float y = 150;
float w = 110;
float h = 50;

float xb = 675;
float yb = 150;
float wb = 150;
float hb = 50;

float xc = 850;
float yc = 150;
float wc = 60;
float hc = 50;

JFrame frame;

void setup(){
  size(1400, 750);
  background(0);
  frame = new JFrame();
  frame.setAlwaysOnTop(true);
  PFont f = createFont("Arial", 16, true);
  textFont(f,36);
  textAlign(CENTER);
  text("Hover over the text to encrypt or decypt click 'q' to exit",width/2,height/2);
  textFont(f,24);
  fill(0,255,0);
  text("thanks for using",width/2,height/2 + 50);
  textFont(f,36);
  PFont q = createFont("Arial", 16, true);
  textFont(q,20);
  textAlign(RIGHT);
  fill(255);
  text("Created and published by Syed Daanish \n thanks for supporting "+v+" ",width,height/2+300);
  fill(255,0,255);
  text("History",80,30);
  textFont(q,26);
  fill(255,0,0);
  text("history will be deleted after 8 attempts",height/2+90,width/2);
  fill(255);
  text("subscribe me on                                  ",height/2+90,width/2-50);
  textFont(q, 16);
  fill(0,0,255);
  text("https://www.youtube.com/channel/UC1dsBtnS2u4ZFVhT4j4VcoA",height/2+320,width/2-53);
  //link("https://www.youtube.com/channel/UC1dsBtnS2u4ZFVhT4j4VcoA");
  stroke(0);
  noFill();
  fill(255);
  rect(5,50,500,270);
}

void draw(){
  PFont d = createFont("Arial", 16, true);
  if (keyPressed && key == 'q' || keyPressed && key == 'Q'){
      exit();
  }
  textFont(d,19);
  textAlign(LEFT);
  fill(0);
  rect(x,y,w,h);
  fill(255);
  text(" Hover over\n me to crypt", x, y + 20);
  fill(0);
  rect(xb,yb,wb,hb);
  fill(255);
  text(" Hover over me to \n crypt copied text", xb, yb + 20);
  fill(0);
  rect(xc,yc,wc,hc);
  fill(255);
  text(" \nrefresh ", xc, yc);
  if(clicked(x,y,w,h)){
    fill(0);
    rect(0+75,height/2-50,width,height/2-120);
    answer = JOptionPane.showInputDialog(frame, "code to encrypt or decrypt");
    if (answer == null){HistoryUpdate("cancelled","cancelled");}else{cool(answer);HistoryUpdate(answer,answer);}
  }
  if(clicked(xb,yb,wb,hb)){
    fill(0);
    rect(0+75,height/2-50,width,height/2-120);
    answer = a1 = GetTextFromClipboard();
    JOptionPane.showMessageDialog(frame, "Do you want to copy "+answer);
    cool(answer);
    HistoryUpdate(answer,crypt(answer));
  }
  if(clicked(xc,yc,wc,hc)){
    fill(0);
    rect(0+75,height/2-50,width,height/2-120);
    fill(255);
    rect(5,50,500,270);
    lastx1="";
    lastx2="";
    lastx3="";
    lastx4="";
    lastx5="";
    lastx6="";
    lastx7="";
    lastx8="";
    xs="";
  }
}

boolean clicked(float xa, float ya, float wa, float ha){
  if (mouseX>xa && mouseX <xa+wa && mouseY>ya && mouseY <ya+ha){return true;}else{return false;}
}

String crypt(String msg){
    String s = "";
    int len = 0;
    len = msg.length();
    if (len == 0){
      return "no input";
    }
    for(int x = 0; x < len; x++){
        char c = (char)(msg.charAt(x) + 13);
        if (c > 'z')
            s += (char)(msg.charAt(x) - (26-13));
        else
            s += (char)(msg.charAt(x) + 13);
    }
    return s;
}

void cool(String r){
        fill(255);
        PFont f = createFont("Arial", 16, true);
        String cleartext = r;
        cleartext = cleartext.toLowerCase();
        cleartext = cleartext.replaceAll("\\s+", "");
        println(crypt(cleartext));
        String h = crypt(cleartext);
        h = h.trim().replaceAll("[\n]{2,}", "");
        if (h.length() > 25){
          h = h.substring(0,24);
        }
        if (h == "no input"){
          textFont(f,32);
          textAlign(CENTER);
          text(h,width/2,height/2);
        }else{
          textFont(f,32);
          textAlign(CENTER);
          text(h+" : copied to clipboard!",width/2,height/2);
          StringSelection stringSelection = new StringSelection(h);
          Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
          clipboard.setContents(stringSelection, null);
        }
}

void HistoryUpdate(String a, String b){
  PFont q = createFont("Arial", 36, true);
  textFont(q,20);
  fill(0);
  if (a.length() > 25){
    a = a.substring(0,24);
  }
  if (b.length() > 25){
    b = b.substring(0,24);
  }
  a = a.trim().replaceAll("\n", " ");
  a = a.replaceAll("\\s+", "");
  if (b == "cancelled"){
  lastx8 = lastx7;
  lastx7 = lastx6;
  lastx6 = lastx5;
  lastx5 = lastx4;
  lastx4 = lastx3;
  lastx3 = lastx2;
  lastx2 = lastx1;
  lastx1 = xs;
  xs = b;
  println(xs);
  fill(255);
  rect(5,50,500,270);
  fill(0);
  textAlign(LEFT);
  text(xs,10,75);
  text(lastx1,10,105);
  text(lastx2,10,135);
  text(lastx3,10,165);
  text(lastx4,10,195);
  text(lastx5,10,195+30);
  text(lastx6,10,195+60);
  text(lastx7,10,195+90);
  text(lastx8,10,195+90+30);
  }
  else{
  b = crypt(a);
  if (b == "no input"){
  lastx8 = lastx7;
  lastx7 = lastx6;
  lastx6 = lastx5;
  lastx5 = lastx4;
  lastx4 = lastx3;
  lastx3 = lastx2;
  lastx2 = lastx1;
  lastx1 = xs;
  xs = b;
  println(xs);
  fill(255);
  rect(5,50,500,270);
  fill(0);
  textAlign(LEFT);
  text(xs,10,75);
  text(lastx1,10,105);
  text(lastx2,10,135);
  text(lastx3,10,165);
  text(lastx4,10,195);
  text(lastx5,10,195+30);
  text(lastx6,10,195+60);
  text(lastx7,10,195+90);
  text(lastx8,10,195+90+30);
  }else{
  lastx8 = lastx7;
  lastx7 = lastx6;
  lastx6 = lastx5;
  lastx5 = lastx4;
  lastx4 = lastx3;
  lastx3 = lastx2;
  lastx2 = lastx1;
  lastx1 = xs;
  xs = a+" : "+b;
  println(xs);
  fill(255);
  rect(5,50,500,270);
  fill(0);
  textAlign(LEFT);
  text(xs,10,75);
  text(lastx1,10,105);
  text(lastx2,10,135);
  text(lastx3,10,165);
  text(lastx4,10,195);
  text(lastx5,10,195+30);
  text(lastx6,10,195+60);
  text(lastx7,10,195+90);
  text(lastx8,10,195+90+30);
  }
  }
}
void mousePressed(){if (clicked(height/2-150,width/2-80,500,50)){link("https://www.youtube.com/channel/UC1dsBtnS2u4ZFVhT4j4VcoA");}}
String GetTextFromClipboard () {
  String text = (String) GetFromClipboard(DataFlavor.stringFlavor);
 
  if (text==null) 
    return "";
 
  return text;
}
 
Object GetFromClipboard (DataFlavor flavor) {
 
  Clipboard clipboard = getJFrame(getSurface()).getToolkit().getSystemClipboard();
 
  Transferable contents = clipboard.getContents(null);
  Object object = null;
 
  if (contents != null && contents.isDataFlavorSupported(flavor)) {
    try
    {
      object = contents.getTransferData(flavor);
    }
 
    catch (UnsupportedFlavorException e1)
    {
      e1.printStackTrace();
    }
 
    catch (java.io.IOException e2)
    {
      e2.printStackTrace() ;
    }
  }
 
  return object;
} 
 
static final javax.swing.JFrame getJFrame(final PSurface surf) {
  return
    (javax.swing.JFrame)
    ((processing.awt.PSurfaceAWT.SmoothCanvas)
    surf.getNative()).getFrame();
}
