package abilities
{
   import abilities.def.AbilityDef;
   import entities.Effect;
   import sound.§^5§;
   import towers.Tower;
   
   public class Ability
   {
      
      public function Ability()
      {
         super();
      }
      
      public function execute(param1:Tower, param2:AbilityDef) : void
      {
         var _loc3_:Effect = null;
         if(param2.effect != null)
         {
            _loc3_ = new Effect();
            _loc3_.initialise(param2.effect,3);
            _loc3_.x = param1.x;
            _loc3_.y = param1.y;
            param1.levelSlug.§?3§(_loc3_);
         }
         if(param2.sound != null)
         {
            new §^5§(param2.sound).play();
         }
      }
   }
}

