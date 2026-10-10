package towers
{
   import §8K§.§ E§;
   import assets.towerBtns.AceTower;
   import assets.towerBtns.BombTower;
   import assets.towerBtns.BoomerangTower;
   import assets.towerBtns.BuccaneerTower;
   import assets.towerBtns.DartTower;
   import assets.towerBtns.DartlingTower;
   import assets.towerBtns.Engineer;
   import assets.towerBtns.FarmTower;
   import assets.towerBtns.GlueTower;
   import assets.towerBtns.IceTower;
   import assets.towerBtns.MortarTower;
   import assets.towerBtns.NinjaMonkey;
   import assets.towerBtns.SniperMonkey;
   import assets.towerBtns.SpikeFactory;
   import assets.towerBtns.SuperTower;
   import assets.towerBtns.TackTower;
   import assets.towerBtns.VillageTower;
   import assets.towerBtns.WizardTower;
   import flash.ui.Keyboard;
   
   public class §,X§
   {
      
      public var towersInMenu:Vector.<§ E§> = new Vector.<§ E§>();
      
      public var §#M§:Vector.<int> = Vector.<int>([0,50,250,500]);
      
      public function §,X§()
      {
         super();
         var _loc1_:§ E§ = new § E§().Id(0).Button(DartTower).§`$§(§?V§.instance.§=K§.§4§("DartMonkey")).Cost(200).§>R§(56).§&4§(Keyboard.Q).UnlockTier4Cost(30).UnlockTier4CostCPID(111);
         this.towersInMenu.push(_loc1_);
         var _loc2_:§ E§ = new § E§().Id(1).Button(TackTower).§`$§(§?V§.instance.§=K§.§4§("TackTower")).Cost(360).§>R§(57).§&4§(Keyboard.W).UnlockTier4Cost(30).UnlockTier4CostCPID(112);
         this.towersInMenu.push(_loc2_);
         var _loc3_:§ E§ = new § E§().Id(2).Button(SniperMonkey).§`$§(§?V§.instance.§=K§.§4§("SniperMonkey")).Cost(300).§>R§(70).§&4§(Keyboard.E).UnlockTier4Cost(30).UnlockTier4CostCPID(113);
         this.towersInMenu.push(_loc3_);
         var _loc4_:§ E§ = new § E§().Id(3).Button(NinjaMonkey).§`$§(§?V§.instance.§=K§.§4§("NinjaMonkey")).Cost(500).§>R§(71).§&4§(Keyboard.T).UnlockTier4Cost(30).UnlockTier4CostCPID(114);
         this.towersInMenu.push(_loc4_);
         var _loc5_:§ E§ = new § E§().Id(4).Button(BombTower).§`$§(§?V§.instance.§=K§.§4§("BombTower")).Cost(650).§>R§(59).§&4§(Keyboard.Y).UnlockTier4Cost(30).UnlockTier4CostCPID(115);
         this.towersInMenu.push(_loc5_);
         var _loc6_:§ E§ = new § E§().Id(5).Button(IceTower).§`$§(§?V§.instance.§=K§.§4§("IceTower")).Cost(300).§>R§(60).§&4§(Keyboard.A).§+?§(1).§6S§(10).§?T§(99).UnlockTier4Cost(30).UnlockTier4CostCPID(116);
         this.towersInMenu.push(_loc6_);
         var _loc7_:§ E§ = new § E§().Id(6).Button(BoomerangTower).§`$§(§?V§.instance.§=K§.§4§("BoomerangThrower")).Cost(350).§>R§(58).§&4§(Keyboard.R).§+?§(1).§6S§(12).§?T§(100).UnlockTier4Cost(36).UnlockTier4CostCPID(117);
         this.towersInMenu.push(_loc7_);
         var _loc8_:§ E§ = new § E§().Id(7).Button(GlueTower).§`$§(§?V§.instance.§=K§.§4§("GlueGunner")).Cost(270).§>R§(61).§&4§(Keyboard.S).§+?§(1).§6S§(15).§?T§(101).UnlockTier4Cost(45).UnlockTier4CostCPID(118);
         this.towersInMenu.push(_loc8_);
         var _loc9_:§ E§ = new § E§().Id(8).Button(BuccaneerTower).§`$§(§?V§.instance.§=K§.§4§("MonkeyBuccaneer")).Cost(500).§>R§(62).§&4§(Keyboard.D).§+?§(1).§6S§(12).§?T§(102).UnlockTier4Cost(36).UnlockTier4CostCPID(119);
         this.towersInMenu.push(_loc9_);
         var _loc10_:§ E§ = new § E§().Id(9).Button(AceTower).§`$§(§?V§.instance.§=K§.§4§("MonkeyAce")).Cost(700).§>R§(63).§&4§(Keyboard.F).§+?§(2).§6S§(20).§?T§(103).UnlockTier4Cost(60).UnlockTier4CostCPID(120);
         this.towersInMenu.push(_loc10_);
         var _loc11_:§ E§ = new § E§().Id(10).Button(MortarTower).§`$§(§?V§.instance.§=K§.§4§("MortarTower")).Cost(750).§>R§(68).§&4§(Keyboard.B).§+?§(2).§6S§(15).§?T§(104).UnlockTier4Cost(45).UnlockTier4CostCPID(121);
         this.towersInMenu.push(_loc11_);
         var _loc12_:§ E§ = new § E§().Id(11).Button(DartlingTower).§`$§(§?V§.instance.§=K§.§4§("DartlingGun")).Cost(950).§>R§(69).§&4§(Keyboard.N).§+?§(2).§6S§(18).§?T§(105).UnlockTier4Cost(50).UnlockTier4CostCPID(122);
         this.towersInMenu.push(_loc12_);
         var _loc13_:§ E§ = new § E§().Id(12).Button(SpikeFactory).§`$§(§?V§.instance.§=K§.§4§("SpikeFactory")).Cost(750).§>R§(103).§&4§(Keyboard.M).§+?§(2).§6S§(15).§?T§(106).UnlockTier4Cost(45).UnlockTier4CostCPID(123);
         this.towersInMenu.push(_loc13_);
         var _loc14_:§ E§ = new § E§().Id(13).Button(SuperTower).§`$§(§?V§.instance.§=K§.§4§("SuperMonkey")).Cost(3500).§>R§(64).§&4§(Keyboard.G).§+?§(3).§6S§(25).§?T§(107).UnlockTier4Cost(60).UnlockTier4CostCPID(124);
         this.towersInMenu.push(_loc14_);
         var _loc15_:§ E§ = new § E§().Id(14).Button(WizardTower).§`$§(§?V§.instance.§=K§.§4§("MonkeyApprentice")).Cost(400).§>R§(65).§&4§(Keyboard.H).§+?§(3).§6S§(20).§?T§(110).UnlockTier4Cost(60).UnlockTier4CostCPID(127);
         this.towersInMenu.push(_loc15_);
         var _loc16_:§ E§ = new § E§().Id(15).Button(VillageTower).§`$§(§?V§.instance.§=K§.§4§("MonkeyVillage")).Cost(1600).§>R§(66).§&4§(Keyboard.C).§+?§(3).§6S§(22).§?T§(109).UnlockTier4Cost(60).UnlockTier4CostCPID(126);
         this.towersInMenu.push(_loc16_);
         var _loc17_:§ E§ = new § E§().Id(16).Button(FarmTower).§`$§(§?V§.instance.§=K§.§4§("BananaFarm")).Cost(1000).§>R§(67).§&4§(Keyboard.V).§+?§(3).§6S§(22).§?T§(108).UnlockTier4Cost(60).UnlockTier4CostCPID(125);
         this.towersInMenu.push(_loc17_);
         var _loc18_:§ E§ = new § E§().Id(17).Button(Engineer).§`$§(§?V§.instance.§=K§.§4§("Engineer")).Cost(450).§>R§(67).§&4§(Keyboard.L).§+?§(3).§6S§(22).§?T§(108).UnlockTier4Cost(60).UnlockTier4CostCPID(125);
         this.towersInMenu.push(_loc18_);
      }
      
      public function §-§(param1:String) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.towersInMenu.length)
         {
            if(param1 == this.towersInMenu[_loc2_].tower.id)
            {
               return this.towersInMenu[_loc2_].id;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function §-4§() : Vector.<§ E§>
      {
         var _loc2_:§ E§ = null;
         var _loc1_:Vector.<§ E§> = new Vector.<§ E§>();
         for each(_loc2_ in this.towersInMenu)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
   }
}

