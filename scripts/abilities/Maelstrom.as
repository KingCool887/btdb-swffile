package abilities
{
   import abilities.def.AbilityDef;
   import towers.Tower;
   
   public class Maelstrom extends Ability
   {
      
      public function Maelstrom()
      {
         super();
      }
      
      override public function execute(param1:Tower, param2:AbilityDef) : void
      {
         var _loc3_:MaelstormSpawner = new MaelstormSpawner();
         _loc3_.tower = param1;
         super.execute(param1,param2);
      }
   }
}

