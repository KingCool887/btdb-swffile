package ninjakiwi.mynk
{
   import flash.events.Event;
   
   public class NKEvent extends Event
   {
      
      public var payload:Object;
      
      public var targetCopy:*;
      
      public function NKEvent(param1:String, param2:Object)
      {
         this.payload = param2;
         super(param1,true);
      }
      
      public static function readUntyped(param1:Object) : NKEvent
      {
         var result:NKEvent;
         var type:String = null;
         var payload:Object = null;
         var target:* = undefined;
         var actuallyNKEvent:Object = param1;
         try
         {
            type = actuallyNKEvent["type"];
            payload = actuallyNKEvent["payload"];
            target = actuallyNKEvent["target"];
         }
         catch(err:Error)
         {
            throw new VerifyError("can\'t convert to NKEvent");
         }
         result = new NKEvent(type,payload);
         result.targetCopy = target;
         return result;
      }
   }
}

