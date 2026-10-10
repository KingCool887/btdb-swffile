package entities
{
   import §8U§.§52§;
   import §;M§.§"L§;
   import assets.effects.VillageEffect;
   import bloons.Bloon;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.utils.Dictionary;
   import towers.Tower;
   import utils.Rndm;
   
   public class §@W§ extends §"L§
   {
      
      public static var target:Dictionary = new Dictionary();
      
      internal var §3<§:MovieClip = new VillageEffect();
      
      internal var §;?§:MovieClip = null;
      
      internal var §7K§:Vector.<Bloon> = new Vector.<Bloon>();
      
      internal var offset:§52§ = null;
      
      internal var §!-§:Boolean = false;
      
      internal var §9'§:Number = 0;
      
      internal var §>A§:Number = 0;
      
      internal var owner:Tower = null;
      
      public function §@W§()
      {
         super();
      }
      
      public function initialise(param1:Tower, param2:§52§, param3:Bloon) : void
      {
         §@W§.target[param1] = param3;
         this.offset = param2;
         this.§;?§ = this.§3<§.inner;
         this.§;?§.scaleX = §?V§.instance.scale;
         this.§;?§.scaleY = §?V§.instance.scale;
         this.owner = param1;
         z = 55;
      }
      
      override public function process(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         if(this.owner.def == null)
         {
            destroy();
            return;
         }
         if(target[this.owner] != null)
         {
            this.§9'§ = target[this.owner].x;
            this.§>A§ = target[this.owner].y;
         }
         if(!this.§!-§)
         {
            this.§;?§.graphics.clear();
            this.§;?§.graphics.lineStyle(2,16777215,1);
            this.§;?§.graphics.moveTo(this.owner.x + this.offset.x,this.owner.y + this.offset.y);
            _loc2_ = 0.2;
            while(_loc2_ <= 0.8)
            {
               this.§;?§.graphics.lineTo(this.owner.x + this.offset.x + (this.§9'§ - (this.owner.x + this.offset.x)) * _loc2_ + Rndm.random() * 40 - 20,this.owner.y + this.offset.y + (this.§>A§ - (this.owner.y + this.offset.y)) * _loc2_ + Rndm.random() * 40 - 20);
               _loc2_ += 0.2;
            }
            this.§;?§.graphics.lineTo(this.§9'§,this.§>A§);
            if(Math.pow(target[this.owner].x - this.owner.x,2) + Math.pow(target[this.owner].y - this.owner.y,2) > Math.pow(this.owner.def.rangeOfVisibility + 100,2))
            {
               target[this.owner] = null;
               delete target[this.owner];
            }
            if(target[this.owner] == null)
            {
               this.§!-§ = true;
               return;
            }
            if(target[this.owner].type != -1)
            {
               target[this.owner].damage(2,1.5,this.owner);
            }
            if(target[this.owner].type == -1)
            {
               target[this.owner] = null;
               delete target[this.owner];
               this.§!-§ = true;
               return;
            }
            return;
         }
         this.§;?§.alpha -= param1 * 4;
         if(this.§;?§.alpha <= 0)
         {
            destroy();
         }
      }
      
      override public function draw(param1:BitmapData) : void
      {
         param1.draw(this.§3<§);
      }
   }
}

