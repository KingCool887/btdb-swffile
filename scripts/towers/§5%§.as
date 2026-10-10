package towers
{
   import assets.towers.Range;
   import flash.display.MovieClip;
   import towers.def.TowerDef;
   import utils.Pool;
   
   public class §5%§ extends MovieClip
   {
      
      private var §'G§:Range = null;
      
      public function §5%§()
      {
         super();
      }
      
      public function §3K§(param1:TowerDef) : void
      {
         if(this.§'G§ == null)
         {
            this.§'G§ = Pool.get(Range);
            addChild(this.§'G§);
         }
         if(param1.rangeOfVisibility < 1000)
         {
            this.§'G§.width = param1.rangeOfVisibility * 2 * §?V§.instance.scale;
         }
         else
         {
            this.§'G§.width = 100 * §?V§.instance.scale;
         }
         this.§'G§.height = this.§'G§.width;
      }
   }
}

