package InGameUI_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol6110")]
   public dynamic class cooldown_mc_125 extends MovieClip
   {
      
      public function cooldown_mc_125()
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

