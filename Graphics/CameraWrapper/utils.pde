static class PVectorUtils
{
  public final static PVector X = new PVector(1, 0, 0);
  public final static PVector Y = new PVector(0, 1, 0);
  public final static PVector UP= new PVector(0,-1, 0);
  public final static PVector Z = new PVector(0, 0, 1);
  public final static PVector ZERO = new PVector(0, 0, 0);  
}

/** rotates a vector around a poiunt **/
public static void rotVectorYAround(PVector vec, PVector point, float r)
{
    float newx = vec.x - point.x;
    float newz = vec.z - point.z;
    float q = TWO_PI * r;
    vec.set( point.x + newx*cos(q) - newz*sin(q), vec.y, point.z + newx*sin(q) + newz*cos(q) );
}