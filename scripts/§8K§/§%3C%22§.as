package §8K§
{
   import §;M§.§"L§;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import towers.def.TowerDef;
   
   public class §<"§ extends §"L§
   {
      
      public var range:MovieClip = new MovieClip();
      
      public var § 7§:Matrix = new Matrix();
      
      public var visible:Boolean = true;
      
      public var §&7§:ColorTransform = null;
      
      public function §<"§()
      {
         super();
      }
      
      public function §3K§(param1:TowerDef) : void
      {
         this.range.graphics.clear();
         this.range.graphics.lineStyle(2,3355443,0.5);
         this.range.graphics.drawCircle(0,0,(param1.rangeOfVisibility < 1000 ? param1.rangeOfVisibility * §?V§.instance.scale : 50 * §?V§.instance.scale) + 1);
         z = 10;
      }
      
      override public function destroy() : void
      {
         super.destroy();
      }
      
      override public function draw(param1:BitmapData) : void
      {
         if(!this.visible)
         {
            return;
         }
         this.§ 7§.identity();
         this.§ 7§.translate(x * §?V§.instance.scale,y * §?V§.instance.scale);
         param1.draw(this.range,this.§ 7§,this.§&7§,null,null,true);
      }
   }
}

