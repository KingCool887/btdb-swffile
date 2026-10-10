package §;M§
{
   import flash.display.BitmapData;
   
   public class §"L§ extends §4A§ implements §&F§
   {
      
      public var x:Number = 0;
      
      public var y:Number = 0;
      
      public var §?X§:Number = 0;
      
      public var §?"§:§-!§;
      
      public var §>M§:Boolean = false;
      
      public function §"L§()
      {
         super();
      }
      
      public function §,B§() : void
      {
         this.§>M§ = false;
         if(this.§?"§ != null)
         {
            this.§?"§.§?3§(this);
         }
      }
      
      public function destroy() : void
      {
         if(this.§?"§ != null)
         {
            this.§?"§.§ D§(this);
            this.§?"§ = null;
         }
         this.§>M§ = true;
      }
      
      public function process(param1:Number) : void
      {
      }
      
      override public function draw(param1:BitmapData) : void
      {
      }
      
      public function get rotation() : Number
      {
         return this.§?X§;
      }
      
      public function set rotation(param1:Number) : void
      {
         this.§?X§ = param1;
      }
   }
}

