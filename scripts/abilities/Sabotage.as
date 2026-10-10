package abilities
{
   import §+C§.§0>§;
   import abilities.def.AbilityDef;
   import bloons.Bloon;
   import flash.events.Event;
   import towers.Tower;
   import utils.§-B§;
   
   public class Sabotage extends Ability
   {
      
      private static var §3#§:int = 0;
      
      private static var §2P§:int = 0;
      
      internal var levelSlug:§0>§ = null;
      
      public function Sabotage()
      {
         super();
      }
      
      override public function execute(param1:Tower, param2:AbilityDef) : void
      {
         this.levelSlug = param1.levelSlug;
         if(false == this.levelSlug.§]§)
         {
            if(this.levelSlug.§#1§ == 0)
            {
               §3#§ = 0;
            }
            else if(this.levelSlug.§#1§ == 1)
            {
               §2P§ = 0;
            }
         }
         this.levelSlug.§]§ = true;
         var _loc3_:§-B§ = new §-B§(15);
         _loc3_.addEventListener(§-B§.COMPLETE,this.endSabotage);
         _loc3_.addEventListener(§-B§.§!1§,this.endSabotage);
         var _loc4_:Vector.<Bloon> = this.levelSlug.allBloons;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            if(§?V§.instance.§"0§.§3G§ - _loc4_[_loc5_].§]?§ <= 10)
            {
               _loc4_[_loc5_].§^Q§ = true;
            }
            _loc5_++;
         }
         if(this.levelSlug.§#1§ == 0)
         {
            ++§3#§;
         }
         else if(this.levelSlug.§#1§ == 1)
         {
            ++§2P§;
         }
      }
      
      private function endSabotage(param1:Event) : void
      {
         §-B§(param1.target).removeEventListener(§-B§.COMPLETE,this.endSabotage);
         §-B§(param1.target).removeEventListener(§-B§.§!1§,this.endSabotage);
         if(this.levelSlug.§#1§ == 0)
         {
            --§3#§;
            if(§3#§ == 0 && this.levelSlug != null)
            {
               this.levelSlug.§]§ = false;
            }
         }
         else if(this.levelSlug.§#1§ == 1)
         {
            --§2P§;
            if(§2P§ == 0 && this.levelSlug != null)
            {
               this.levelSlug.§]§ = false;
            }
         }
      }
   }
}

