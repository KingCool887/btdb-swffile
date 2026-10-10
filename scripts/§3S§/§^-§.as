package §3S§
{
   import §8K§.§ E§;
   import §8K§.§!<§;
   import game.§6$§;
   import state.§9M§;
   import state.State;
   import towers.§5R§;
   import utils.Pool;
   
   public class §^-§ extends §"I§
   {
      
      internal var towerPlace:§5R§ = null;
      
      internal var §,@§:§ E§ = null;
      
      private var §"0§:§6$§;
      
      public function §^-§(param1:§!<§)
      {
         this.§"0§ = §?V§.instance.§"0§;
         super(param1);
      }
      
      override public function enter(param1:§9M§) : void
      {
         this.towerPlace = Pool.get(§5R§);
         this.towerPlace.initialise(§<Y§(param1).towerPickerDef.tower,§<Y§(param1).towerPickerDef);
         this.§,@§ = §<Y§(param1).towerPickerDef;
         this.towerPlace.§?"§ = this.§"0§.§-W§;
         this.towerPlace.§,B§();
         § 2§.mc.bottomPannel.cancel_btn.visible = true;
      }
      
      override public function message(param1:§9M§) : State
      {
         var _loc2_:§<Y§ = null;
         if(§<Y§(param1).type == §<Y§.§@>§)
         {
            this.towerPlace = null;
            §!Y§.§^W§(§ 2§.§+%§,param1);
            if(§<Y§(param1).tower.def != null && § 2§.§,U§(§<Y§(param1).tower.def))
            {
               _loc2_ = new §<Y§(§<Y§.§ 9§);
               _loc2_.tower = §<Y§(param1).tower;
               §!Y§.message(_loc2_);
            }
            if(§ 2§.§9#§ || this.§,@§.tower.id == "RoadSpikes" || this.§,@§.tower.id == "ExplodingPineapple")
            {
               if(this.§"0§.§-W§.cash.value >= this.§,@§.cost)
               {
                  § 2§.§+R§(this.§,@§);
               }
            }
         }
         else
         {
            if(§<Y§(param1).type == §<Y§.§`J§)
            {
               return § 2§.§-I§;
            }
            if(§<Y§(param1).type == §<Y§.§@P§)
            {
               return § 2§.§+%§;
            }
         }
         return null;
      }
      
      override public function exit() : void
      {
         if(this.towerPlace != null)
         {
            this.towerPlace.destroy();
            § 2§.§2O§();
            this.towerPlace = null;
         }
         § 2§.mc.bottomPannel.cancel_btn.visible = false;
      }
   }
}

