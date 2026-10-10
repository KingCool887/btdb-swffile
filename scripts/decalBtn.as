package
{
   import display.ui.Button;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3289")]
   public dynamic class decalBtn extends Button
   {
      
      public var holder_mc:MovieClip;
      
      public var medal:MovieClip;
      
      public var check:checkBox;
      
      public var bought:MovieClip;
      
      public var cost_txt:TextField;
      
      public function decalBtn()
      {
         super();
         addFrameScript(9,this.frame10,19,this.frame20,29,this.frame30);
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
   }
}

