package §8K§
{
   import §;M§.§"L§;
   import assets.tower.MortarReticle;
   import display.Clip;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   import towers.Tower;
   import weapons.FireAtReticle;
   
   public class §9O§ extends §"L§
   {
      
      private var clip:Clip = new Clip();
      
      public var tower:Tower = null;
      
      private var §15§:Boolean = false;
      
      public function §9O§()
      {
         super();
      }
      
      public function initialise(param1:Tower, param2:Boolean) : void
      {
         this.tower = param1;
         this.§15§ = param2;
         this.clip.initialise(MortarReticle,1);
         z = 300;
         if(Boolean(param1.def.weapons) && param1.def.weapons[0] as FireAtReticle != null)
         {
            if((param1.def.weapons[0] as FireAtReticle).spread < 60)
            {
               this.clip.gotoAndStop(1);
            }
            else
            {
               this.clip.gotoAndStop(0);
            }
         }
      }
      
      override public function process(param1:Number) : void
      {
         this.clip.process();
         if(this.§15§ == false)
         {
            return;
         }
         x = §?V§.instance.mouseX;
         y = §?V§.instance.mouseY;
         var _loc2_:Rectangle = this.tower.levelSlug.§1§;
         if(x > _loc2_.right - 10)
         {
            x = _loc2_.right - 10;
         }
         else if(x < _loc2_.left + 10)
         {
            x = _loc2_.left + 10;
         }
         if(y > _loc2_.bottom - 10)
         {
            y = _loc2_.bottom - 10;
         }
         else if(y < _loc2_.top + 10)
         {
            y = _loc2_.top + 10;
         }
      }
      
      override public function draw(param1:BitmapData) : void
      {
         this.clip.quickDraw(param1,x,y);
      }
   }
}

