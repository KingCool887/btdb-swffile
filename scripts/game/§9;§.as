package game
{
   import assets.sandbox.Sandbox_BFB;
   import assets.sandbox.Sandbox_Black;
   import assets.sandbox.Sandbox_Blue;
   import assets.sandbox.Sandbox_CamoBlack;
   import assets.sandbox.Sandbox_CamoBlue;
   import assets.sandbox.Sandbox_CamoCeramic;
   import assets.sandbox.Sandbox_CamoGreen;
   import assets.sandbox.Sandbox_CamoIce;
   import assets.sandbox.Sandbox_CamoLead;
   import assets.sandbox.Sandbox_CamoPink;
   import assets.sandbox.Sandbox_CamoRainbow;
   import assets.sandbox.Sandbox_CamoRed;
   import assets.sandbox.Sandbox_CamoRegenBlack;
   import assets.sandbox.Sandbox_CamoRegenBlue;
   import assets.sandbox.Sandbox_CamoRegenCeramic;
   import assets.sandbox.Sandbox_CamoRegenGreen;
   import assets.sandbox.Sandbox_CamoRegenIce;
   import assets.sandbox.Sandbox_CamoRegenLead;
   import assets.sandbox.Sandbox_CamoRegenPink;
   import assets.sandbox.Sandbox_CamoRegenRainbow;
   import assets.sandbox.Sandbox_CamoRegenRed;
   import assets.sandbox.Sandbox_CamoRegenYellow;
   import assets.sandbox.Sandbox_CamoRegenZebra;
   import assets.sandbox.Sandbox_CamoYellow;
   import assets.sandbox.Sandbox_CamoZebra;
   import assets.sandbox.Sandbox_Ceramic;
   import assets.sandbox.Sandbox_Green;
   import assets.sandbox.Sandbox_Ice;
   import assets.sandbox.Sandbox_Lead;
   import assets.sandbox.Sandbox_MOAB;
   import assets.sandbox.Sandbox_OMFG;
   import assets.sandbox.Sandbox_Pink;
   import assets.sandbox.Sandbox_Rainbow;
   import assets.sandbox.Sandbox_Red;
   import assets.sandbox.Sandbox_RegenBlack;
   import assets.sandbox.Sandbox_RegenBlue;
   import assets.sandbox.Sandbox_RegenCeramic;
   import assets.sandbox.Sandbox_RegenGreen;
   import assets.sandbox.Sandbox_RegenIce;
   import assets.sandbox.Sandbox_RegenLead;
   import assets.sandbox.Sandbox_RegenPink;
   import assets.sandbox.Sandbox_RegenRainbow;
   import assets.sandbox.Sandbox_RegenRed;
   import assets.sandbox.Sandbox_RegenYellow;
   import assets.sandbox.Sandbox_RegenZebra;
   import assets.sandbox.Sandbox_Yellow;
   import assets.sandbox.Sandbox_Zebra;
   import bloons.Bloon;
   
   public class §9;§
   {
      
      public var §+M§:Vector.<BloonSendDef> = new Vector.<BloonSendDef>();
      
      private var §;,§:Array = [Sandbox_Red,Sandbox_Blue,Sandbox_Green,Sandbox_Yellow,Sandbox_Pink,Sandbox_Black,Sandbox_Ice,Sandbox_Lead,Sandbox_Zebra,Sandbox_Rainbow,Sandbox_Ceramic,Sandbox_MOAB,Sandbox_BFB,Sandbox_OMFG];
      
      private var §!S§:Array = [Sandbox_RegenRed,Sandbox_RegenBlue,Sandbox_RegenGreen,Sandbox_RegenYellow,Sandbox_RegenPink,Sandbox_RegenBlack,Sandbox_RegenIce,Sandbox_RegenLead,Sandbox_RegenZebra,Sandbox_RegenRainbow,Sandbox_RegenCeramic,Sandbox_MOAB,Sandbox_BFB,Sandbox_OMFG];
      
      private var §3D§:Array = [Sandbox_CamoRed,Sandbox_CamoBlue,Sandbox_CamoGreen,Sandbox_CamoYellow,Sandbox_CamoPink,Sandbox_CamoBlack,Sandbox_CamoIce,Sandbox_CamoLead,Sandbox_CamoZebra,Sandbox_CamoRainbow,Sandbox_CamoCeramic,Sandbox_MOAB,Sandbox_BFB,Sandbox_OMFG];
      
      private var §^%§:Array = [Sandbox_CamoRegenRed,Sandbox_CamoRegenBlue,Sandbox_CamoRegenGreen,Sandbox_CamoRegenYellow,Sandbox_CamoRegenPink,Sandbox_CamoRegenBlack,Sandbox_CamoRegenIce,Sandbox_CamoRegenLead,Sandbox_CamoRegenZebra,Sandbox_CamoRegenRainbow,Sandbox_CamoRegenCeramic,Sandbox_MOAB,Sandbox_BFB,Sandbox_OMFG];
      
      public function §9;§()
      {
         super();
         var _loc1_:BloonSendDef = new BloonSendDef().ID("RedGroup1").Type(Bloon.§`V§).Name("Grouped Reds").Hotkey("1").Quantity(8).Interval(0.1).Cost(25).IncomeChange(1).UnlockRound(2).ThumbStandard(Sandbox_Red).ThumbCamo(Sandbox_CamoRed).ThumbRegen(Sandbox_RegenRed).ThumbRegenCamo(Sandbox_CamoRegenRed);
         this.§+M§.push(_loc1_);
         _loc1_ = new BloonSendDef().ID("SpaceBlue1").Type(Bloon.§&R§).Name("Blue Bloon").Hotkey("Shift+1").Quantity(6).Interval(0.33).Cost(25).IncomeChange(1).UnlockRound(2).ThumbStandard(Sandbox_Blue).ThumbCamo(Sandbox_CamoBlue).ThumbRegen(Sandbox_RegenBlue).ThumbRegenCamo(Sandbox_CamoRegenBlue);
         this.§+M§.push(_loc1_);
         _loc1_ = new BloonSendDef().ID("BlueGroup1").Type(Bloon.§&R§).Name("Blue Bloon").Hotkey("2").Quantity(6).Interval(0.1).Cost(42).IncomeChange(1.7).UnlockRound(4).ThumbStandard(Sandbox_Blue).ThumbCamo(Sandbox_CamoBlue).ThumbRegen(Sandbox_RegenBlue).ThumbRegenCamo(Sandbox_CamoRegenBlue);
         this.§+M§.push(_loc1_);
         _loc1_ = new BloonSendDef().ID("PinkGroup1").Type(Bloon.§=9§).Name("Spaced Pink").Hotkey("Shift+2").Quantity(3).Interval(0.5).Cost(42).IncomeChange(1.7).UnlockRound(4).ThumbStandard(Sandbox_Pink).ThumbCamo(Sandbox_CamoPink).ThumbRegen(Sandbox_RegenPink).ThumbRegenCamo(Sandbox_CamoRegenPink);
         this.§+M§.push(_loc1_);
         _loc1_ = new BloonSendDef().ID("GreenGroup1").Type(Bloon.§>P§).Name("Grouped Greens").Hotkey("3").Quantity(5).Interval(0.08).Cost(60).IncomeChange(2.4).UnlockRound(6).ThumbStandard(Sandbox_Green).ThumbCamo(Sandbox_CamoGreen).ThumbRegen(Sandbox_RegenGreen).ThumbRegenCamo(Sandbox_CamoRegenGreen);
         this.§+M§.push(_loc1_);
         _loc1_ = new BloonSendDef().ID("SpacedBlack1").Type(Bloon.§''§).Name("Spaced Black").Hotkey("Shift+3").Quantity(3).Interval(0.6).Cost(60).IncomeChange(2.4).UnlockRound(6).ThumbStandard(Sandbox_Black).ThumbCamo(Sandbox_CamoBlack).ThumbRegen(Sandbox_RegenBlack).ThumbRegenCamo(Sandbox_CamoRegenBlack);
         this.§+M§.push(_loc1_);
         _loc1_ = new BloonSendDef().ID("YellowGroup1").Type(Bloon.§=8§).Name("Grouped Yellows").Hotkey("4").Quantity(5).Interval(0.06).Cost(75).IncomeChange(3).UnlockRound(8).ThumbStandard(Sandbox_Yellow).ThumbCamo(Sandbox_CamoYellow).ThumbRegen(Sandbox_RegenYellow).ThumbRegenCamo(Sandbox_CamoRegenYellow);
         this.§+M§.push(_loc1_);
         _loc1_ = new BloonSendDef().ID("SpaceWhite1").Type(Bloon.§>%§).Name("Spaced White").Hotkey("Shift+4").Quantity(4).Interval(0.5).Cost(75).IncomeChange(3).UnlockRound(8).ThumbStandard(Sandbox_Ice).ThumbCamo(Sandbox_CamoIce).ThumbRegen(Sandbox_RegenIce).ThumbRegenCamo(Sandbox_CamoRegenIce);
         this.§+M§.push(_loc1_);
         _loc1_ = new BloonSendDef().ID("PinkGroup1").Type(Bloon.§=9§).Name("Grouped Pink").Hotkey("5").Quantity(3).Interval(0.05).Cost(90).IncomeChange(3.6).UnlockRound(10).ThumbStandard(Sandbox_Pink).ThumbCamo(Sandbox_CamoPink).ThumbRegen(Sandbox_RegenPink).ThumbRegenCamo(Sandbox_CamoRegenPink);
         this.§+M§.push(_loc1_);
         _loc1_ = new BloonSendDef().ID("SpaceLead1").Type(Bloon.§?<§).Name("Spaced Leads").Hotkey("Shift+5").Quantity(2).Interval(1.5).Cost(90).IncomeChange(3.6).UnlockRound(10).ThumbStandard(Sandbox_Lead).ThumbCamo(Sandbox_CamoLead).ThumbRegen(Sandbox_RegenLead).ThumbRegenCamo(Sandbox_CamoRegenLead);
         this.§+M§.push(_loc1_);
         _loc1_ = new BloonSendDef().ID("WhiteGroup1").Type(Bloon.§>%§).Name("Group White").Hotkey("6").Quantity(3).Interval(0.15).Cost(125).IncomeChange(5).UnlockRound(11).ThumbStandard(Sandbox_Ice).ThumbCamo(Sandbox_CamoIce).ThumbRegen(Sandbox_RegenIce).ThumbRegenCamo(Sandbox_CamoRegenIce);
         this.§+M§.push(_loc1_);
         _loc1_ = new BloonSendDef().ID("SpaceZebra1").Type(Bloon.§07§).Name("Space Zebra").Hotkey("Shift+6").Quantity(3).Interval(0.6).Cost(125).IncomeChange(5).UnlockRound(11).ThumbStandard(Sandbox_Zebra).ThumbCamo(Sandbox_CamoZebra).ThumbRegen(Sandbox_RegenZebra).ThumbRegenCamo(Sandbox_CamoRegenZebra);
         this.§+M§.push(_loc1_);
         _loc1_ = new BloonSendDef().ID("BlackGroup1").Type(Bloon.§''§).Name("Black Bloon").Hotkey("7").Quantity(3).Interval(0.15).Cost(150).IncomeChange(6).UnlockRound(12).ThumbStandard(Sandbox_Black).ThumbCamo(Sandbox_CamoBlack).ThumbRegen(Sandbox_RegenBlack).ThumbRegenCamo(Sandbox_CamoRegenBlack);
         this.§+M§.push(_loc1_);
         _loc1_ = new BloonSendDef().ID("SpaceRainbowGroup1").Type(Bloon.§!@§).Name("Space Rainbow").Hotkey("Shift+7").Quantity(1).Interval(1).Cost(150).IncomeChange(6).UnlockRound(12).ThumbStandard(Sandbox_Rainbow).ThumbCamo(Sandbox_CamoRainbow).ThumbRegen(Sandbox_RegenRainbow).ThumbRegenCamo(Sandbox_CamoRegenRainbow);
         this.§+M§.push(_loc1_);
         _loc1_ = new BloonSendDef().ID("ZebraGroup1").Type(Bloon.§07§).Name("Zebra Bloon").Hotkey("8").Quantity(3).Interval(0.18).Cost(200).IncomeChange(6).UnlockRound(13).ThumbStandard(Sandbox_Zebra).ThumbCamo(Sandbox_CamoZebra).ThumbRegen(Sandbox_RegenZebra).ThumbRegenCamo(Sandbox_CamoRegenZebra);
         this.§+M§.push(_loc1_);
         _loc1_ = new BloonSendDef().ID("RainbowGroup1").Type(Bloon.§!@§).Name("Rainbow Bloon").Hotkey("Shift+8").Quantity(3).Interval(0.18).Cost(450).IncomeChange(3).UnlockRound(13).ThumbStandard(Sandbox_Rainbow).ThumbCamo(Sandbox_CamoRainbow).ThumbRegen(Sandbox_RegenRainbow).ThumbRegenCamo(Sandbox_CamoRegenRainbow);
         this.§+M§.push(_loc1_);
         _loc1_ = new BloonSendDef().ID("LeadGroup1").Type(Bloon.§?<§).Name("Grouped Leads").Hotkey("9").Quantity(4).Interval(0.2).Cost(200).IncomeChange(6).UnlockRound(15).ThumbStandard(Sandbox_Lead).ThumbCamo(Sandbox_CamoLead).ThumbRegen(Sandbox_RegenLead).ThumbRegenCamo(Sandbox_CamoRegenLead);
         this.§+M§.push(_loc1_);
         _loc1_ = new BloonSendDef().ID("SpaceCeremic1").Type(Bloon.§0T§).Name("Space Ceremic").Hotkey("Shift+9").Quantity(1).Interval(1).Cost(300).IncomeChange(0).UnlockRound(15).ThumbStandard(Sandbox_Ceramic).ThumbCamo(Sandbox_CamoCeramic).ThumbRegen(Sandbox_RegenCeramic).ThumbRegenCamo(Sandbox_CamoRegenCeramic);
         this.§+M§.push(_loc1_);
         _loc1_ = new BloonSendDef().ID("CeremicGroup1").Type(Bloon.§0T§).Name("Fast Ceremic").Hotkey("0").Quantity(1).Interval(0.25).Cost(450).IncomeChange(-5).UnlockRound(18).ThumbStandard(Sandbox_Ceramic).ThumbCamo(Sandbox_CamoCeramic).ThumbRegen(Sandbox_RegenCeramic).ThumbRegenCamo(Sandbox_CamoRegenCeramic);
         this.§+M§.push(_loc1_);
         _loc1_ = new BloonSendDef().ID("SpaceMOABGroup1").Type(Bloon.MOAB).Name("Space MOAB").Hotkey("Shift+0").Quantity(1).Interval(5).Cost(1500).IncomeChange(-60).UnlockRound(18).ThumbStandard(Sandbox_MOAB).ThumbCamo(Sandbox_MOAB).ThumbRegen(Sandbox_MOAB).ThumbRegenCamo(Sandbox_MOAB);
         this.§+M§.push(_loc1_);
         _loc1_ = new BloonSendDef().ID("MOABGroup1").Type(Bloon.MOAB).Name("Fast MOAB").Hotkey("O").Quantity(1).Interval(0.5).Cost(1500).IncomeChange(-140).UnlockRound(20).ThumbStandard(Sandbox_MOAB).ThumbCamo(Sandbox_MOAB).ThumbRegen(Sandbox_MOAB).ThumbRegenCamo(Sandbox_MOAB);
         this.§+M§.push(_loc1_);
         _loc1_ = new BloonSendDef().ID("BFBGroup1").Type(Bloon.BFB).Name("BFB").Hotkey("Shift+O").Quantity(1).Interval(4).Cost(2500).IncomeChange(-350).UnlockRound(20).ThumbStandard(Sandbox_BFB).ThumbCamo(Sandbox_BFB).ThumbRegen(Sandbox_BFB).ThumbRegenCamo(Sandbox_BFB);
         this.§+M§.push(_loc1_);
         _loc1_ = new BloonSendDef().ID("FastBFBGroup1").Type(Bloon.BFB).Name("Fast BFB").Hotkey("P").Quantity(1).Interval(0.6).Cost(2500).IncomeChange(-350).UnlockRound(22).ThumbStandard(Sandbox_BFB).ThumbCamo(Sandbox_BFB).ThumbRegen(Sandbox_BFB).ThumbRegenCamo(Sandbox_BFB);
         this.§+M§.push(_loc1_);
         _loc1_ = new BloonSendDef().ID("ZOMGGroup1").Type(Bloon.§9?§).Name("ZOMG").Hotkey("Shift+P").Quantity(1).Interval(6).Cost(9000).IncomeChange(-1500).UnlockRound(22).ThumbStandard(Sandbox_OMFG).ThumbCamo(Sandbox_OMFG).ThumbRegen(Sandbox_OMFG).ThumbRegenCamo(Sandbox_OMFG);
         this.§+M§.push(_loc1_);
      }
      
      public function §2W§(param1:*) : BloonSendDef
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§+M§.length)
         {
            if(param1 == this.§+M§[_loc2_].id)
            {
               return this.§+M§[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function §6#§() : void
      {
         this.§+M§ = new Vector.<BloonSendDef>();
      }
      
      public function §4W§(param1:BloonSendDef) : void
      {
         param1.thumbStandard = this.§;,§[param1.type];
         param1.thumbRegen = this.§!S§[param1.type];
         param1.thumbCamo = this.§3D§[param1.type];
         param1.thumbRegenCamo = this.§^%§[param1.type];
         this.§+M§.push(param1);
      }
   }
}

