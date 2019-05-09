class Creatures
{
  float blobX = 501;
  float blobY = 499;
  public boolean eaten = false;
  
  void move()
  {
    blobX = blobX + random(-15, 15);
    blobY = blobY + random(-15, 15);
  }
  
  void show()
  {
    fill(214, 204, 0);
    rect(blobX, blobY, 50, 50);
  }
}
