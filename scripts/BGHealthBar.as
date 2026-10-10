package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3889")]
   public dynamic class BGHealthBar extends MovieClip
   {
      
      public var masky:MovieClip;
      
      public var inner:MovieClip;
      
      public function BGHealthBar()
      {
         super();
         addFrameScript(6,this.frame7);
      }
      
      internal function frame7() : *
      {
         stop();
      }
   }
}

