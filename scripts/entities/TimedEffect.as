package entities
{
   import §;M§.§"L§;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Matrix;
   import towers.Tower;
   import utils.§-B§;
   
   public class TimedEffect extends §"L§
   {
      
      public var clip:MovieClip = null;
      
      private var transform:Matrix = new Matrix();
      
      private var timer:§-B§ = null;
      
      private var tower:Tower = null;
      
      public function TimedEffect()
      {
         super();
      }
      
      public function initialise(param1:Class, param2:Number, param3:Number, param4:Tower = null) : void
      {
         this.tower = param4;
         this.clip = new param1();
         this.timer = new §-B§(param3);
         this.timer.start();
         this.z = param2;
      }
      
      public function initialiseMC(param1:MovieClip, param2:Number) : void
      {
         this.clip = param1;
         this.z = param2;
      }
      
      override public function destroy() : void
      {
         dispatchEvent(new Event("done"));
         super.destroy();
      }
      
      override public function process(param1:Number) : void
      {
         if(this.clip.currentFrame == this.clip.totalFrames)
         {
            this.clip.gotoAndStop("Loop");
         }
         else
         {
            this.clip.gotoAndStop(this.clip.currentFrame + 1);
         }
         if(this.timer != null && !this.timer.running || this.tower != null && this.tower.def == null)
         {
            this.destroy();
         }
      }
      
      override public function draw(param1:BitmapData) : void
      {
         this.transform.identity();
         if(rotation != 0)
         {
            this.transform.rotate(rotation);
         }
         this.transform.translate(x,y);
         this.transform.scale(§?V§.instance.scale,§?V§.instance.scale);
         param1.draw(this.clip,this.transform);
      }
   }
}

