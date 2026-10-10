package projectiles
{
   import §;M§.§"L§;
   import display.Clip;
   import flash.display.BitmapData;
   
   public class §1H§ extends §"L§
   {
      
      private var clip:Clip = null;
      
      public function §1H§()
      {
         super();
      }
      
      public function Initialise(param1:Class, param2:int) : void
      {
         this.clip = new Clip();
         this.clip.initialise(param1,64);
         this.clip.gotoAndPlay(param2);
      }
      
      override public function process(param1:Number) : void
      {
         if(this.clip.frameIndex == this.clip.frameCount - 1)
         {
            destroy();
         }
         this.clip.process();
      }
      
      override public function draw(param1:BitmapData) : void
      {
         this.clip.drawRotated(param1,x,y,rotation);
      }
   }
}

