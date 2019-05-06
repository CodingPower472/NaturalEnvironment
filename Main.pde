ArrayList<Creatures> blobs = new ArrayList<Creatures>();
ArrayList<Food> food = new ArrayList<Food>();
int time = 150;

void setup()
{
  size(1000, 1000);
  frameRate(20);
  
  for(int i = 0; i < 5; i ++)
  {
    blobs.add(new Creatures());
  }
  
  for(int i = 0; i < 50; i++)
  {
    food.add(new Food());
  }
}

void reset(Creatures blob)
{
  blob.blobX = 500;
  blob.blobY = 500;
  time = 150;
}

void collision(Creatures blob) 
{
  for(int i = 0; i < food.size() - 1; i++) 
  {
    Food f = food.get(i);
    if((blob.blobX - 25 <= f.foodX && blob.blobX + 25 >= f.foodX) && (blob.blobY - 25 <= f.foodY && blob.blobY + 25 >= f.foodY))
    {
      print("collission");
      food.remove(f);
      blob.eaten = true;
    }
  }
}

void kill(Creatures blob)
{
  for(int i = 0; i < blobs.size() - 1; i++) 
  {
    Creatures b = blobs.get(i);
    if(!blob.eaten)
    {
      print("removed");
      blobs.remove(blob);
    }
    else
    {
      println("aaaaaaaaaaa");
    }
    
    for(int j = 0; j < blobs.size(); j++)
    {
      reset(blob);
    }
  }
}

void timer()
{
  textSize(20);
  text("Time: " + time, width/2, 30);
  
  if(time > 0)
  {
    time--;
  }
  else
  {
    for(int i = 0; i < blobs.size(); i++)
    {
      Creatures b = blobs.get(i);
      println("time over");
      kill(b);
    }
  }
  
}

void draw()
{
  background(146, 227, 0);
  
  for(int i = 0; i < blobs.size(); i++)
  {
    blobs.get(i).move();
    blobs.get(i).show();
    collision(blobs.get(i));
  }
  
  for(Food f : food)
  {
    f.show();
  }
  
  timer();
  
}

void keyPressed(Creatures blob)
{
  blob.eaten = true;
}
