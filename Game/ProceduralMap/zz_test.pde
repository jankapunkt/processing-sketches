


class TestBase
{
    protected Asserter asserter;

    public TestBase() 
    {
        asserter = new Asserter();
    }


    public void run(Class c)
    {
        println("-------------------------------------");
        String funcName="";
        int errors = 0;
        int finish = 0;
        Method[] m = c.getDeclaredMethods();
        for (int i = 0; i < m.length; i++) 
        {
            if (!m[i].getName().equals("run")) 
            {
                funcName = m[i].getName();
                try
                {
                    m[i].invoke(this);
                    finish++;
                    println("*[" + c.getName() + "]: <" + funcName + "> - ok");
                } 
                catch(Exception e) 
                {
                    Throwable cause = e.getCause();
                    println("![" + c.getName() + "]: <" + funcName +"> - " + cause.getMessage());
                    errors++;
                }
            }
        }
        println("[" + c.getName() + "]: <ERRORS> - " + errors);
        println("[" + c.getName() + "]: <FINISH> - " + finish);
    }
}

class Asserter
{
    public Asserter() 
    {
    }

    public <T> void eq(T curVal, T expVal, String errMesg) throws Exception 
    {
        if (curVal instanceof Number && expVal instanceof Number) {
            if (compare((Number)curVal, (Number)expVal) != 0)
                throw new Exception(errMesg + " in <eq> - was " + curVal +" / expected was "+ expVal);
        } else if (!curVal.equals(expVal)) {
            throw new Exception(errMesg + " in <eq> - " + curVal +" / "+ expVal);
        }
    }

    public <T> void gt(T curVal, T expVal, String errMesg)throws Exception 
    {
        if (compare((Number)curVal, (Number)expVal) != 1)
            throw new Exception(errMesg + " in <gt> - " + curVal +" / "+ expVal);
    }

    public <T> void lt(T curVal, T expVal, String errMesg)throws Exception 
    {
        if (compare((Number)curVal, (Number)expVal) != -1)
            throw new Exception(errMesg + " in <lt> - " + curVal +" / "+ expVal);
    }

    public <T> void neq(T curVal, T expVal, String errMesg)throws Exception 
    {
        if (curVal instanceof Number && expVal instanceof Number) {
            if (compare((Number)curVal, (Number)expVal) == 0)
                throw new Exception(errMesg + " in <neq> - " + curVal +" / "+ expVal);
        } else if (curVal.equals(expVal)) {
            throw new Exception(errMesg + " in <neq> - " + curVal +" / "+ expVal);
        }
    }

    public <T> void isNull(T curVall, String errMesg) throws Exception 
    {
        if (curVall != null)
            throw new Exception(errMesg);
    }

    public int compare(Number a, Number b) {
        return new BigDecimal(a.toString()).compareTo(new BigDecimal(b.toString()));
    }

    public <T> void notNull(T curVal, String errMesg)throws Exception 
    {
        if (curVal == null)
            throw new Exception(errMesg);
    }
}