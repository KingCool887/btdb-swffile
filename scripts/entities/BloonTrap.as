package entities
{
   import §+C§.§0>§;
   import §8$§.§7;§;
   import §8U§.§52§;
   import §;M§.§"L§;
   import assets.gui.PopCash;
   import assets.projectile.MediumExplosion;
   import assets.towers.Bloontrap;
   import assets.towers.BloontrapBuild;
   import assets.towers.BloontrapExplode;
   import bloons.Bloon;
   import display.Clip;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import projectiles.Projectile;
   import projectiles.def.DamageEffectDef;
   import projectiles.def.ProjectileDef;
   import towers.Tower;
   import towers.behavior.process.CreateBloonTrap;
   import utils.Pool;
   
   public class BloonTrap extends §"L§
   {
      
      private static var explosion:ProjectileDef = new ProjectileDef().Display(MediumExplosion).Pierce(40).Radius(60).DamageEffect(new DamageEffectDef().Damage(1).CanBreakIce(true).CantBreak(Vector.<int>([Bloon.§''§,Bloon.§07§])).ShowPop(false));
      
      public var tile:§7;§;
      
      public var tileProgress:Number = 0;
      
      public var radius:Number = 30;
      
      public var radius2:Number = this.radius * this.radius;
      
      public var clip:Clip = new Clip();
      
      public var rbeCount:Number = 0;
      
      public var maxRBE:Number = 250;
      
      public var velocity:§52§ = new §52§(20,0);
      
      public var owner:Tower = null;
      
      public var cash:Number = 0;
      
      public var explodeTime:Number = 0;
      
      public var pauseDraw:Boolean = true;
      
      private var isEnemy:Boolean = false;
      
      private var levelSlug:§0>§ = null;
      
      public function BloonTrap()
      {
         super();
      }
      
      public static function closest(search:Vector.<§52§>, x:Number, y:Number) : §52§
      {
         var minDist:Number = 100000000;
         var selected:§52§ = null;
         for each(var t in search)
         {
            var dx:Number = t.x - x;
            var dy:Number = t.y - y;
            var dist:Number = dx * dx + dy * dy;
            if(dist <= minDist)
            {
               minDist = dist;
               selected = t;
            }
         }
         return selected;
      }
      
      public function initialise(param1:§7;§, param2:Number, param3:Tower) : void
      {
         var trackPoints:Vector.<§52§>;
         var clipEffect:ClipEffect = null;
         var spawnPoint:§52§ = null;
         var tile:§7;§ = param1;
         var tileProgress:Number = param2;
         var owner:Tower = param3;
         this.owner = owner;
         this.levelSlug = owner.levelSlug;
         this.isEnemy = §?V§.instance.§"0§.§-W§ != this.levelSlug;
         this.clip.initialise(Bloontrap,0);
         if(!this.isEnemy)
         {
            §?V§.instance.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.click);
         }
         trackPoints = this.levelSlug.§?J§(new §52§(owner.x,owner.y),owner.def.rangeOfVisibility);
         if(trackPoints.length != 0)
         {
            spawnPoint = closest(trackPoints,owner.x,owner.y);
            x = spawnPoint.x;
            y = spawnPoint.y;
         }
         else
         {
            x = owner.x + owner.§^O§.random() * 100 - 50;
            y = owner.y + owner.§^O§.random() * 100 - 50;
         }
         rotation = owner.§^O§.random() * Math.PI * 2;
         clipEffect = new ClipEffect();
         clipEffect.x = x;
         clipEffect.y = y;
         clipEffect.rotation = rotation;
         clipEffect.initialise(BloontrapBuild);
         this.levelSlug.§?3§(clipEffect);
         clipEffect.addEventListener(ClipEffect.DONE,function(param1:Event):*
         {
            pauseDraw = false;
            clipEffect.removeEventListener(ClipEffect.DONE,arguments.callee);
         });
      }
      
      public function click(param1:MouseEvent) : *
      {
         var _loc2_:Number = NaN;
         if(this.rbeCount >= this.maxRBE || z == 999)
         {
            _loc2_ = Math.pow(param1.localX - x,2) + Math.pow(param1.localY - y,2);
            if(_loc2_ < this.radius2)
            {
               if(this.cash > 0)
               {
                  this.addCash(this.cash * 2);
               }
               this.destroy();
               if(this.owner.def != null)
               {
                  §?V§.instance.§"0§.§-W§.§"B§.dispatch(this.owner.id,"ClickTrap");
               }
            }
         }
      }
      
      private function addCash(param1:Number) : void
      {
         var _loc2_:PopCash = new PopCash();
         _loc2_.x = x;
         _loc2_.y = y;
         _loc2_.mouseEnabled = false;
         _loc2_.mouseChildren = false;
         _loc2_.label.text = "$" + String(int(param1));
         §?V§.instance.§"0§.§ 2§.addChild(_loc2_);
         this.levelSlug.§4>§(param1);
      }
      
      public function completePath() : void
      {
         this.destroy();
      }
      
      override public function destroy() : void
      {
         if(CreateBloonTrap.hasTrap[this.owner] != null)
         {
            delete CreateBloonTrap.hasTrap[this.owner];
         }
         if(!this.isEnemy)
         {
            §?V§.instance.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.click);
         }
         super.destroy();
      }
      
      public function get isInTunnel() : Boolean
      {
         if(this.tile == null)
         {
            return false;
         }
         return this.tile.§]V§ == §7;§.underpass && this.tileProgress > this.radius && this.tileProgress < this.tile.§-N§ - this.radius || this.tile.§]V§ == §7;§.§17§;
      }
      
      override public function process(param1:Number) : void
      {
         var _loc2_:Bloon = null;
         var _loc3_:Number = NaN;
         var _loc4_:Projectile = null;
         if(this.rbeCount < this.maxRBE)
         {
            for each(_loc2_ in this.levelSlug.allBloons)
            {
               if(_loc2_.type < Bloon.MOAB)
               {
                  _loc3_ = Math.pow(_loc2_.x - x,2) + Math.pow(_loc2_.y - y,2);
                  if(_loc3_ < this.radius2)
                  {
                     this.rbeCount += _loc2_.§[&§;
                     this.cash += _loc2_.§[&§ * 0.5;
                     _loc2_.destroy();
                     this.clip.gotoLabel("Fire");
                     this.clip.play();
                     if(this.rbeCount >= this.maxRBE)
                     {
                        break;
                     }
                  }
               }
            }
         }
         else
         {
            if(this.velocity.x == 20)
            {
               this.clip.initialise(BloontrapExplode,0);
               this.clip.looping = true;
               this.clip.play();
               this.velocity.x = 21;
               z = 999;
               this.levelSlug.§;$§ = true;
            }
            this.explodeTime += param1;
            if(this.explodeTime >= 5)
            {
               _loc4_ = Pool.get(Projectile);
               _loc4_.initialise(explosion,this.levelSlug);
               _loc4_.owner = this.owner;
               _loc4_.x = x;
               _loc4_.y = y;
               _loc4_.lifespan = 0.1;
               this.levelSlug.addProjectile(_loc4_);
               this.addCash(this.cash);
               this.destroy();
            }
         }
         this.clip.process();
      }
      
      override public function draw(param1:BitmapData) : void
      {
         if(this.pauseDraw)
         {
            return;
         }
         if(!this.isInTunnel)
         {
            this.clip.drawRotated(param1,x,y,rotation);
         }
      }
   }
}

