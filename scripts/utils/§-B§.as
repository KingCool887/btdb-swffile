package utils
{
   import §;M§.§&F§;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class §-B§ extends EventDispatcher implements §&F§
   {
      
      public static const TIMER:String = "timer";
      
      public static const COMPLETE:String = "timerComplete";
      
      public static const §!1§:String = "timerDestroyed";
      
      private var §<X§:Number = 0;
      
      private var §!!§:Number = 0;
      
      private var §#@§:Boolean = false;
      
      private var §-X§:int = 0;
      
      private var §%9§:int = 0;
      
      public var extra:Object = null;
      
      public function §-B§(param1:Number = 0, param2:int = 1)
      {
         super();
         this.§<X§ = param1;
         this.§-X§ = param2;
         this.§%9§ = param2;
         this.§"%§();
         this.start();
      }
      
      public static function btd4FramesToSeconds(param1:int) : Number
      {
         return param1 / 35;
      }
      
      public static function btd4FrameTime() : Number
      {
         return btd4FramesToSeconds(1);
      }
      
      public function get delay() : Number
      {
         return this.§<X§;
      }
      
      public function get current() : Number
      {
         return this.§!!§;
      }
      
      public function get running() : Boolean
      {
         return this.§#@§;
      }
      
      public function get §+U§() : int
      {
         return this.§-X§;
      }
      
      public function get §41§() : int
      {
         return this.§%9§;
      }
      
      public function destroy() : void
      {
         dispatchEvent(new Event(§!1§));
      }
      
      public function start() : void
      {
         if(!this.§#@§)
         {
            §?V§.instance.§"0§.§ J§(this);
            this.§#@§ = true;
         }
      }
      
      public function stop() : void
      {
         if(this.§#@§)
         {
            §?V§.instance.§"0§.§ D§(this);
            this.§#@§ = false;
         }
      }
      
      public function reset(param1:Number = -1) : void
      {
         this.stop();
         if(param1 != -1)
         {
            this.§<X§ = param1;
         }
         this.§!!§ = 0;
         this.§-X§ = this.§%9§;
         this.§"%§();
         this.start();
      }
      
      private function §"%§() : void
      {
         if(this.§<X§ <= 0)
         {
            this.§<X§ = 0.032;
         }
         if(this.§<X§ < 0.01 && this.§-X§ == -1)
         {
            this.§<X§ = 0.033;
         }
      }
      
      public function process(param1:Number) : void
      {
         this.§!!§ += param1;
         while(this.§!!§ >= this.§<X§)
         {
            this.§!!§ -= this.§<X§;
            dispatchEvent(new Event(TIMER));
            if(this.§-X§ != -1)
            {
               --this.§-X§;
               if(this.§-X§ == 0)
               {
                  this.stop();
                  this.destroy();
                  dispatchEvent(new Event(COMPLETE));
                  break;
               }
            }
         }
      }
   }
}

