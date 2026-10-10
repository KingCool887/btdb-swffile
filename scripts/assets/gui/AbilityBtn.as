package assets.gui
{
   import display.ui.Button;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol6114")]
   public dynamic class AbilityBtn extends Button
   {
      
      public var coolDown_mc:MovieClip;
      
      public var holder_mc:MovieClip;
      
      public var qty_txt:TextField;
      
      public function AbilityBtn()
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

