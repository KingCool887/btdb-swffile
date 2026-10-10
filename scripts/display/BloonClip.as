package display
{
   import assets.BurnEffect;
   import assets.CamoEffect;
   import assets.DecalsSized;
   import assets.DissolverEffect;
   import assets.GlueEffect;
   import assets.IceEffect;
   import assets.bloon.Bfb;
   import assets.bloon.BfbProps;
   import assets.bloon.BossBlimp;
   import assets.bloon.BossBlimpProps;
   import assets.bloon.Moab;
   import assets.bloon.MoabProps;
   import assets.bloons.Black;
   import assets.bloons.BlackRegen;
   import assets.bloons.Blue;
   import assets.bloons.BlueRegen;
   import assets.bloons.Ceramic;
   import assets.bloons.CeramicRegen;
   import assets.bloons.Green;
   import assets.bloons.GreenRegen;
   import assets.bloons.Lead;
   import assets.bloons.LeadRegen;
   import assets.bloons.Pink;
   import assets.bloons.PinkRegen;
   import assets.bloons.Rainbow;
   import assets.bloons.RainbowRegen;
   import assets.bloons.Red;
   import assets.bloons.RedRegen;
   import assets.bloons.White;
   import assets.bloons.WhiteRegen;
   import assets.bloons.Yellow;
   import assets.bloons.YellowRegen;
   import assets.bloons.Zebra;
   import assets.bloons.ZebraRegen;
   import assets.effects.Stun;
   import bloons.Bloon;
   import decals.§<C§;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   
   public class BloonClip
   {
      
      internal static var bloonFrameSets:Vector.<Vector.<Frame>>;
      
      internal static var regenBloonFrameSets:Vector.<Vector.<Frame>>;
      
      internal static var camoFrames:Vector.<Frame>;
      
      internal static var regenFrames:Vector.<Frame>;
      
      internal static var iceFrames:Vector.<Frame>;
      
      internal static var glueFrames:Vector.<Frame>;
      
      internal static var dissolverFrames:Vector.<Frame>;
      
      internal static var burnyFrames:Vector.<Frame>;
      
      internal static var stunFrames:Vector.<Frame>;
      
      internal static var levelDecalFrames:Vector.<Vector.<Frame>>;
      
      internal static var propFrames:Vector.<Vector.<Frame>> = new Vector.<Vector.<Frame>>();
      
      public static var sourceClasses:Vector.<Class> = Vector.<Class>([Red,Blue,Green,Yellow,Pink,Black,White,Lead,Zebra,Rainbow,Ceramic,Moab,Bfb,BossBlimp]);
      
      public static var regenSourceClasses:Vector.<Class> = Vector.<Class>([RedRegen,BlueRegen,GreenRegen,YellowRegen,PinkRegen,BlackRegen,WhiteRegen,LeadRegen,ZebraRegen,RainbowRegen,CeramicRegen,RainbowRegen,RainbowRegen,RainbowRegen]);
      
      public static var labels:Vector.<String> = Vector.<String>(["red","blue","green","yellow","pink","black","white","lead","zebra","rainbow","ceramic","regen"]);
      
      internal var bloonFrame:Frame;
      
      internal var camoFrame:Frame;
      
      internal var regenFrame:Frame;
      
      internal var iceFrame:Frame;
      
      internal var glueFrame:Frame;
      
      internal var dissolverFrame:Frame;
      
      internal var decalFrame:Frame;
      
      internal var currentBurnyFrames:Vector.<Frame> = new Vector.<Frame>();
      
      internal var currentStunFrames:Vector.<Frame> = new Vector.<Frame>();
      
      internal var currentPropFrames:Vector.<Frame> = new Vector.<Frame>();
      
      internal var propIndex:int = 0;
      
      internal var stunFrameIndex:int = 0;
      
      internal var burnyFrameIndex:int = 0;
      
      public var bloonVisible:Boolean = true;
      
      public var camoVisible:Boolean = false;
      
      public var regenVisible:Boolean = false;
      
      public var decalVisible:Boolean = false;
      
      public var iceVisible:Boolean = false;
      
      public var glueState:int = 0;
      
      public var burnyStuffVisible:Boolean = false;
      
      public var stunVisible:Boolean = false;
      
      public function BloonClip()
      {
         var _loc1_:FrameFactory = null;
         var _loc2_:int = 0;
         super();
         if(bloonFrameSets == null)
         {
            _loc1_ = §?V§.instance.§1=§;
            bloonFrameSets = new Vector.<Vector.<Frame>>();
            regenBloonFrameSets = new Vector.<Vector.<Frame>>();
            _loc2_ = 0;
            while(_loc2_ < sourceClasses.length)
            {
               bloonFrameSets.push(§?V§.instance.§1=§.getFrames(sourceClasses[_loc2_],_loc2_ >= Bloon.MOAB ? 32 : 0));
               regenBloonFrameSets.push(§?V§.instance.§1=§.getFrames(regenSourceClasses[_loc2_],0));
               _loc2_++;
            }
            camoFrames = _loc1_.getFrames(CamoEffect,0);
            iceFrames = _loc1_.getFrames(IceEffect,0);
            glueFrames = _loc1_.getFrames(GlueEffect,0);
            dissolverFrames = _loc1_.getFrames(DissolverEffect,0);
            burnyFrames = _loc1_.getFrames(BurnEffect,0);
            stunFrames = _loc1_.getFrames(Stun,0);
            propFrames = new Vector.<Vector.<Frame>>();
            propFrames.push(_loc1_.getFrames(MoabProps,32));
            propFrames.push(_loc1_.getFrames(BfbProps,32));
            propFrames.push(_loc1_.getFrames(BossBlimpProps,32));
         }
      }
      
      public static function setDecalFrames(param1:int, param2:int) : void
      {
         var _loc3_:MovieClip = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:§<C§ = null;
         levelDecalFrames = new Vector.<Vector.<Frame>>();
         levelDecalFrames.push(new Vector.<Frame>());
         levelDecalFrames.push(new Vector.<Frame>());
         if(param1 > 0 || param2 > 0)
         {
            _loc3_ = new DecalsSized();
            _loc4_ = 0;
            _loc5_ = 0;
            _loc6_ = 0;
            while(_loc6_ < §?V§.instance.§%5§.§'"§.length)
            {
               _loc8_ = §?V§.instance.§%5§.§'"§[_loc6_];
               if(_loc8_.id == param1)
               {
                  _loc4_ = _loc8_.§0Y§;
               }
               if(_loc8_.id == param2)
               {
                  _loc5_ = _loc8_.§0Y§;
               }
               _loc6_++;
            }
            _loc7_ = 1;
            while(_loc7_ <= _loc3_.totalFrames)
            {
               _loc3_.gotoAndStop(_loc7_);
               if(_loc4_ > 0)
               {
                  _loc3_.decals.gotoAndStop(_loc4_);
                  levelDecalFrames[0].push(new Frame(_loc3_,false,32,true));
               }
               if(_loc5_ > 0)
               {
                  _loc3_.decals.gotoAndStop(_loc5_);
                  levelDecalFrames[1].push(new Frame(_loc3_,false,32,true));
               }
               _loc7_++;
            }
         }
      }
      
      public function setFrame(param1:int, param2:Number = 0, param3:int = 0) : void
      {
         var _loc4_:Vector.<Frame> = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:Frame = null;
         var _loc9_:Vector.<Frame> = null;
         var _loc10_:String = null;
         param2 = Math.min(Math.max(0,param2),1);
         if(!this.regenVisible)
         {
            _loc4_ = bloonFrameSets[param1];
         }
         else
         {
            _loc4_ = regenBloonFrameSets[param1];
         }
         this.bloonFrame = _loc4_[Math.max(1,Math.ceil(_loc4_.length * (1 - param2))) - 1];
         this.decalFrame = null;
         if(!this.regenVisible)
         {
            if(param1 < Bloon.MOAB)
            {
               this.camoFrame = camoFrames[param1];
               this.iceFrame = iceFrames[param1];
               this.glueFrame = glueFrames[param1];
               this.dissolverFrame = dissolverFrames[param1];
               _loc7_ = labels[param1];
            }
            else
            {
               _loc7_ = null;
            }
            if(this.decalVisible && levelDecalFrames[param3].length > 0)
            {
               if(param1 < Bloon.MOAB)
               {
                  this.decalFrame = levelDecalFrames[param3][param1];
               }
               else
               {
                  _loc5_ = 12 + 4 * (param1 - Bloon.MOAB) + int(4 * (1 - param2 - 0.0001));
                  this.decalFrame = levelDecalFrames[param3][_loc5_];
               }
            }
         }
         else
         {
            _loc6_ = 11;
            this.camoFrame = camoFrames[_loc6_];
            this.iceFrame = iceFrames[_loc6_];
            this.glueFrame = glueFrames[_loc6_];
            this.dissolverFrame = dissolverFrames[_loc6_];
            _loc7_ = "regen";
            if(this.decalVisible && levelDecalFrames[param3].length > 0)
            {
               this.decalFrame = levelDecalFrames[param3][_loc6_];
            }
         }
         if(_loc7_)
         {
            this.currentBurnyFrames.splice(0,this.currentBurnyFrames.length);
            for each(_loc8_ in burnyFrames)
            {
               if(_loc8_.label == _loc7_)
               {
                  this.currentBurnyFrames.push(_loc8_);
               }
            }
            this.currentStunFrames.splice(0,this.currentStunFrames.length);
            for each(_loc8_ in stunFrames)
            {
               if(_loc8_.label == _loc7_)
               {
                  this.currentStunFrames.push(_loc8_);
               }
            }
         }
         if(param1 >= Bloon.MOAB)
         {
            _loc9_ = propFrames[param1 - Bloon.MOAB];
            this.currentPropFrames.splice(0,this.currentPropFrames.length);
            _loc10_ = Math.max(1,Math.ceil(4 * (1 - param2))).toString();
            for each(_loc8_ in _loc9_)
            {
               if(_loc8_.label == _loc10_)
               {
                  this.currentPropFrames.push(_loc8_);
               }
            }
         }
      }
      
      public function quickDraw(param1:BitmapData, param2:Number, param3:Number) : void
      {
         if(this.bloonVisible)
         {
            if(this.burnyStuffVisible && this.currentBurnyFrames.length > 0)
            {
               ++this.burnyFrameIndex;
               this.burnyFrameIndex = this.burnyFrameIndex < this.currentBurnyFrames.length ? this.burnyFrameIndex : 0;
               this.currentBurnyFrames[this.burnyFrameIndex].quickDraw(param1,param2,param3);
            }
            if(this.bloonFrame)
            {
               this.bloonFrame.quickDraw(param1,param2,param3);
            }
            if(this.camoVisible && Boolean(this.camoFrame))
            {
               this.camoFrame.quickDraw(param1,param2,param3);
            }
            if(this.iceVisible && Boolean(this.iceFrame))
            {
               this.iceFrame.quickDraw(param1,param2,param3);
            }
            if(this.glueState == 1 && Boolean(this.glueFrame))
            {
               this.glueFrame.quickDraw(param1,param2,param3);
            }
            else if(this.glueState == 2 && Boolean(this.dissolverFrame))
            {
               this.dissolverFrame.quickDraw(param1,param2,param3);
            }
            if(this.stunVisible && this.currentStunFrames.length > 0)
            {
               ++this.stunFrameIndex;
               this.stunFrameIndex = this.stunFrameIndex < this.currentStunFrames.length ? this.stunFrameIndex : 0;
               if(this.currentStunFrames.length > 0)
               {
                  this.currentStunFrames[this.stunFrameIndex].quickDraw(param1,param2,param3);
               }
            }
            if(this.decalVisible && Boolean(this.decalFrame))
            {
               this.decalFrame.quickDraw(param1,param2,param3);
            }
         }
      }
      
      public function drawRotated(param1:BitmapData, param2:Number, param3:Number, param4:Number) : void
      {
         if(this.currentPropFrames.length > 0)
         {
            ++this.propIndex;
            this.propIndex = this.propIndex < this.currentPropFrames.length ? this.propIndex : 0;
            this.currentPropFrames[this.propIndex].drawRotated(param1,param2,param3,param4);
         }
         if(this.bloonFrame)
         {
            this.bloonFrame.drawRotated(param1,param2,param3,param4);
         }
         if(this.bloonVisible && this.decalVisible && Boolean(this.decalFrame))
         {
            this.decalFrame.drawRotated(param1,param2,param3,param4);
         }
      }
      
      public function get radius() : Number
      {
         return this.bloonFrame.data.height / 2;
      }
   }
}

