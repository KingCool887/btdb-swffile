package §8K§
{
   import flash.geom.ColorTransform;
   import towers.def.TowerDef;
   
   public class §0"§
   {
      
      public var range:§,4§ = new §,4§();
      
      public var § Y§:§<"§ = new §<"§();
      
      public function §0"§()
      {
         super();
      }
      
      public function process(param1:TowerDef) : void
      {
         this.range.§3K§(param1);
         this.§ Y§.§3K§(param1);
         if(this.range.§?"§ == null)
         {
            this.range.§?"§ = §?V§.instance.§"0§.§-W§;
            this.range.§,B§();
         }
         if(this.range.§?"§ == null)
         {
            this.§ Y§.§?"§ = §?V§.instance.§"0§.§-W§;
            this.§ Y§.§,B§();
         }
      }
      
      public function destroy() : void
      {
         this.range.destroy();
         this.§ Y§.destroy();
      }
      
      public function set §&7§(param1:ColorTransform) : *
      {
         this.range.§&7§ = param1;
         this.§ Y§.§&7§ = param1;
      }
      
      public function set x(param1:Number) : *
      {
         this.range.x = param1;
         this.§ Y§.x = param1;
      }
      
      public function set y(param1:Number) : *
      {
         this.range.y = param1;
         this.§ Y§.y = param1;
      }
      
      public function set visible(param1:Boolean) : *
      {
         this.range.visible = param1;
         this.§ Y§.visible = param1;
      }
   }
}

