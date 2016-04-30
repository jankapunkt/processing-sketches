void setup() 
{
  size(300, 300);
  noLoop();
  MyTest t = new MyTest();
  t.run();
}

void draw() {
}

//=====================================================//
//
//    EXAMPLE TEST CLASS
//
//=====================================================//

class MyTest extends Test
{  
  public void example_test()
  {
    asserter.assertEq("unexpected value", 5, 56);
  }
}