package §;M§
{
   import flash.display.BitmapData;
   import utils.§-B§;
   
   public class §-!§ extends §4A§ implements §&F§
   {
      
      private var §;Y§:Vector.<§4A§> = new Vector.<§4A§>();
      
      private var §"E§:Vector.<§&F§> = new Vector.<§&F§>();
      
      private var §>M§:Vector.<§&F§> = new Vector.<§&F§>();
      
      public var §;$§:Boolean = false;
      
      public function §-!§()
      {
         super();
      }
      
      override public function draw(param1:BitmapData) : void
      {
         var _loc2_:§4A§ = null;
         for each(_loc2_ in this.§;Y§)
         {
            _loc2_.draw(param1);
         }
      }
      
      public function process(param1:Number) : void
      {
         var _loc2_:§&F§ = null;
         var _loc3_:int = 0;
         var _loc4_:§4A§ = null;
         var _loc5_:int = 0;
         for each(_loc2_ in this.§"E§)
         {
            if(this.§>M§.indexOf(_loc2_) == -1)
            {
               if(_loc2_ is §"L§ && (_loc2_ as §"L§).§>M§ == true)
               {
               }
               _loc2_.process(param1);
            }
         }
         for each(_loc2_ in this.§>M§)
         {
            _loc3_ = this.§"E§.indexOf(_loc2_);
            if(_loc3_ != -1)
            {
               if(this.§"E§[_loc3_] is §-B§)
               {
                  §-B§(this.§"E§[_loc3_]).destroy();
               }
               this.§"E§.splice(_loc3_,1);
            }
            _loc4_ = _loc2_ as §4A§;
            if(_loc4_ != null)
            {
               _loc5_ = this.§;Y§.indexOf(_loc4_);
               if(_loc5_ != -1)
               {
                  this.§;Y§.splice(_loc5_,1);
               }
            }
         }
         this.§>M§.splice(0,this.§>M§.length);
         if(this.§;$§)
         {
            this.§;Y§.sort(this.§;5§);
            this.§;$§ = false;
         }
      }
      
      public function clear() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§"E§.length)
         {
            if(this.§"E§[_loc1_] is §-B§)
            {
               §-B§(this.§"E§[_loc1_]).destroy();
            }
            _loc1_++;
         }
         this.§"E§.splice(0,this.§"E§.length);
         this.§;Y§.splice(0,this.§;Y§.length);
      }
      
      public function § J§(param1:§&F§) : void
      {
         this.§"E§.push(param1);
      }
      
      public function §?3§(param1:§"L§) : void
      {
         param1.§?"§ = this;
         this.§"E§.push(param1);
         var _loc2_:int = 0;
         while(_loc2_ < this.§;Y§.length)
         {
            if(this.§;Y§[_loc2_].z > param1.z)
            {
               this.§;Y§.splice(_loc2_,0,param1);
               return;
            }
            _loc2_++;
         }
         this.§;Y§.push(param1);
      }
      
      private function §;5§(param1:§4A§, param2:§4A§) : int
      {
         if(param1.z > param2.z)
         {
            return 1;
         }
         if(param1.z < param2.z)
         {
            return -1;
         }
         return 0;
      }
      
      public function § D§(param1:§&F§) : void
      {
         this.§>M§.push(param1);
      }
   }
}

