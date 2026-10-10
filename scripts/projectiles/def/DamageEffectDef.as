package projectiles.def
{
   import events.PropertyModEvent;
   import flash.events.EventDispatcher;
   
   public class DamageEffectDef extends EventDispatcher
   {
      
      private static var displayOrder:Vector.<String> = null;
      
      private var damage_:int = 0;
      
      private var cantBreak_:Vector.<int> = null;
      
      private var canBreakIce_:Boolean = true;
      
      private var blimpScale_:Number = 1;
      
      private var ceramicScale_:Number = 1;
      
      private var showPop_:Boolean = true;
      
      private var peelLayer_:Boolean = false;
      
      private var kill_:Boolean = false;
      
      public function DamageEffectDef()
      {
         super();
      }
      
      public static function getDisplayOrder() : Vector.<String>
      {
         if(displayOrder == null)
         {
            displayOrder = new Vector.<String>();
            displayOrder.push("damage","cantBreak","canBreakIce","blimpScale","ceramicScale","showPop","peelLayer","kill");
         }
         return displayOrder;
      }
      
      public function set damage(param1:int) : void
      {
         if(this.damage_ != param1)
         {
            this.damage_ = param1;
            dispatchEvent(new PropertyModEvent("damage"));
         }
      }
      
      public function get damage() : int
      {
         return this.damage_;
      }
      
      public function Damage(param1:int) : DamageEffectDef
      {
         this.damage = param1;
         return this;
      }
      
      public function set cantBreak(param1:Vector.<int>) : void
      {
         if(this.cantBreak_ != param1)
         {
            this.cantBreak_ = param1;
            dispatchEvent(new PropertyModEvent("cantBreak"));
         }
      }
      
      public function get cantBreak() : Vector.<int>
      {
         return this.cantBreak_;
      }
      
      public function CantBreak(param1:Vector.<int>) : DamageEffectDef
      {
         this.cantBreak = param1;
         return this;
      }
      
      public function set canBreakIce(param1:Boolean) : void
      {
         if(this.canBreakIce_ != param1)
         {
            this.canBreakIce_ = param1;
            dispatchEvent(new PropertyModEvent("canBreakIce"));
         }
      }
      
      public function get canBreakIce() : Boolean
      {
         return this.canBreakIce_;
      }
      
      public function CanBreakIce(param1:Boolean) : DamageEffectDef
      {
         this.canBreakIce = param1;
         return this;
      }
      
      public function set blimpScale(param1:Number) : void
      {
         if(this.blimpScale_ != param1)
         {
            this.blimpScale_ = param1;
            dispatchEvent(new PropertyModEvent("blimpScale"));
         }
      }
      
      public function get blimpScale() : Number
      {
         return this.blimpScale_;
      }
      
      public function BlimpScale(param1:Number) : DamageEffectDef
      {
         this.blimpScale = param1;
         return this;
      }
      
      public function set ceramicScale(param1:Number) : void
      {
         if(this.ceramicScale_ != param1)
         {
            this.ceramicScale_ = param1;
            dispatchEvent(new PropertyModEvent("ceramicScale"));
         }
      }
      
      public function get ceramicScale() : Number
      {
         return this.ceramicScale_;
      }
      
      public function CeramicScale(param1:Number) : DamageEffectDef
      {
         this.ceramicScale = param1;
         return this;
      }
      
      public function set showPop(param1:Boolean) : void
      {
         if(this.showPop_ != param1)
         {
            this.showPop_ = param1;
            dispatchEvent(new PropertyModEvent("showPop"));
         }
      }
      
      public function get showPop() : Boolean
      {
         return this.showPop_;
      }
      
      public function ShowPop(param1:Boolean) : DamageEffectDef
      {
         this.showPop = param1;
         return this;
      }
      
      public function set peelLayer(param1:Boolean) : void
      {
         if(this.peelLayer_ != param1)
         {
            this.peelLayer_ = param1;
            dispatchEvent(new PropertyModEvent("peelLayer"));
         }
      }
      
      public function get peelLayer() : Boolean
      {
         return this.peelLayer_;
      }
      
      public function PeelLayer(param1:Boolean) : DamageEffectDef
      {
         this.peelLayer = param1;
         return this;
      }
      
      public function set kill(param1:Boolean) : void
      {
         if(this.kill_ != param1)
         {
            this.kill_ = param1;
            dispatchEvent(new PropertyModEvent("kill"));
         }
      }
      
      public function get kill() : Boolean
      {
         return this.kill_;
      }
      
      public function Kill(param1:Boolean) : DamageEffectDef
      {
         this.kill = param1;
         return this;
      }
   }
}

