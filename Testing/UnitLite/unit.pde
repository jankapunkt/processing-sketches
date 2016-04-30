import java.lang.reflect.Method;

class Test
{
  IAsserter asserter;
  IAssertionWriter writer;
  /** creates a new test suite **/
  public Test() {
    writer = new ConsoleAssertionWriter();
    asserter = new LightWeightAsserter(writer, this);
  }
  
  /** Runs all declared methods in this class **/
  public void run() {
    println("----------------------------");
    println("RUN TESTS");
    println("----------------------------");
    Class c = this.getClass();
    Method[] methods = c.getDeclaredMethods();
    for (Method method : methods) {
      if (method.getName() != "run" && method.getName() != "call")
        call(method);
    }
  }

  private void call(Method method)
  {
    try {
      method.invoke(this);
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }
}