package assets.towerBtns
{
   import display.ui.Button;
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2758")]
   public dynamic class BoomerangTower extends Button
   {
      
      public var lock_mc:MovieClip;
      
      public function BoomerangTower()
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

