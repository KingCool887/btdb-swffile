package sound
{
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import org.osflash.signals.Signal;
   
   public class §^5§
   {
      
      public static var §53§:Signal = new Signal();
      
      internal static var §@F§:Dictionary = new Dictionary();
      
      internal static var §]7§:Dictionary = new Dictionary();
      
      internal static var §+L§:Vector.<SoundChannel> = new Vector.<SoundChannel>();
      
      internal static var §=U§:Dictionary = new Dictionary();
      
      private static var §4!§:Boolean = true;
      
      private var §!D§:Sound = null;
      
      private var §[9§:Class = null;
      
      public function §^5§(param1:Class)
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
         if(§@F§[param1] == null)
         {
            §@F§[param1] = 0;
         }
         if(§=U§[param1] == null)
         {
            §=U§[param1] = true;
         }
      }
      
      public static function §]K§() : void
      {
         §27§ = !§27§;
         §67§();
         §?V§.instance.profila.sfxOn = §27§;
         §?V§.instance.profila.save();
         §53§.dispatch();
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
         §67§();
         §53§.dispatch();
      }
      
      private static function §67§() : void
      {
         var _loc1_:SoundChannel = null;
         var _loc2_:* = undefined;
         if(!§27§)
         {
            for each(_loc1_ in §+L§)
            {
               _loc1_.stop();
            }
            §+L§.splice(0,§+L§.length);
            for each(_loc2_ in §]7§)
            {
               §@F§[Class(getDefinitionByName(getQualifiedClassName(_loc2_)))] = 0;
            }
         }
      }
      
      public function play(param1:Number = 1, param2:Number = 0) : void
      {
         var channel:SoundChannel = null;
         var timer:Timer = null;
         var minInterval:Number = param1;
         var loops:Number = param2;
         if(!§27§)
         {
            return;
         }
         if(§@F§[this.§[9§] >= 5 || !§=U§[this.§[9§])
         {
            return;
         }
         channel = this.§!D§.play(0,loops);
         if(channel == null)
         {
            return;
         }
         §+L§.push(channel);
         ++§@F§[this.§[9§];
         channel.addEventListener(Event.SOUND_COMPLETE,function(param1:Event):void
         {
            --§@F§[§[9§];
            §+L§.splice(§+L§.indexOf(SoundChannel(param1.target)),1);
            channel.removeEventListener(Event.SOUND_COMPLETE,arguments.callee);
         });
         §=U§[this.§[9§] = false;
         timer = new Timer(minInterval * 0.01 * 1000,1);
         timer.start();
         timer.addEventListener(TimerEvent.TIMER,function(param1:Event):void
         {
            §=U§[§[9§] = true;
            timer.removeEventListener(TimerEvent.TIMER,arguments.callee);
         });
      }
   }
}

