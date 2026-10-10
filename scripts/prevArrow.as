package
{
   import display.ui.Button;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3139")]
   public dynamic class prevArrow extends Button
   {
      
      public function prevArrow()
      {
         super();
         addFrameScript(0,this.frame1,5,this.frame6,10,this.frame11);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame6() : *
      {
         stop();
      }
      
      internal function frame11() : *
      {
         stop();
      }
   }
}

