package towers.behavior.process
{
   import §8U§.§4&§;
   import §8U§.§52§;
   import bloons.Bloon;
   import entities.§^X§;
   import events.PropertyModEvent;
   import projectiles.Projectile;
   import projectiles.def.ProjectileDef;
   import towers.Tower;
   import towers.behavior.initialise.DeployRay;
   import towers.def.TowerDef;
   import weapons.FireAtReticle;
   
   public class RayDamage extends BehaviorProcess
   {
      
      private static var bloonPos:§52§ = new §52§();
      
      private static var lineStart:§52§ = new §52§();
      
      private static var lineEnd:§52§ = new §52§();
      
      private static var testProjectile:projectiles.Projectile = null;
      
      private var vec:§52§ = new §52§();
      
      private var projectile_:ProjectileDef;
      
      public function RayDamage()
      {
         super();
      }
      
      public function set projectile(param1:ProjectileDef) : void
      {
         if(this.projectile_ != param1)
         {
            this.projectile_ = param1;
            dispatchEvent(new PropertyModEvent("projectile"));
         }
      }
      
      public function get projectile() : ProjectileDef
      {
         return this.projectile_;
      }
      
      public function Projectile(param1:ProjectileDef) : RayDamage
      {
         this.projectile = param1;
         return this;
      }
      
      override public function process(param1:Tower, param2:Number) : void
      {
         var _loc4_:Bloon = null;
         var _loc5_:§52§ = null;
         var _loc7_:§^X§ = null;
         var _loc8_:* = undefined;
         var _loc9_:§52§ = null;
         if(testProjectile == null)
         {
            testProjectile = new projectiles.Projectile();
            testProjectile.initialise(this.projectile,param1.levelSlug);
         }
         testProjectile.owner = param1;
         lineStart.x = param1.x;
         lineStart.y = param1.y;
         lineEnd.x = 1;
         lineEnd.y = 0;
         lineEnd.rotation = param1.rotation;
         lineEnd.§!X§ = 1000;
         var _loc3_:int = 0;
         for each(_loc4_ in param1.levelSlug.allBloons)
         {
            if(!_loc4_.§ !§)
            {
               bloonPos.x = _loc4_.x;
               bloonPos.y = _loc4_.y;
               _loc8_ = §4&§.§#D§(lineStart,lineEnd,bloonPos,_loc4_.radius);
               if(_loc8_)
               {
                  _loc4_.§99§(testProjectile);
                  if(++_loc3_ >= 100)
                  {
                     break;
                  }
               }
            }
         }
         lineStart.x = 1;
         lineStart.y = 0;
         lineStart.rotation = param1.rotation;
         _loc5_ = new §52§();
         if(param1.targetingSystem == TowerDef.TARGETS_MOUSE)
         {
            _loc9_ = param1.levelSlug.§#"§();
            _loc5_.x = _loc9_.x;
            _loc5_.y = _loc9_.y;
         }
         else if(param1.targetingSystem == TowerDef.TARGETS_RETICLE)
         {
            _loc5_ = FireAtReticle.GetLocation(param1);
         }
         lineEnd.x = _loc5_.x - param1.x;
         lineEnd.y = _loc5_.y - param1.y;
         lineEnd.§!X§ = 3000;
         var _loc6_:Number = lineStart.§^1§(lineEnd);
         if(isNaN(_loc6_))
         {
            _loc6_ = 0;
         }
         param1.rotation += _loc6_ / 5;
         _loc7_ = DeployRay.rays[param1];
         if(_loc7_ != null)
         {
            lineStart.x = 1;
            lineStart.y = 0;
            lineStart.rotation = param1.rotation;
            lineStart.§!X§ = 64;
            _loc7_.x = param1.x + lineStart.x;
            _loc7_.y = param1.y + lineStart.y;
            _loc7_.rotation = param1.rotation;
         }
      }
   }
}

