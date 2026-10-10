package entities
{
   import §;M§.§"L§;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.geom.Matrix;
   
   public class Effect extends §"L§
   {
      
      public var clip:MovieClip = null;
      
      private var § 7§:Matrix = new Matrix();
      
      public function Effect()
      {
         super();
      }
      
      public function initialise(param1:Class, param2:Number) : void
      {
         this.clip = new param1();
         this.z = param2;
      }
      
      public function §=R§(param1:MovieClip, param2:Number) : void
      {
         this.clip = param1;
         this.z = param2;
      }
      
      override public function process(param1:Number) : void
      {
         if(this.clip.currentFrame == this.clip.totalFrames)
         {
            destroy();
         }
         else
         {
            this.clip.gotoAndStop(this.clip.currentFrame + 1);
         }
      }
      
      override public function draw(param1:BitmapData) : void
      {
         this.§ 7§.identity();
         if(rotation != 0)
         {
            this.§ 7§.rotate(rotation);
         }
         this.§ 7§.translate(x,y);
         this.§ 7§.scale(§?V§.instance.scale,§?V§.instance.scale);
         param1.draw(this.clip,this.§ 7§);
      }
   }
}

