package §"?§
{
   import flash.display.Bitmap;
   import flash.events.Event;
   import org.osflash.signals.Signal;
   
   public class §2D§
   {
      
      public static var §<6§:Vector.<§9X§> = Vector.<§9X§>([new §[2§(),new §"@§(),new §]P§(),new §!V§(),new §?E§(),new §]Q§(),new §>-§(),new §18§(),new §&<§(),new §1K§(),new §58§(),new §@C§(),new §<,§(),new §57§(),new §+§(),new §6V§(),new §-Y§(),new §+6§(),new §[>§(),new §#'§(),new §0C§(),new §?#§()]);
      
      private static var §64§:int = 0;
      
      public static var §`@§:Signal = new Signal();
      
      private static var count:int = 0;
      
      public function §2D§()
      {
         super();
      }
      
      public static function §<4§() : void
      {
         §64§ = 0;
         §?V§.instance.addEventListener(Event.ENTER_FRAME,§55§);
      }
      
      private static function §55§(param1:Event) : void
      {
         var bitmap:Bitmap = null;
         var e:Event = param1;
         var levelToLoad:§9X§ = §<6§[§64§];
         try
         {
            bitmap = levelToLoad.§[E§;
         }
         catch(Error:*)
         {
         }
         ++§64§;
         if(§64§ >= §<6§.length)
         {
            §?V§.instance.removeEventListener(Event.ENTER_FRAME,§55§);
            §`@§.dispatch();
         }
      }
   }
}

