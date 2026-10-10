package weapons
{
   import §+C§.§0>§;
   import §8U§.§52§;
   import §;M§.§"L§;
   import §>$§.§10§;
   import assets.occupiedSpace.Small;
   import assets.towers.EngineerSentryBuild;
   import entities.ClipEffect;
   import events.PropertyModEvent;
   import flash.display.MovieClip;
   import flash.events.Event;
   import game.§9=§;
   import projectiles.def.ProjectileDef;
   import towers.Tower;
   import towers.def.AreaEffectDef;
   import towers.def.TowerDef;
   import towers.upgrades.UpgradeDef;
   import utils.§-B§;
   
   public class CreateSentry extends Standard
   {
      
      private var rotate_:Boolean = true;
      
      private var offsetTemp:§52§ = new §52§();
      
      private var sentry_:String = null;
      
      public function CreateSentry(param1:String = null)
      {
         super(param1);
      }
      
      public static function addDestroyer(param1:Tower) : void
      {
         var destroyTimer:§-B§ = new §-B§(19.6);
         destroyTimer.extra = Vector.<Tower>([param1]);
         destroyTimer.addEventListener("timerComplete",function(param1:Event):void
         {
            var _loc2_:Tower = (param1.target as §-B§).extra[0];
            if(_loc2_.def != null)
            {
               var levelSlug:§0>§ = _loc2_.levelSlug;
               levelSlug.removeTower(_loc2_);
               _loc2_.destroy();
            }
         });
      }
      
      public function Range(param1:Number) : CreateSentry
      {
         range = param1;
         return this;
      }
      
      public function ReloadTime(param1:Number) : CreateSentry
      {
         reloadTime = param1;
         return this;
      }
      
      public function Power(param1:Number) : CreateSentry
      {
         power = param1;
         return this;
      }
      
      public function Projectile(param1:ProjectileDef) : CreateSentry
      {
         projectile = param1;
         return this;
      }
      
      public function Proxied(param1:Boolean) : CreateSentry
      {
         proxied = param1;
         return this;
      }
      
      public function set rotate(param1:Boolean) : void
      {
         if(this.rotate_ != param1)
         {
            this.rotate_ = param1;
            dispatchEvent(new PropertyModEvent("rotate"));
         }
      }
      
      public function get rotate() : Boolean
      {
         return this.rotate_;
      }
      
      public function Rotate(param1:Boolean) : CreateSentry
      {
         this.rotate = param1;
         return this;
      }
      
      public function set sentry(param1:String) : void
      {
         if(this.sentry_ != param1)
         {
            this.sentry_ = param1;
            dispatchEvent(new PropertyModEvent("sentry"));
         }
      }
      
      public function get sentry() : String
      {
         return this.sentry_;
      }
      
      public function Sentry(param1:String) : CreateSentry
      {
         this.sentry = param1;
         return this;
      }
      
      override public function execute(param1:Tower, param2:§"L§, param3:§"L§, param4:§52§ = null) : void
      {
         var container:MovieClip;
         var i:int;
         var specialtyUpgrade:Vector.<UpgradeDef>;
         var areaEffects:Vector.<AreaEffectDef>;
         var destroyTimer:§-B§;
         var sentryDef:TowerDef;
         var sentryTower:Tower;
         var ocupied:MovieClip;
         var u:UpgradeDef;
         var effect:ClipEffect;
         var areaEffect:AreaEffectDef;
         var tower:Tower;
         var spawnFrom:§"L§;
         var target:§"L§;
         var offset:§52§;
         var sentryDesc:§9=§;
         if(§?V§.instance.§"0§.§-W§ != param1.levelSlug)
         {
            return;
         }
         sentryDef = null;
         sentryTower = null;
         ocupied = null;
         u = null;
         effect = null;
         areaEffect = null;
         tower = param1;
         spawnFrom = param2;
         target = param3;
         offset = param4;
         sentryDef = §?V§.instance.§=K§.§4§(tower.def.id == "Sprockets" || tower.def.id == "Overclock" ? "SentrySprockets" : "Sentry");
         sentryTower = new Tower();
         this.offsetTemp.§`1§(Math.random() * 2 * Math.PI,Math.random() * (tower.def.rangeOfVisibility - 40) + 40);
         sentryTower.x = tower.x + this.offsetTemp.x;
         sentryTower.y = tower.y + this.offsetTemp.y;
         ocupied = new Small();
         container = new MovieClip();
         container.addChild(ocupied);
         ocupied.x = sentryTower.x;
         ocupied.y = sentryTower.y;
         i = 0;
         while(i < 60)
         {
            if(param1.levelSlug.§,D§(container))
            {
               break;
            }
            this.offsetTemp.§`1§(Math.random() * 2 * Math.PI,Math.random() * (tower.def.rangeOfVisibility - 40) + 40);
            sentryTower.x = tower.x + this.offsetTemp.x;
            sentryTower.y = tower.y + this.offsetTemp.y;
            ocupied.x = sentryTower.x;
            ocupied.y = sentryTower.y;
            i++;
         }
         areaEffects = param1.levelSlug.§,L§(sentryTower.x,sentryTower.y,sentryTower);
         if(areaEffects != null)
         {
            for each(areaEffect in areaEffects)
            {
               if(areaEffect.upgrade != null)
               {
                  sentryTower.§0,§ = sentryDef;
                  sentryTower.§7+§(areaEffect.upgrade,false);
               }
            }
         }
         sentryTower.§`!§ = sentryDef.id;
         sentryTower.initialise(sentryDef,param1.levelSlug);
         sentryTower.id = String(Tower.§20§++);
         sentryDesc = new §9=§(sentryTower.id,sentryDef.id,sentryTower.x,sentryTower.y,sentryTower.rotation,0);
         §10§.instance.§<S§(sentryDesc);
         effect = new ClipEffect();
         effect.initialise(EngineerSentryBuild);
         effect.x = sentryTower.x;
         effect.y = sentryTower.y;
         effect.z = tower.z;
         effect.addEventListener(ClipEffect.DONE,function(param1:Event):*
         {
            sentryTower.pause = false;
            sentryTower.pauseDraw = false;
            effect.removeEventListener(ClipEffect.DONE,arguments.callee);
         });
         param1.levelSlug.§?3§(effect);
         sentryTower.pause = true;
         sentryTower.pauseDraw = true;
         sentryTower.parentTower = tower;
         param1.levelSlug.addTower(sentryTower);
      }
   }
}

