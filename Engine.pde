import java.lang.ProcessBuilder;
import java.io.*;


//say isready
//response should be readyok



class Engine {
  ProcessBuilder pb;
  Process p = null;
 
  InputStream in    = null; 
  OutputStream out  = null;
  BufferedReader reader;
Engine(String path) {
  
  pb = new ProcessBuilder(path);

  
}
  
  void init() {
    try {
      p = pb.start();
      println("engine was sucessfully initialized");
    }catch(Exception e) {
        println("An error has occured while attempting to start the engine");
    }
    
    in = p.getInputStream();
    out = p.getOutputStream();
    if(in == null || out == null) {
        println("error in creating input/output streams");
    }else {
       println("sucessfully initialized output/input streams"); 
    }
    
    
  }
  
  void say(String message) {
    println("saying:", message);
    out = p.getOutputStream();
    try {
      byte buf[] = message.getBytes();
      out.write(buf);
    }catch(Exception e) {
      println("failed to write");
    }
    
    try {
      out.flush();
    }catch(Exception e) {
      println("failed to flush");
    }
    
  }
  
  
  String listen() {
    println("Listening");
    int c = 0;
    String stringReturn = "";
    
    try {
    while( (c=in.read()) != 13) {
        stringReturn += (char) c;
    }
    }catch(Exception e) {
      stringReturn = "";
     println("falied to read"); 
    }
    println(stringReturn);
    
    if (stringReturn != null && !stringReturn.equals("")) {
      return stringReturn ;
    } else {
      println("read null");
      return "";
  }
  }
  
  void listenTwo() {
    try {
      reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
      String line;
      line = reader.readLine();
      
      for(int i = 0; i < line.length(); i++){
        print(line.charAt(i));
      }
            //while ((line = reader.readLine()) != null) {
            //    println(line);
            //    println(line.length());
            //    println((int)line.charAt(line.length()-1));
            //}
            
            println("someting");
            
    }catch(Exception e) {
     println("falied to read"); 
    }
    
    

  }
  
  
}// end of class
