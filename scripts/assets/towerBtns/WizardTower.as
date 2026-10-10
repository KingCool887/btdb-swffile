package assets.towerBtns
{
   import display.ui.Button;
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2783")]
   public dynamic class WizardTower extends Button
   {
      
      public var lock_mc:MovieClip;
      
      public function WizardTower()
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

