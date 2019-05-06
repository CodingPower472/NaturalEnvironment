ArrayList<Creatures> blob = new ArrayList<Creatures>();
ArrayList<Food> food = new ArrayList<Food>();
int time = 100;
//boolean eaten = false;

void setup()
{
  size(1000, 1000);
  frameRate(20);
  
  for(int i = 0; i < 5; i ++)
  {
    blob.add(new Creatures());
  }
  
  for(int i = 0; i < 20; i++)
  {
    food.add(new Food());
  }
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

void kill()
{
  for(int i = 0; i < blob.size() - 1; i++) 
  {
    Creatures b = blob.get(i);
    if(blob.eaten)
    {
      print("removed");
      blob.remove(b);
    }
    else
    {
      println("aaaaaaaaaaa");
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
    for(int i = 0; i < 5; i++)
    {
      println("time over");
      kill();
    }
  }
  
}

void draw()
{
  background(146, 227, 0);
  
  for(int i = 0; i < 5; i++)
  {
    blob.get(i).move();
    blob.get(i).show();
    collision(blob.get(i));
  }
  
  for(Food f : food)
  {
    f.show();
  }
  
  timer();
  
}

void keyPressed()
{
  blob.eaten = true;
}
