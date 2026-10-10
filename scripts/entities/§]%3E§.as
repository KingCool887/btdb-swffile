package entities
{
   import §8U§.§!=§;
   import §8U§.§%L§;
   import §8U§.§52§;
   import §8U§.CubicBezierDef;
   import §;M§.§"L§;
   import assets.projectile.BombAce;
   import display.Clip;
   import flash.display.BitmapData;
   import flash.events.Event;
   import towers.Tower;
   import utils.§-B§;
   import weapons.HasReloadTime;
   import weapons.Weapon;
   
   public class §]>§ extends §"L§
   {
      
      private var animationTimer:§-B§ = new §-B§(6);
      
      private var clip:Clip = new Clip();
      
      private var §92§:§!=§ = null;
      
      private var §=H§:§52§ = new §52§();
      
      private var to:§52§ = new §52§();
      
      private var weapon:Vector.<Weapon> = null;
      
      private var §0W§:Vector.<§-B§> = null;
      
      private var tower:Tower = null;
      
      private var offest1:§52§ = new §52§(0,-8);
      
      private var offest2:§52§ = new §52§(0,8);
      
      public function §]>§()
      {
         super();
      }
      
      public function initialise(param1:Tower, param2:§"L§, param3:Vector.<Weapon>) : void
      {
         var rightSideDef:CubicBezierDef;
         var leftSideDef:CubicBezierDef;
         var rightSide:§%L§;
         var leftSide:§%L§;
         var w:Weapon = null;
         var t:§-B§ = null;
         var tower:Tower = param1;
         var target:§"L§ = param2;
         var weapons:Vector.<Weapon> = param3;
         if(target == null)
         {
            return;
         }
         this.weapon = weapons;
         this.tower = tower;
         this.clip.initialise(BombAce,32);
         this.animationTimer.start();
         this.animationTimer.addEventListener(§-B§.COMPLETE,function(param1:Event):void
         {
            destroy();
            animationTimer.removeEventListener(§-B§.COMPLETE,arguments.callee);
         });
         this.to.x = -(target.y - tower.y);
         this.to.y = target.x - tower.x;
         this.to.§!X§ = 100;
         rightSideDef = null;
         leftSideDef = null;
         if(target.y < tower.y)
         {
            rightSideDef = new CubicBezierDef().A(new §52§(tower.x,tower.y)).B(new §52§(tower.x + 400,tower.y - 100)).C(new §52§(target.x + this.to.x,target.y + this.to.y)).D(new §52§(target.x,target.y));
            leftSideDef = new CubicBezierDef().A(new §52§(target.x,target.y)).B(new §52§(target.x - this.to.x,target.y - this.to.y)).C(new §52§(tower.x - 400,tower.y)).D(new §52§(tower.x,tower.y));
         }
         else
         {
            rightSideDef = new CubicBezierDef().A(new §52§(tower.x,tower.y)).B(new §52§(tower.x + 400,tower.y + 100)).C(new §52§(target.x - this.to.x,target.y - this.to.y)).D(new §52§(target.x,target.y));
            leftSideDef = new CubicBezierDef().A(new §52§(target.x,target.y)).B(new §52§(target.x + this.to.x,target.y + this.to.y)).C(new §52§(tower.x - 400,tower.y)).D(new §52§(tower.x,tower.y));
         }
         rightSide = new §%L§();
         rightSide.initialise(rightSideDef);
         leftSide = new §%L§();
         leftSide.initialise(leftSideDef);
         this.§92§ = new §!=§();
         this.§92§.initialise(Vector.<§%L§>([rightSide,leftSide]));
         this.§0W§ = new Vector.<§-B§>();
         for each(w in weapons)
         {
            t = new §-B§((w as HasReloadTime).reloadTime);
            t.start();
            this.§0W§.push(t);
         }
         z = 50;
      }
      
      override public function process(param1:Number) : void
      {
         var _loc3_:§-B§ = null;
         var _loc4_:§52§ = null;
         if(!this.§92§)
         {
            return;
         }
         this.§92§.§4;§(this.animationTimer.current / this.animationTimer.delay,this.§=H§,0,0,0);
         this.to.x = this.§=H§.x - x;
         this.to.y = this.§=H§.y - y;
         rotation = this.to.rotation;
         x = this.§=H§.x;
         y = this.§=H§.y;
         var _loc2_:int = 0;
         for each(_loc3_ in this.§0W§)
         {
            if(!_loc3_.running)
            {
               _loc4_ = null;
               if(_loc2_ == 1)
               {
                  _loc4_ = this.offest1;
               }
               else if(_loc2_ == 2)
               {
                  _loc4_ = this.offest2;
               }
               this.weapon[_loc2_].execute(this.tower,this,null,_loc4_);
               _loc3_.reset();
            }
            _loc2_++;
         }
      }
      
      override public function draw(param1:BitmapData) : void
      {
         if(!this.clip || !param1 || !this.clip.frames)
         {
            return;
         }
         this.clip.drawRotated(param1,x,y,rotation);
      }
   }
}

