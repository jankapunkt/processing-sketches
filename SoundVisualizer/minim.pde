public void init_minim()
{
  minim = new Minim(this);
  radiohead = minim.loadFile("beat.wav", 1024);
  radiohead.loop();
  fft = new FFT( radiohead.bufferSize(), radiohead.sampleRate() ); 
  bands=new float[numberOfLines];
}


/**
 *  USED TO CALCULATE ALL BANDS ONCE IN A LOOP, SAVES TO BUFFER ARRAY
 **/
public void calc_bands()
{
  //x position by song position
  fft.forward( radiohead.mix );  
  positionx = map( radiohead.position(), 0, radiohead.length(), 0, width );
  
  for (int i = 0; i < numberOfLines; i++)
  {
    //get frequency band value
    int cnt     = i % fft.specSize();
    bands[i] = fft.getBand(cnt)/4;
  }
}
