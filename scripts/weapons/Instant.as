package weapons
{
   import §8U§.§52§;
   import §;M§.§"L§;
   import bloons.Bloon;
   import projectiles.Projectile;
   import projectiles.def.ProjectileDef;
   import towers.Tower;
   import utils.Pool;
   
   public class Instant extends Standard
   {
      
      internal var tempAngle:§52§ = new §52§();
      
      public function Instant(param1:String = null)
      {
         super(param1);
      }
      
      public function Range(param1:Number) : Instant
      {
         range = param1;
         return this;
      }
      
      public function ReloadTime(param1:Number) : Instant
      {
         reloadTime = param1;
         return this;
      }
      
      public function Power(param1:Number) : Instant
      {
         power = param1;
         return this;
      }
      
      public function Projectile(param1:ProjectileDef) : Instant
      {
         projectile = param1;
         return this;
      }
      
      public function Proxied(param1:Boolean) : Instant
      {
         proxied = param1;
         return this;
      }
      
      override public function execute(param1:Tower, param2:§"L§, param3:§"L§, param4:§52§ = null) : void
      {
         var _loc9_:Bloon = null;
         var _loc5_:* = null;
         var _loc6_:* = int(param1.§+A§.length - 1);
         while(_loc6_ >= 0)
         {
            _loc9_ = param1.§+A§[_loc6_];
            if(_loc9_.type != -1)
            {
               if(_loc9_.levelSlug.§#1§ == param1.levelSlug.§#1§)
               {
                  _loc5_ = _loc9_;
                  break;
               }
            }
            _loc6_--;
         }
         if(_loc5_ == null)
         {
            param1.clip.gotoAndStop(0);
            return;
         }
         var _loc7_:projectiles.Projectile = Pool.get(projectiles.Projectile);
         _loc7_.initialise(projectile,param1.levelSlug);
         _loc7_.owner = param1;
         var _loc8_:Bloon = _loc5_ as Bloon;
         _loc8_.§99§(_loc7_);
         _loc7_.destroy();
         this.tempAngle.x = _loc5_.x - param1.x;
         this.tempAngle.y = _loc5_.y - param1.y;
         param1.rotation = this.tempAngle.rotation;
      }
   }
}

