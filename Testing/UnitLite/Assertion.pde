interface IAssertion
{
  String getMessage();
  String getTestObject();
  String getExpectedValue();
  String getFunctionName();
  String getClassName();
  boolean getResult();
}

class Assertion implements IAssertion
{
  String msg, testObj, expValue, funcName, className;
  boolean result;

  public Assertion(String msg, String testObj, String expValue, String funcName, String className, boolean result)
  {
    this.msg = msg;
    this.testObj = testObj;
    this.expValue = expValue;
    this.funcName = funcName;
    this.className = className;
    this.result = result;
  }

  public boolean getResult()
  {
    return result;
  }

  public String getMessage()
  {
    return msg;
  }

  public String getTestObject()
  {
    return testObj;
  }

  public String getExpectedValue()
  {
    return expValue;
  }

  public String getFunctionName()
  {
    return funcName;
  }

  public String getClassName()
  {
    return className;
  }
}