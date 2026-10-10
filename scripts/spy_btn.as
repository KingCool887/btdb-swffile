package
{
   import display.ui.Button;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3356")]
   public dynamic class spy_btn extends Button
   {
      
      public function spy_btn()
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

