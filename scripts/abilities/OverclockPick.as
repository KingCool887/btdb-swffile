package abilities
{
   import abilities.def.AbilityDef;
   import abilities.def.OverclockDef;
   import assests.effects.EngineerAura;
   import assets.cursor.Wrench;
   import assets.sound.EngineerActivate;
   import entities.Cursor;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import towers.Tower;
   
   public class OverclockPick extends Ability
   {
      
      public static var OC_DEF:OverclockDef = new OverclockDef().Sound(EngineerActivate).Effect(EngineerAura);
      
      public var tower:Tower;
      
      public var input:Vector.<Tower>;
      
      public var def:AbilityDef;
      
      public var wrench:Cursor = null;
      
      public function OverclockPick()
      {
         super();
      }
      
      override public function execute(param1:Tower, param3:AbilityDef) : void
      {
         if(this.wrench != null)
         {
            this.cancel(null);
         }
         this.tower = param1;
         if(§?V§.instance.§"0§.§-W§ == param1.levelSlug)
         {
            §?V§.instance.stage.addEventListener(MouseEvent.MOUSE_UP,this.select);
            this.wrench = new Cursor(param1);
            this.wrench.initialise(Wrench);
            param1.levelSlug.§?3§(this.wrench);
         }
         param1.§>2§[param3.id].reset(param1.§>2§[param3.id].delay);
         super.execute(param1,param3);
      }
      
      public function select(param1:Event) : *
      {
         if(this.tower.def == null)
         {
            this.cancel(null);
            return;
         }
         var target_:Tower = Overclock.getTarget(this.tower,this.wrench.x,this.wrench.y);
         if(target_ == null)
         {
            return;
         }
         var oc:Overclock = new Overclock(this.wrench.x,this.wrench.y);
         oc.execute(this.tower,OC_DEF);
         if(oc.success)
         {
            §?V§.instance.§"0§.§-W§.§"B§.dispatch(this.tower.id,"Overclock_" + this.wrench.x + "_" + this.wrench.y);
            this.cancel(null);
         }
      }
      
      public function cancel(param1:Event) : *
      {
         if(this.wrench != null)
         {
            this.wrench.destroy();
            this.wrench = null;
         }
         if(§?V§.instance.§"0§.§-W§ == this.tower.levelSlug)
         {
            §?V§.instance.stage.removeEventListener(MouseEvent.MOUSE_UP,this.select);
         }
      }
   }
}

