package entities
{
   import §8U§.§52§;
   import §;M§.§"L§;
   import assets.effects.LightningEffect;
   import assets.sound.LightningBoltApprentice;
   import bloons.Bloon;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.Event;
   import sound.§^5§;
   import towers.Tower;
   import utils.§-B§;
   
   public class Lightning extends §"L§
   {
      
      private var §3<§:MovieClip = new LightningEffect();
      
      private var §;?§:MovieClip = null;
      
      private var §7K§:Vector.<Bloon> = new Vector.<Bloon>();
      
      private var owner:Tower = null;
      
      public function Lightning()
      {
         super();
      }
      
      public function initialise(param1:Tower, param2:Bloon) : void
      {
         var dir:§52§;
         var c:int;
         var lifespan:§-B§;
         var tower:Tower = param1;
         var target:Bloon = param2;
         new §^5§(LightningBoltApprentice).play();
         this.owner = tower;
         this.§;?§ = this.§3<§.inner;
         this.§;?§.scaleX = §?V§.instance.scale;
         this.§;?§.scaleY = §?V§.instance.scale;
         dir = new §52§(target.x - tower.x,target.y - tower.y);
         dir.§!X§ = 1;
         this.§]2§(tower.x + dir.x * 20,tower.y + dir.y * 20,target.x,target.y,4);
         c = 0;
         while(c < 3)
         {
            this.path(target,4);
            c++;
         }
         lifespan = new §-B§(1);
         lifespan.addEventListener(§-B§.COMPLETE,function(param1:Event):void
         {
            destroy();
            if(owner.def == null)
            {
               return;
            }
            tower.§^O§.pointer = 0;
         });
         lifespan.start();
         z = 55;
      }
      
      private function §]2§(param1:Number, param2:Number, param3:Number, param4:Number, param5:int) : void
      {
         this.§;?§.graphics.lineStyle(param5 * param5 * 0.33,16777215,1);
         this.§;?§.graphics.moveTo(param1,param2);
         var _loc6_:§52§ = new §52§(param3 - param1,param4 - param2);
         var _loc7_:Number = _loc6_.§!X§;
         var _loc8_:Number = 15 * param5;
         var _loc9_:int = _loc7_ / _loc8_;
         _loc6_.§!X§ = 1;
         var _loc10_:int = 1;
         while(_loc10_ < _loc9_)
         {
            this.§;?§.graphics.lineTo(param1 + _loc6_.x * _loc10_ * _loc8_ + Math.random() * 2.5 * _loc8_ - _loc8_,param2 + _loc6_.y * _loc10_ * _loc8_ + Math.random() * 2.5 * _loc8_ - _loc8_);
            _loc10_++;
         }
         this.§;?§.graphics.lineTo(param3,param4);
      }
      
      public function path(param1:Bloon, param2:int) : void
      {
         var lifespan:§-B§;
         var from:Bloon = param1;
         var depth:int = param2;
         if(this.§7K§.indexOf(from) == -1)
         {
            if(from.type != -1)
            {
               from.damage(1,1,this.owner);
            }
            this.§7K§.push(from);
         }
         if(depth <= 0)
         {
            return;
         }
         lifespan = new §-B§(0.05);
         lifespan.extra = {
            "from":from,
            "x":from.x,
            "y":from.y
         };
         lifespan.addEventListener(§-B§.COMPLETE,function(param1:Event):void
         {
            if(owner.def == null)
            {
               depth = -1;
               destroy();
               return;
            }
            var _loc2_:Number = Number((param1.target as §-B§).extra.x);
            var _loc3_:Number = Number((param1.target as §-B§).extra.y);
            var _loc4_:Bloon = § >§(_loc2_,_loc3_);
            if(_loc4_ == null)
            {
               return;
            }
            §]2§(_loc2_,_loc3_,_loc4_.x,_loc4_.y,depth);
            path(_loc4_,--depth);
            var _loc5_:int = 0;
            while(_loc5_ < 3)
            {
               path(_loc4_,--depth);
               _loc5_++;
            }
         });
         lifespan.start();
      }
      
      public function § >§(param1:Number, param2:Number) : Bloon
      {
         if(this.owner.def == null)
         {
            return null;
         }
         var _loc3_:Vector.<Bloon> = this.owner.levelSlug.§%Y§.§9B§(new §52§(param1,param2),200,this.owner.targetMask,-1,this.§7K§);
         if(_loc3_.length == 0)
         {
            return null;
         }
         return _loc3_[int(_loc3_.length * this.owner.§^O§.random())];
      }
      
      override public function process(param1:Number) : void
      {
         this.§;?§.alpha -= param1;
      }
      
      override public function draw(param1:BitmapData) : void
      {
         param1.draw(this.§3<§);
      }
   }
}

