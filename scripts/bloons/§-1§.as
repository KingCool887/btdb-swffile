package bloons
{
   import flash.utils.Dictionary;
   import projectiles.Projectile;
   
   public class §-1§
   {
      
      private static var §-S§:Dictionary = new Dictionary();
      
      public function §-1§()
      {
         super();
      }
      
      public static function §2"§(param1:Bloon, param2:Projectile) : void
      {
         if(§-S§[param2] == null)
         {
            §-S§[param2] = [param1];
            return;
         }
         var _loc3_:Array = §-S§[param2];
         if(_loc3_.length < 2)
         {
            if(_loc3_[0].overallProgress < param1.overallProgress)
            {
               _loc3_.push(param1);
            }
            else
            {
               _loc3_.unshift(param1);
            }
         }
         if(_loc3_[0].overallProgress > param1.overallProgress)
         {
            _loc3_[0].viralDepth = 0;
            _loc3_[0] = param1;
         }
         else if(_loc3_[1].overallProgress < param1.overallProgress)
         {
            _loc3_[1].viralDepth = 0;
            _loc3_[1] = param1;
         }
         else
         {
            param1.viralDepth = 0;
         }
      }
      
      public static function clear() : void
      {
         §-S§ = new Dictionary();
      }
   }
}

