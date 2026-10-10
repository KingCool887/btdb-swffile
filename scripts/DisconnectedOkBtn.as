package
{
   import display.ui.Button;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3259")]
   public dynamic class DisconnectedOkBtn extends Button
   {
      
      public function DisconnectedOkBtn()
      {
         super();
         addFrameScript(0,this.frame1,4,this.frame5,9,this.frame10);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame5() : *
      {
         stop();
      }
      
      internal function frame10() : *
      {
         stop();
      }
   }
}

