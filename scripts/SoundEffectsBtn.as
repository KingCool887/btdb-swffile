package
{
   import display.ui.CheckButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3832")]
   public dynamic class SoundEffectsBtn extends CheckButton
   {
      
      public function SoundEffectsBtn()
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

