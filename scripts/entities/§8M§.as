package entities
{
   import §+C§.§0>§;
   import §;M§.§"L§;
   import flash.display.BitmapData;
   
   public class §8M§ extends §"L§
   {
      
      internal var layers:Vector.<§"L§> = new Vector.<§"L§>();
      
      public function §8M§()
      {
         super();
      }
      
      public function initialise(param1:Vector.<Class>, param2:Number, param3:Number, param4:§0>§) : void
      {
         var _loc6_:Class = null;
         var _loc7_:§^X§ = null;
         var _loc5_:int = 0;
         for each(_loc6_ in param1)
         {
            _loc7_ = new §^X§();
            _loc7_.initialise(_loc6_,param2 + _loc5_);
            param4.§?3§(_loc7_);
            this.layers.push(_loc7_);
            _loc5_++;
         }
      }
      
      override public function destroy() : void
      {
         var _loc1_:§"L§ = null;
         for each(_loc1_ in this.layers)
         {
            _loc1_.destroy();
         }
         super.destroy();
      }
      
      override public function set rotation(param1:Number) : void
      {
         var _loc2_:§"L§ = null;
         for each(_loc2_ in this.layers)
         {
            _loc2_.rotation = param1;
         }
         super.rotation = param1;
      }
      
      override public function process(param1:Number) : void
      {
         var _loc2_:§"L§ = null;
         for each(_loc2_ in this.layers)
         {
            _loc2_.x = x;
         }
         for each(_loc2_ in this.layers)
         {
            _loc2_.y = y;
         }
         super.process(param1);
      }
      
      override public function draw(param1:BitmapData) : void
      {
         var _loc2_:§"L§ = null;
         for each(_loc2_ in this.layers)
         {
            _loc2_.x = x;
         }
         for each(_loc2_ in this.layers)
         {
            _loc2_.y = y;
         }
         super.draw(param1);
      }
   }
}

