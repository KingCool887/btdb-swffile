package
{
   import display.ui.CheckButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3834")]
   public dynamic class MusicBtn extends CheckButton
   {
      
      public function MusicBtn()
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

