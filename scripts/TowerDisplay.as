package
{
   import display.ui.Button;
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3351")]
   public dynamic class TowerDisplay extends Button
   {
      
      public var holder_mc:MovieClip;
      
      public function TowerDisplay()
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

