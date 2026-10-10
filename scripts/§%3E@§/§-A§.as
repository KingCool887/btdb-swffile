package §>@§
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public final class §-A§
   {
      
      public static const § H§:String = "ding ding";
      
      public static const §;!§:EventDispatcher = new EventDispatcher();
      
      private static const §3A§:Array = [new §5=§(),new §5=§(),new §5=§()];
      
      §5=§.§;!§.addEventListener(§5=§.§ H§,function(param1:Event):void
      {
         §;!§.dispatchEvent(new Event(§ H§));
      });
      
      public function §-A§()
      {
         super();
      }
      
      public static function §]H§(param1:Number = 0) : §<<§
      {
         var _loc2_:§5=§ = null;
         if(§3A§.length == 0)
         {
            return new §5=§(param1);
         }
         _loc2_ = §3A§.pop();
         _loc2_.value = param1;
         return _loc2_;
      }
      
      public static function §&!§(param1:§<<§) : void
      {
         param1.value = 0;
         §3A§.push(param1);
      }
   }
}

