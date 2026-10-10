package abilities
{
   import §8U§.§52§;
   import abilities.def.AbilityDef;
   import bloons.Bloon;
   import entities.MoabAssassin;
   import towers.Tower;
   
   public class MoabAssasin extends Ability
   {
      
      public function MoabAssasin()
      {
         super();
      }
      
      override public function execute(param1:Tower, param2:AbilityDef) : void
      {
         var _loc4_:MoabAssassin = null;
         var _loc3_:Bloon = param1.levelSlug.§[L§(new §52§(param1.x,param1.y));
         if(_loc3_ != null)
         {
            _loc4_ = new MoabAssassin();
            _loc4_.initialise(param1,_loc3_);
            param1.levelSlug.§?3§(_loc4_);
         }
         super.execute(param1,param2);
      }
   }
}

