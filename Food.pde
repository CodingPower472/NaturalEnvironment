class Food
{
  float foodX = int(random(width));
  float foodY = int(random(height));
  
  void relocate()
  {
   foodX = int(random(width));
   foodY = int(random(height));
  }
  
  void show()
  {
    fill(207, 3, 59);
    rect(foodX, foodY, 10, 10);
  }
}
