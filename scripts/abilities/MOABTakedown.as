package abilities
{
   import §8U§.§52§;
   import abilities.def.AbilityDef;
   import bloons.Bloon;
   import entities.Harpoon;
   import towers.Tower;
   
   public class MOABTakedown extends Ability
   {
      
      public function MOABTakedown()
      {
         super();
      }
      
      override public function execute(param1:Tower, param2:AbilityDef) : void
      {
         var _loc4_:Harpoon = null;
         var _loc3_:Bloon = param1.levelSlug.§[L§(new §52§(param1.x,param1.y),true);
         if(_loc3_ != null)
         {
            _loc4_ = new Harpoon();
            _loc4_.initialise(param1,_loc3_);
            param1.levelSlug.§?3§(_loc4_);
         }
         super.execute(param1,param2);
      }
   }
}

