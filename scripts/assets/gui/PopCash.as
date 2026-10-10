package assets.gui
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3570")]
   public dynamic class PopCash extends MovieClip
   {
      
      public var label:TextField;
      
      public function PopCash()
      {
         super();
         addFrameScript(30,this.frame31);
      }
      
      internal function frame31() : *
      {
         stop();
      }
   }
}

