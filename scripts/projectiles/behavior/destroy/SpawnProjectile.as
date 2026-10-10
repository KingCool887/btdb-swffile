package projectiles.behavior.destroy
{
   import assets.projectile.BurnyLargeExplosion;
   import assets.projectile.BurnyMediumExplosion;
   import assets.projectile.BurnyNuclearExplosion;
   import assets.projectile.CorrosiveSplat;
   import assets.projectile.DissloverShot;
   import assets.projectile.GlueSplat;
   import assets.projectile.LargeExplosion;
   import assets.projectile.MediumExplosion;
   import assets.projectile.NuclearExplosion;
   import assets.projectile.SmallExplosion;
   import assets.sound.GlueSplatter;
   import assets.sounds.ExplosionBig;
   import assets.sounds.ExplosionHuge;
   import assets.sounds.ExplosionMedium;
   import assets.sounds.ExplosionSmall;
   import events.PropertyModEvent;
   import projectiles.Projectile;
   import projectiles.def.ProjectileDef;
   import sound.§^5§;
   import utils.Pool;
   
   public class SpawnProjectile extends BehaviorDestroy
   {
      
      private var projectile_:ProjectileDef;
      
      private var lifespan_:Number = 0.1;
      
      public function SpawnProjectile()
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
      
      public function Projectile(param1:ProjectileDef) : SpawnProjectile
      {
         this.projectile = param1;
         return this;
      }
      
      public function set lifespan(param1:Number) : void
      {
         if(this.lifespan_ != param1)
         {
            this.lifespan_ = param1;
            dispatchEvent(new PropertyModEvent("lifespan"));
         }
      }
      
      public function get lifespan() : Number
      {
         return this.lifespan_;
      }
      
      public function Lifespan(param1:Number) : SpawnProjectile
      {
         this.lifespan = param1;
         return this;
      }
      
      override public function execute(param1:projectiles.Projectile) : void
      {
         param1.pierce = 0;
         var _loc2_:projectiles.Projectile = Pool.get(projectiles.Projectile);
         _loc2_.initialise(this.projectile,param1.levelSlug);
         if(_loc2_.def.display == GlueSplat && param1.def.display == DissloverShot)
         {
            _loc2_.clip.initialise(CorrosiveSplat,1);
         }
         _loc2_.owner = param1.owner;
         if(param1.§>X§.x != Number.MAX_VALUE)
         {
            _loc2_.x = param1.§>X§.x;
            _loc2_.y = param1.§>X§.y;
         }
         else
         {
            _loc2_.x = param1.x;
            _loc2_.y = param1.y;
         }
         _loc2_.lifespan = this.lifespan;
         _loc2_.rotation = param1.rotation;
         if(this.projectile.display == SmallExplosion)
         {
            new §^5§(ExplosionSmall).play();
         }
         if(this.projectile.display == MediumExplosion || this.projectile.display == BurnyMediumExplosion)
         {
            new §^5§(ExplosionMedium).play();
         }
         if(this.projectile.display == LargeExplosion || this.projectile.display == BurnyLargeExplosion)
         {
            new §^5§(ExplosionBig).play();
         }
         if(this.projectile.display == NuclearExplosion || this.projectile.display == BurnyNuclearExplosion)
         {
            new §^5§(ExplosionHuge).play();
         }
         if(this.projectile.display == GlueSplat)
         {
            new §^5§(GlueSplatter).play();
         }
         param1.levelSlug.addProjectile(_loc2_);
      }
   }
}

