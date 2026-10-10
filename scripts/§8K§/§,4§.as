package §8K§
{
   import §;M§.§"L§;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import towers.§5%§;
   import towers.def.TowerDef;
   
   public class §,4§ extends §"L§
   {
      
      public var range:§5%§ = new §5%§();
      
      public var § 7§:Matrix = new Matrix();
      
      public var visible:Boolean = true;
      
      public var §&7§:ColorTransform = null;
      
      public function §,4§()
      {
         super();
      }
      
      public function §3K§(param1:TowerDef) : void
      {
         this.range.§3K§(param1);
         z = 0.6;
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

