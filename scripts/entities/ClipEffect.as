package entities
{
   import §;M§.§"L§;
   import display.Clip;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class ClipEffect extends §"L§
   {
      
      public static const DONE:String = "done";
      
      public var clip:Clip = new Clip();
      
      public function ClipEffect()
      {
         super();
      }
      
      public function initialise(param1:Class) : void
      {
         this.clip.initialise(param1,1);
      }
      
      override public function process(param1:Number) : void
      {
         if(this.clip.frameIndex == this.clip.frameCount - 1)
         {
            dispatchEvent(new Event(DONE));
            destroy();
            return;
         }
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

