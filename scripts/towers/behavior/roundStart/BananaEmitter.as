package towers.behavior.roundStart
{
   import §>@§.§-A§;
   import §>@§.§<<§;
   import assets.gui.PopCash;
   import events.PropertyModEvent;
   import flash.utils.Dictionary;
   import towers.Tower;
   import utils.Rndm;
   
   public class BananaEmitter extends BehaviorRoundStart
   {
      
      public static var towerTimers:Dictionary = new Dictionary();
      
      public static var bankedTowerFunds:Dictionary = new Dictionary();
      
      public static var cancel:Boolean = true;
      
      private static var displayOrder:Vector.<String> = null;
      
      private var cashPerRound_:§<<§ = §-A§.§]H§(0);
      
      private var cashPerPacket_:§<<§ = §-A§.§]H§(0);
      
      private var lifespan_:Number = 0;
      
      private var cashScale_:§<<§ = §-A§.§]H§(1);
      
      private var bankFunds_:Boolean = false;
      
      private var intrestMultiplier_:Number = 0;
      
      private var maxFunds_:int = 0;
      
      private var display_:Class = null;
      
      public function BananaEmitter()
      {
         super();
      }
      
      public static function getDisplayOrder() : Vector.<String>
      {
         if(displayOrder == null)
         {
            displayOrder = new Vector.<String>();
            displayOrder.push("bankedFunds","cashPerRound","cashPerPacket","lifespan","cashScale","bankFunds","intrestMultiplier","maxFunds");
         }
         return displayOrder;
      }
      
      public static function clear() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:BananaEmitionTimer = null;
         for(_loc1_ in towerTimers)
         {
            for each(_loc2_ in towerTimers[_loc1_])
            {
               _loc2_.cancel();
            }
         }
      }
      
      public function set display(param1:Class) : void
      {
         if(this.display_ != param1)
         {
            this.display_ = param1;
            dispatchEvent(new PropertyModEvent("display"));
         }
      }
      
      public function get display() : Class
      {
         return this.display_;
      }
      
      public function Display(param1:Class) : BananaEmitter
      {
         this.display = param1;
         return this;
      }
      
      public function setBankedFunds(param1:int, param2:Tower) : void
      {
         if(bankedTowerFunds[param2] == null)
         {
            bankedTowerFunds[param2] = §-A§.§]H§();
         }
         if(bankedTowerFunds[param2].value != param1)
         {
            bankedTowerFunds[param2].value = param1;
            if(bankedTowerFunds[param2].value > this.maxFunds)
            {
               bankedTowerFunds[param2].value = this.maxFunds;
            }
            dispatchEvent(new PropertyModEvent("bankedFunds"));
         }
      }
      
      public function getBankedFunds(param1:Tower) : int
      {
         if(bankedTowerFunds[param1] == null)
         {
            bankedTowerFunds[param1] = §-A§.§]H§();
         }
         return bankedTowerFunds[param1].value;
      }
      
      public function set cashPerRound(param1:int) : void
      {
         if(this.cashPerRound_.value != param1)
         {
            this.cashPerRound_.value = param1;
            dispatchEvent(new PropertyModEvent("cashPerRound"));
         }
      }
      
      public function get cashPerRound() : int
      {
         return this.cashPerRound_.value;
      }
      
      public function CashPerRound(param1:int) : BananaEmitter
      {
         this.cashPerRound = param1;
         return this;
      }
      
      public function set cashPerPacket(param1:int) : void
      {
         if(this.cashPerPacket_.value != param1)
         {
            this.cashPerPacket_.value = param1;
            dispatchEvent(new PropertyModEvent("cashPerPacket"));
         }
      }
      
      public function get cashPerPacket() : int
      {
         return this.cashPerPacket_.value;
      }
      
      public function CashPerPacket(param1:int) : BananaEmitter
      {
         this.cashPerPacket = param1;
         return this;
      }
      
      public function set lifespan(param1:Number) : void
      {
         if(this.lifespan_ != param1)
         {
            this.lifespan_ = param1;
            dispatchEvent(new PropertyModEvent("lifespan"));
         }
      }
      
      public function get lifespan() : Number
      {
         return this.lifespan_;
      }
      
      public function Lifespan(param1:Number) : BananaEmitter
      {
         this.lifespan = param1;
         return this;
      }
      
      public function set cashScale(param1:Number) : void
      {
         if(this.cashScale_.value != param1)
         {
            this.cashScale_.value = param1;
            dispatchEvent(new PropertyModEvent("cashScale"));
         }
      }
      
      public function get cashScale() : Number
      {
         return this.cashScale_.value;
      }
      
      public function CashScale(param1:Number) : BananaEmitter
      {
         this.cashScale = param1;
         return this;
      }
      
      public function set bankFunds(param1:Boolean) : void
      {
         if(this.bankFunds_ != param1)
         {
            this.bankFunds_ = param1;
            dispatchEvent(new PropertyModEvent("bankFunds"));
         }
      }
      
      public function get bankFunds() : Boolean
      {
         return this.bankFunds_;
      }
      
      public function BankFunds(param1:Boolean) : BananaEmitter
      {
         this.bankFunds = param1;
         return this;
      }
      
      public function set intrestMultiplier(param1:Number) : void
      {
         if(this.intrestMultiplier_ != param1)
         {
            this.intrestMultiplier_ = param1;
            dispatchEvent(new PropertyModEvent("intrestMultiplier"));
         }
      }
      
      public function get intrestMultiplier() : Number
      {
         return this.intrestMultiplier_;
      }
      
      public function IntrestMultiplier(param1:Number) : BananaEmitter
      {
         this.intrestMultiplier = param1;
         return this;
      }
      
      public function set maxFunds(param1:int) : void
      {
         if(this.maxFunds_ != param1)
         {
            this.maxFunds_ = param1;
            dispatchEvent(new PropertyModEvent("maxFunds"));
         }
      }
      
      public function get maxFunds() : int
      {
         return this.maxFunds_;
      }
      
      public function MaxFunds(param1:int) : BananaEmitter
      {
         this.maxFunds = param1;
         return this;
      }
      
      public function collect(param1:Tower) : void
      {
         var _loc2_:PopCash = null;
         if(this.getBankedFunds(param1) > 0)
         {
            _loc2_ = new PopCash();
            _loc2_.x = param1.x;
            _loc2_.y = param1.y;
            _loc2_.mouseEnabled = false;
            _loc2_.mouseChildren = false;
            _loc2_.label.text = "$" + String(this.getBankedFunds(param1));
            §?V§.instance.§"0§.§ 2§.addChild(_loc2_);
            param1.levelSlug.§4>§(this.getBankedFunds(param1));
            this.setBankedFunds(0,param1);
            param1.dispatchEvent(new PropertyModEvent("funds"));
         }
      }
      
      override public function execute(param1:Tower) : void
      {
         var _loc5_:BananaEmitionTimer = null;
         var _loc6_:Number = NaN;
         var _loc7_:BananaEmitionTimer = null;
         var _loc2_:int = this.cashPerRound / this.cashPerPacket;
         var _loc3_:Number = param1.levelSlug.§[G§ / _loc2_;
         if(cancel)
         {
            if(towerTimers[param1] != null)
            {
               for each(_loc5_ in towerTimers[param1])
               {
                  _loc5_.cancel();
               }
            }
         }
         towerTimers[param1] = new Vector.<BananaEmitionTimer>();
         var _loc4_:int = 0;
         for(; _loc4_ < _loc2_; _loc4_++)
         {
            _loc6_ = (_loc4_ + 1) * _loc3_ - §?V§.instance.§"0§.§3G§;
            if(_loc6_ < 0)
            {
               if(cancel)
               {
                  continue;
               }
               _loc6_ = 0;
            }
            _loc7_ = new BananaEmitionTimer();
            if(!this.bankFunds)
            {
               _loc7_.initialise(param1,_loc6_ + Rndm.random() * 3,this.cashPerPacket * this.cashScale,this.lifespan,this.display);
            }
            else
            {
               _loc7_.initialise(param1,_loc6_ + Rndm.random() * 3,this.cashPerPacket * this.cashScale,this.lifespan,this.display,this);
            }
            towerTimers[param1].push(_loc7_);
         }
      }
   }
}

