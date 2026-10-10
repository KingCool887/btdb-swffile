package abilities
{
   import abilities.def.AbilityDef;
   import towers.Tower;
   
   public class SummonPhoenix extends Ability
   {
      
      public function SummonPhoenix()
      {
         super();
      }
      
      override public function execute(param1:Tower, param2:AbilityDef) : void
      {
         var _loc3_:Pheonix = new Pheonix();
         _loc3_.initialise(param1);
         param1.levelSlug.§?3§(_loc3_);
         super.execute(param1,param2);
      }
   }
}

