package §>$§
{
   public class §7W§
   {
      
      public var id:String = "Error000";
      
      public var name:String = "Error001";
      
      public var battleScore:int = 0;
      
      public var §`F§:int = -1;
      
      public var §9!§:String = "Error002";
      
      public var wins:int = 0;
      
      public var losses:int = 0;
      
      public var orc:int = 0;
      
      public var side:int = -1;
      
      public function §7W§()
      {
         super();
      }
      
      public function §@O§() : String
      {
         return this.id + "," + this.name + "," + this.battleScore + "," + this.§`F§ + "," + this.§9!§ + "," + this.orc;
      }
      
      public function §1P§(param1:String) : void
      {
         var _loc2_:Array = param1.split(",");
         this.id = _loc2_[1];
         this.name = _loc2_[2];
         this.battleScore = _loc2_[3];
         this.§`F§ = _loc2_[4];
         this.§9!§ = _loc2_[5];
         this.wins = _loc2_[9];
         this.losses = _loc2_[10];
         this.orc = _loc2_[11];
      }
      
      public function §6Q§() : void
      {
         if(this.id == null)
         {
            this.id = "Error000";
         }
         if(this.name == null)
         {
            this.name = "Error001";
         }
         if(this.§9!§ == null)
         {
            this.§9!§ = "Error002";
         }
      }
   }
}

