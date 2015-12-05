int [] getRandoms(int counts, int range)
{
  int[] output=new int[counts];
  for(int i=0;i<output.length;i++)
  {
    output[i]=0; 
  }
  
  
  boolean clean=false;
  for(int i=0;i<counts; i++)
  {
    clean = false;
    while(!clean)
    {
     int rand = ceil(random(1,range));
     if(!hasNum(output, rand))
     {
       output[i]=rand;
       clean=true;
     }
    }  
  }
  
  return sort( output );
}


boolean hasNum(int[] source, int target)
{
  for(int i=0;i<source.length;i++)
  {
   if(source[i] == target)return true; 
  }
  return false;
}


void printNum(int[] source)
{ 
  for(int i=0;i<source.length;i++)
  {
    print(source[i]+" - ");
  }
  println();
}


void keyPressed()
{
  switch(key)
  {
   case 'a':
     if(numlen>1)numlen--;
     break;
   case 'd':
     numlen++;
     break;
   case 'w':
     starlen++;
     break;
   case 's':
     if(starlen>1)starlen--;
     break;
   case 'j':
     if(numrange>2)numrange--;
     break;
   case 'l':
     numrange++;
     break;
   case 'i':
     if(starrange>2)starrange--;
     break;
   case 'k':
     starrange++;
     break;
    default:
     return;
    case ENTER:
     numbers= getRandoms(numlen, numrange);
     stars  = getRandoms(starlen, starrange);
     return;
  }
  numbers=new int[numlen];
  stars  =new int[starlen];
  chance = pow(numrange, numlen);
  println("1:"+df.format(chance));
}
