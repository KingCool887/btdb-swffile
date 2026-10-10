package abilities
{
   import §+C§.§0>§;
   import abilities.def.AbilityDef;
   import abilities.def.BloonAreaDenialSystemDef;
   import bloons.Bloon;
   import flash.events.Event;
   import projectiles.Projectile;
   import towers.Tower;
   import utils.§-B§;
   import utils.Pool;
   
   public class BloonAreaDenialSystem extends Ability
   {
      
      private var levelSlug:§0>§;
      
      public function BloonAreaDenialSystem()
      {
         super();
      }
      
      override public function execute(param1:Tower, param2:AbilityDef) : void
      {
         var tower:Tower = param1;
         var def:AbilityDef = param2;
         var pulseTimer:§-B§ = new §-B§(2,5);
         this.levelSlug = tower.levelSlug;
         pulseTimer.addEventListener(§-B§.TIMER,function(param1:Event):void
         {
            var _loc6_:Bloon = null;
            var _loc7_:Projectile = null;
            var _loc2_:Vector.<Bloon> = levelSlug.allBloons;
            var _loc5_:int = 0;
            for each(_loc6_ in _loc2_)
            {
               if(_loc5_ > 100)
               {
                  break;
               }
               if(!_loc6_.§ !§)
               {
                  _loc7_ = Pool.get(Projectile);
                  _loc7_.initialise((def as BloonAreaDenialSystemDef).projectile,levelSlug);
                  _loc7_.owner = tower;
                  _loc7_.x = tower.x;
                  _loc7_.y = tower.y;
                  _loc7_.lifespan = 1250 / 1225;
                  _loc7_.§#J§.x = _loc6_.x - _loc7_.x;
                  _loc7_.§#J§.y = _loc6_.y - _loc7_.y;
                  _loc7_.§#J§.§!X§ = 1225;
                  _loc7_.rotation = _loc7_.§#J§.rotation;
                  levelSlug.addProjectile(_loc7_);
                  _loc5_++;
               }
            }
         });
         pulseTimer.start();
         pulseTimer.process(1.99);
         super.execute(tower,def);
      }
   }
}

