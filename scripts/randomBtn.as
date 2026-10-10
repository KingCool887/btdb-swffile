package
{
   import display.ui.Button;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3390")]
   public dynamic class randomBtn extends Button
   {
      
      public function randomBtn()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,2,this.frame3);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         stop();
      }
      
      internal function frame3() : *
      {
         stop();
      }
   }
}

