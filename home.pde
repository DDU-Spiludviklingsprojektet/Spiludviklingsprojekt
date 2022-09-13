void home() {
  for (int y=0; y<rows; y++){
    for (int x=0; x<cols; x++){
      image(backgroundimage,(x*backgroundimage.width),(y*backgroundimage.height));
    }
  }
  logo.resize(width/3,width/3);
  image(logo,((width/2)-(logo.height/2)),((height/4)-(logo.height/2)));
  
  buttons.resize(200,200);
  image(buttons ,((width/2)-(buttons.height/2)),((height/2)-(buttons.height/2)));
}
