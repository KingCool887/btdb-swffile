package ninjakiwi.mynk.save
{
   public class CallbackValidator
   {
      
      public function CallbackValidator()
      {
         super();
      }
      
      public static function applyCallback(param1:Function, param2:Array, param3:String) : void
      {
         var callback:Function = param1;
         var args:Array = param2;
         var onErrorMessage:String = param3;
         if(args.length < 1)
         {
         }
         try
         {
            callback.apply(null,args);
         }
         catch(e:Error)
         {
         }
      }
   }
}

