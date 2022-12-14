class Button_rect {
  PShape button_img;
  PVector img_Pos = new PVector(0, 0);
  PVector button_Pos = new PVector(0, 0);
  float img_Width = 0;
  float img_Height = 0;
  float button_Width = 0;
  float button_Height = 0;
  Boolean Pressed = false;
  Boolean Clicked = false;
  color farve;
  float corners;
  //Constructer to create a button
  Button_rect(PShape img, float img_x, float img_y, float img_w, float img_h, float button_x, float button_y, float button_w, float button_h, int f, float c)
  {
    button_img = img;
    img_Pos.x = img_x;
    img_Pos.y = img_y;
    img_Width = img_w;
    img_Height = img_h;
    button_Pos.x = button_x;
    button_Pos.y = button_y;
    button_Width = button_w;
    button_Height = button_h;
    farve = color(f);
    corners = c;
  }

  void farve() {
    if (mouseX>=button_Pos.x-(button_Width/2) && mouseX <= button_Pos.x+(button_Width/2) && mouseY >= button_Pos.y-(button_Height/2) && mouseY <= button_Pos.y+(button_Height/2)) {
      farve = #66000000;
    } else {
      farve = color(255, 255, 255, 0);
    }
  }

  void update_rect()
  {
    if (mouseX>=button_Pos.x-(button_Width/2) && mouseX <= button_Pos.x+(button_Width/2) && mouseY >= button_Pos.y-(button_Height/2) && mouseY <= button_Pos.y+(button_Height/2))
    {
      //Pressed = true;
      farve = #66000000;
      if (mousePressed == true && mouseButton == LEFT && Pressed == false)
      {
        Clicked = true;
      }
    } else
    {
      farve = color(255, 255, 255, 0);
      Clicked = false;
      Pressed = false;
    }
  }

  void render() {
    noStroke();
    fill(farve);
    rectMode(CENTER);
    shapeMode(CENTER);
    shape(button_img, img_Pos.x, img_Pos.y, img_Width, img_Height);
    rect(button_Pos.x, button_Pos.y, button_Width, button_Height, corners);
  }
  boolean isClicked() {
    return Clicked;
  }
}


class Button_ell {
  PVector Pos = new PVector(0, 0);
  float Width = 0;
  float Height = 0;
  Boolean Pressed = false;
  Boolean Clicked = false;
  color farve;
  //Constructer to create a button
  Button_ell(float x, float y, float h, float w)
  {
    Pos.x = x;
    Pos.y = y;
    Width = w;
    Height = h;
    //farve = color(f);
  }

  void farve() {
    float disX = Pos.x - mouseX;
    float disY = Pos.y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < Width/2) {
      farve = #66000000;
    } else {
      farve = color(255, 255, 255, 0);
    }
  }


  void update_ell()
  {
    float disX = Pos.x - mouseX;
    float disY = Pos.y - mouseY;
    if (mousePressed == true && mouseButton == LEFT && Pressed == false)
    {
      Pressed = true;
      if (sqrt(sq(disX) + sq(disY)) < Width/2)
      {
        Clicked = true;
      }
    } else
    {
      Clicked = false;
    }
    if (mousePressed !=true) {
      Pressed = false;
    }
  }

  void render() {
    noStroke();
    fill(farve);
    ellipse(Pos.x, Pos.y, Width, Height);
  }
  boolean isClicked() {
    return Clicked;
  }
}
