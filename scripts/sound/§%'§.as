package sound
{
   import flash.events.TimerEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import org.osflash.signals.Signal;
   
   public class §%'§
   {
      
      private static var §,P§:Sound;
      
      public static var §9S§:Signal = new Signal();
      
      internal static var §5U§:Number = 0.4;
      
      private static var channel:SoundChannel = null;
      
      public static var §4!§:Boolean = true;
      
      internal static var §]7§:Dictionary = new Dictionary();
      
      private var §!D§:Sound = null;
      
      private var §[9§:Class = null;
      
      internal var §1$§:Number;
      
      public function §%'§(param1:Class)
      {
         super();
         this.§[9§ = param1;
         if(§]7§[param1] == null)
         {
            this.§!D§ = new param1();
            §]7§[param1] = this.§!D§;
         }
         else
         {
            this.§!D§ = §]7§[param1];
         }
      }
      
      public static function §]K§() : void
      {
         §27§ = !§27§;
         §]O§();
         §?V§.instance.profila.bgmOn = §27§;
         §?V§.instance.profila.save();
         §9S§.dispatch();
      }
      
      public static function get §27§() : Boolean
      {
         return §4!§;
      }
      
      public static function set §27§(param1:Boolean) : void
      {
         if(§4!§ == param1)
         {
            return;
         }
         §4!§ = param1;
         §]O§();
         §9S§.dispatch();
      }
      
      private static function §]O§() : void
      {
         if(channel != null)
         {
            if(§27§)
            {
               channel.soundTransform = new SoundTransform(§5U§);
            }
            else
            {
               channel.soundTransform = new SoundTransform(0);
            }
         }
      }
      
      internal function §72§() : void
      {
         this.§1$§ = §5U§;
         var _loc1_:Timer = new Timer(1000 / 30,30);
         _loc1_.start();
         _loc1_.addEventListener(TimerEvent.TIMER,this.§%0§);
         _loc1_.addEventListener(TimerEvent.TIMER_COMPLETE,this.§2M§);
      }
      
      internal function §%0§(param1:TimerEvent) : void
      {
         this.§1$§ -= §5U§ / 30;
         if(§27§)
         {
            channel.soundTransform = new SoundTransform(this.§1$§);
         }
      }
      
      internal function §2M§(param1:TimerEvent) : void
      {
         param1.target.removeEventListener(TimerEvent.TIMER,this.§%0§);
         param1.target.removeEventListener(TimerEvent.TIMER_COMPLETE,this.§2M§);
         channel.stop();
         this.§5K§(§,P§);
         §,P§ = null;
      }
      
      public function play() : void
      {
         if(channel != null)
         {
            if(!§,P§)
            {
               this.§72§();
            }
            §,P§ = this.§!D§;
            return;
         }
         this.§5K§(this.§!D§);
      }
      
      private function §5K§(param1:Sound) : void
      {
         channel = param1.play(0,999999,new SoundTransform(§5U§));
         §]O§();
      }
   }
}

