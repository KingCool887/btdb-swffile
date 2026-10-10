package ninjakiwi.mynk.net
{
   import flash.events.EventDispatcher;
   
   public class API extends EventDispatcher
   {
      
      protected var _api:Object;
      
      public function API()
      {
         super();
      }
      
      public function call(param1:String, ... rest) : *
      {
         var functionName:String = param1;
         var args:Array = rest;
         var result:* = undefined;
         try
         {
            result = this.callFunctionOnObject(this._api,functionName,args);
         }
         catch(e:Error)
         {
         }
         return result;
      }
      
      public function callNested(param1:String, ... rest) : *
      {
         var names:Array = null;
         var resolvedObject:* = undefined;
         var i:int = 0;
         var name:String = null;
         var propertyNames:String = param1;
         var args:Array = rest;
         var result:* = undefined;
         try
         {
            names = propertyNames.split(".");
            resolvedObject = this._api;
            i = 0;
            while(i < names.length - 1)
            {
               name = names[i];
               resolvedObject = resolvedObject[name];
               i++;
            }
            result = this.callFunctionOnObject(resolvedObject,names[names.length - 1],args);
         }
         catch(e:Error)
         {
         }
         return result;
      }
      
      private function callFunctionOnObject(param1:*, param2:String, param3:Array) : *
      {
         var _loc4_:* = undefined;
         var _loc5_:Function = param1[param2];
         return _loc5_.apply(param1,param3);
      }
   }
}

