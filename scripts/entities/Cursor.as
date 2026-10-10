package entities
{
   import §8U§.§52§;
   import §;M§.§"L§;
   import display.Clip;
   import flash.display.BitmapData;
   import towers.Tower;
   
   public class Cursor extends §"L§
   {
      
      public var clip:Clip = new Clip();
      
      public var owner:Tower;
      
      public function Cursor(param1:Tower)
      {
         this.owner = param1;
         super();
      }
      
      public function initialise(param1:Class) : void
      {
         z = 999999;
         this.clip.initialise(param1,1);
         this.clip.looping = true;
         this.clip.play();
      }
      
      override public function process(param1:Number) : void
      {
         if(owner == null || owner.def == null)
         {
            this.destroy();
            this.owner = null;
            return;
         }
         var pos:§52§ = owner.levelSlug.§#"§();
         x = pos.x;
         y = pos.y;
         this.clip.process();
      }
      
      override public function draw(param1:BitmapData) : void
      {
         if(rotation == 0)
         {
            this.clip.quickDraw(param1,x,y);
         }
         else
         {
            this.clip.drawRotated(param1,x,y,rotation);
         }
      }
   }
}

