void home() {
  background();
  for (int y=0; y<rows; y++){
    for (int x=0; x<cols; x++){
      image(backgroundimage,(x*backgroundimage.width),(y*backgroundimage.height));
    }
  }
  shapeMode(CENTER);
  //logo.resize(width/3,width/3);
  //image(logo,((width/2)-(logo.height/2)),((height/4)-(logo.height/2)));
  shape(logo, width/2, height/4, width/3, width/3);
  shape(buttons,(width/2),(height*0.7),width/3,width/3);
}