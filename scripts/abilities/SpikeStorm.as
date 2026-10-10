package abilities
{
   import abilities.def.AbilityDef;
   import towers.Tower;
   import weapons.HasProjectile;
   import weapons.SpikeSpread;
   
   public class SpikeStorm extends Ability
   {
      
      public function SpikeStorm()
      {
         super();
      
      override public function execute(param1:Tower, param2:AbilityDef) : void
      {
         var _loc3_:SpikeSpread = new SpikeSpread();
         _loc3_.projectile = (param1.def.weapons[0] as HasProjectile).projectile;
         _loc3_.fullTrack = true;
         var _loc4_:int = 0;
         while(_loc4_ < 100)
         {
            _loc3_.execute(param1,param1,null);
            _loc4_++;
         }
         _loc3_.fullTrack = false;
         super.execute(param1,param2);
      }
   }
}

