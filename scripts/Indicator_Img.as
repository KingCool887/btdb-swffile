package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3568")]
   public dynamic class Indicator_Img extends MovieClip
   {
      
      public var inner_mc:MovieClip;
      
      public var connecting_mc:MovieClip;
      
      public var connectFail_mc:MovieClip;
      
      public function Indicator_Img()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

