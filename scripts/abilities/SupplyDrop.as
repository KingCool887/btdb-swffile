package abilities
{
   import abilities.def.AbilityDef;
   import entities.SupplyDrop;
   import towers.Tower;
   
   public class SupplyDrop extends Ability
   {
      
      public function SupplyDrop()
      {
         super();
      }
      
      override public function execute(param1:Tower, param2:AbilityDef) : void
      {
         var _loc3_:entities.SupplyDrop = new entities.SupplyDrop();
         _loc3_.initialise(param1);
         param1.levelSlug.§?3§(_loc3_);
         super.execute(param1,param2);
      }
   }
}

