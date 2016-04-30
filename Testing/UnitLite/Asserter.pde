interface IAsserter
{
  //--------------------------------------------------------
  void assertGt(String msg, Object toTest, Object expValue);
  void assertLt(String msg, Object toTest, Object expValue);
  //--------------------------------------------------------
  void assertEq(String msg, Object toTest, Object expValue);
  void assertNotEq(String msg, Object toTest, Object expValue);
  void assertStrEq(String msg, Object toTest, Object expValue);
  //--------------------------------------------------------
  void assertNull(String msg, Object toTest);
  void assertNotNull(String msg, Object toTest);
  void assertInstance(String msg, Object toTest, Class expClass);
  //--------------------------------------------------------
}

abstract class AbstractAsserter implements IAsserter
{
  final IAssertionWriter writer;
  final Object parent;

  public AbstractAsserter(IAssertionWriter writer, Object parent)
  {
    this.writer = writer;
    this.parent = parent;
  }

  //--------------------------------------------------------
  public abstract void assertGt(String msg, Object toTest, Object expValue);
  public abstract void assertLt(String msg, Object toTest, Object expValue);
  //--------------------------------------------------------
  public abstract void assertEq(String msg, Object toTest, Object expValue);
  public abstract void assertNotEq(String msg, Object toTest, Object expValue);
  public abstract void assertStrEq(String msg, Object toTest, Object expValue);
  //--------------------------------------------------------
  public abstract void assertNull(String msg, Object toTest);
  public abstract void assertNotNull(String msg, Object toTest);
  public abstract void assertInstance(String msg, Object toTest, Class expClass);
  //--------------------------------------------------------
}

public class LightWeightAsserter extends AbstractAsserter
{ 
  public  LightWeightAsserter(IAssertionWriter writer, Object parent)
  {
    super(writer, parent);
  }

  public void assertGt(String msg, Object toTest, Object expValue)
  {
  }
  public void assertLt(String msg, Object toTest, Object expValue)
  {
  }
  //--------------------------------------------------
  public void assertEq(String msg, Object toTest, Object expValue)
  {
    boolean result = (toTest == expValue);
    StackTraceElement[] stackTraceElements = Thread.currentThread().getStackTrace();    
    writer.trace(new Assertion(msg, toTest.toString(), expValue.toString(), stackTraceElements[2].getMethodName(), stackTraceElements[2].getClassName(), result));
  }
  public void assertNotEq(String msg, Object toTest, Object expValue)
  {
  }
  public void assertStrEq(String msg, Object toTest, Object expValue)
  {
  }
  //--------------------------------------------------------
  public void assertNull(String msg, Object toTest)
  {
  }
  public void assertNotNull(String msg, Object toTest)
  {
  }
  public void assertInstance(String msg, Object toTest, Class expClass)
  {
  }
}