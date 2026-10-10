package effects
{
   import §+C§.§0>§;
   import §;M§.§"L§;
   import assets.Burst;
   import display.Frame;
   import flash.display.BitmapData;
   import utils.Pool;
   
   public class Burst extends §"L§
   {
      
      internal var frame:Frame = §?V§.instance.§1=§.getFrames(assets.Burst,10)[0];
      
      internal var drawn:Boolean = false;
      
      internal var levelSlug:§0>§;
      
      public function Burst()
      {
         super();
         z = 5;
      }
      
      public function initialise(param1:Number, param2:Number, param3:§0>§) : void
      {
         this.x = param1;
         this.y = param2;
         this.levelSlug = param3;
         this.drawn = false;
         rotation = Math.random() * 6.28;
         param3.§?3§(this);
      }
      
      override public function process(param1:Number) : void
      {
         if(this.drawn)
         {
            this.levelSlug.§ D§(this);
            Pool.release(this);
         }
      }
      
      override public function draw(param1:BitmapData) : void
      {
         this.frame.drawRotated(param1,x,y,rotation);
         this.drawn = true;
      }
   }
}

