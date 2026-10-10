package
{
   import display.ui.Button;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3052")]
   public dynamic class highScores_btn extends Button
   {
      
      public function highScores_btn()
      {
         super();
         addFrameScript(4,this.frame5,9,this.frame10,14,this.frame15);
      }
      
      internal function frame5() : *
      {
         stop();
      }
      
      internal function frame10() : *
      {
         stop();
      }
      
      internal function frame15() : *
      {
         stop();
      }
   }
}

