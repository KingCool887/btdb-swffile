package
{
   import display.ui.CheckButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3483")]
   public dynamic class SFX_btn extends CheckButton
   {
      
      public function SFX_btn()
      {
         super();
         addFrameScript(9,this.frame10,19,this.frame20,29,this.frame30,39,this.frame40);
      }
      
      internal function frame10() : *
      {
         stop();
      }
      
      internal function frame20() : *
      {
         stop();
      }
      
      internal function frame30() : *
      {
         stop();
      }
      
      internal function frame40() : *
      {
         stop();
      }
   }
}

