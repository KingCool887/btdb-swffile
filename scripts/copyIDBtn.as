package
{
   import display.ui.Button;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3441")]
   public dynamic class copyIDBtn extends Button
   {
      
      public var matchID_txt:TextField;
      
      public var inner:MovieClip;
      
      public function copyIDBtn()
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

