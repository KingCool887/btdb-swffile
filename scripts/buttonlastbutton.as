package
{
   import display.ui.Button;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3749")]
   public dynamic class buttonlastbutton extends Button
   {
      
      public function buttonlastbutton()
      {
         super();
         addFrameScript(0,this.frame1,9,this.frame10,19,this.frame20);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame10() : *
      {
         stop();
      }
      
      internal function frame20() : *
      {
         stop();
      }
   }
}

