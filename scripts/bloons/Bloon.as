package bloons
{
   import §+C§.§0>§;
   import §8$§.§5T§;
   import §8$§.§7;§;
   import §8U§.§52§;
   import §;M§.§"L§;
   import assets.projectile.IceShard;
   import assets.sound.CeramicBloonHit;
   import assets.sound.FrozenBloonHit;
   import assets.sound.MetalBloonHit;
   import assets.sound.MoabDamage1;
   import assets.sound.MoabDamage2;
   import assets.sound.MoabDamage3;
   import assets.sound.MoabDestroyedBig;
   import assets.sound.MoabDestroyedMed;
   import assets.sound.MoabDestroyedShort;
   import assets.sounds.Pop1;
   import assets.sounds.Pop2;
   import assets.sounds.Pop3;
   import assets.sounds.Pop4;
   import display.BloonClip;
   import effects.Burst;
   import events.BloonEvent;
   import flash.display.BitmapData;
   import flash.events.EventDispatcher;
   import projectiles.Projectile;
   import projectiles.def.BurnEffectDef;
   import projectiles.def.DamageEffectDef;
   import projectiles.def.GlueEffectDef;
   import projectiles.def.IceEffectDef;
   import projectiles.def.ProjectileDef;
   import projectiles.def.StunEffectDef;
   import projectiles.def.WindEffectDef;
   import sound.§^5§;
   import towers.Tower;
   import utils.Pool;
   import weapons.Spread;
   
   public class Bloon extends §"L§
   {
      
      public static const §!%§:int = -1;
      
      public static const §`V§:int = 0;
      
      public static const §&R§:int = 1;
      
      public static const §>P§:int = 2;
      
      public static const §=8§:int = 3;
      
      public static const §=9§:int = 4;
      
      public static const §''§:int = 5;
      
      public static const §>%§:int = 6;
      
      public static const §?<§:int = 7;
      
      public static const §07§:int = 8;
      
      public static const §!@§:int = 9;
      
      public static const §0T§:int = 10;
      
      public static const MOAB:int = 11;
      
      public static const BFB:int = 12;
      
      public static const §9?§:int = 13;
      
      public static const §35§:int = 14;
      
      public static const §9E§:Number = 70;
      
      private static const §6F§:Number = 0.12;
      
      public static const §>K§:int = 0;
      
      public static const §"$§:int = 1;
      
      public static const §6G§:int = 2;
      
      public static const §!K§:int = 4;
      
      public static const §6'§:int = 8;
      
      public static const §&>§:int = 16;
      
      public static const §=,§:int = 32;
      
      public static const §"K§:int = 64;
      
      public static const §`=§:int = 128;
      
      public static const §8"§:int = 256;
      
      public static const §6%§:int = 65535;
      
      private static const §1X§:int = 3;
      
      private static const §^2§:int = 1200;
      
      public static var §60§:int = 0;
      
      public static const §??§:Vector.<int> = Vector.<int>([§`V§,§&R§,§>P§,§=8§,§=9§,§''§,§>%§,§?<§,§07§,§!@§,§0T§,MOAB,BFB,§9?§]);
      
      public static var §@§:EventDispatcher = new EventDispatcher();
      
      private static const §-7§:Vector.<int> = Vector.<int>([1,1,1,1,1,1,1,1,1,1,10,int(200),int(700),int(4000)]);
      
      public static const §]9§:Vector.<Number> = Vector.<Number>([1,1.4,1.8,3.2,3.5,1.8,2,1,1.8,2.2,2.5,1,0.25,0.18]);
      
      private static const §='§:Vector.<int> = Vector.<int>([§>K§,§>K§,§>K§,§>K§,§>K§,§6'§,§6G§,§=,§,§6G§ | §6'§,§>K§,§>K§,§!K§ | §6G§ | §"K§,§!K§ | §6G§ | §`=§,§!K§ | §6G§ | §8"§]);
      
      public static const §-M§:Vector.<int> = Vector.<int>([1,2,3,4,5,11,11,23,23,47,104,616,3164,16656]);
      
      private static const §2I§:Vector.<int> = Vector.<int>([null,null,null,null,null,§=9§,§=9§,§''§,§''§,§07§,§!@§,§0T§,MOAB,BFB]);
      
      private static const §]8§:Vector.<int> = Vector.<int>([1,1,1,1,1,2,2,2,2,2,2,4,4,4]);
      
      public static const §@0§:Vector.<Number> = Vector.<Number>([0,0,0,0,0,0,0,0,0,0,0,60,110,140]);
      
      public static const §%H§:Vector.<§^5§> = Vector.<§^5§>([new §^5§(Pop1),new §^5§(Pop2),new §^5§(Pop3),new §^5§(Pop4)]);
      
      private static var §#K§:§^5§ = new §^5§(MoabDestroyedBig);
      
      private static var §#>§:§^5§ = new §^5§(MoabDestroyedMed);
      
      private static var §3'§:§^5§ = new §^5§(MoabDestroyedShort);
      
      private static var §5?§:§^5§ = new §^5§(CeramicBloonHit);
      
      private static var §<?§:§^5§ = new §^5§(FrozenBloonHit);
      
      private static var §&%§:§^5§ = new §^5§(MetalBloonHit);
      
      private static var §82§:Vector.<§^5§> = Vector.<§^5§>([new §^5§(MoabDamage1),new §^5§(MoabDamage2),new §^5§(MoabDamage3)]);
      
      public static var §2+§:uint = 0;
      
      public var §^Q§:Boolean = false;
      
      public var §]?§:Number = 0;
      
      private var §>Y§:§7;§;
      
      public var §=E§:Number = 0;
      
      public var §91§:Number;
      
      public var overallProgress:Number = 0;
      
      public var clip:BloonClip = Pool.get(BloonClip);
      
      public var type:int = -1;
      
      public var §8J§:int;
      
      public var §#+§:int;
      
      public var §[&§:int;
      
      public var §1<§:int = 0;
      
      public var §'>§:Boolean = true;
      
      public var §,V§:Boolean = false;
      
      public var §3&§:Boolean = false;
      
      private var §"N§:int = 0;
      
      private var §+D§:Number = 0;
      
      private var §!N§:Number = 3;
      
      public var radius:Number = 0;
      
      public var §>>§:int = -1;
      
      public var §>6§:Number = 0;
      
      public var §;-§:Number = 0;
      
      public var §,E§:Boolean = false;
      
      private var §4X§:Number = 0;
      
      private var §#-§:Number = 1;
      
      private var §`§:Boolean = false;
      
      public var viralDepth:int = 0;
      
      private var §#9§:Boolean = false;
      
      private var freezeLayers:int = 1;
      
      private var arcticWind:Number = 1;
      
      private var §38§:int = 0;
      
      public var §43§:Tower = null;
      
      public var §@T§:Tower = null;
      
      private var §29§:Boolean = false;
      
      private var §;Q§:Number = 0;
      
      private var §?,§:Number = 0;
      
      private var §`7§:Number = 0;
      
      private var §6A§:Number = 1;
      
      private var §2§:Boolean = false;
      
      private var §'J§:Number = 1;
      
      public var §4%§:GlueEffectDef = null;
      
      private var §]B§:Boolean = false;
      
      private var §+@§:Boolean = false;
      
      private var §4L§:Number = 0;
      
      private var §`B§:Tower = null;
      
      private var §!I§:Boolean = false;
      
      private var §"W§:Number = 0;
      
      private var burnInterval:Number = 0;
      
      private var §1Q§:Number = 0;
      
      private var §8?§:Number = 0;
      
      private var §-J§:Boolean = false;
      
      public var id:uint = 0;
      
      public var §<G§:uint = 4294967295;
      
      public var §-H§:Vector.<uint> = new Vector.<uint>();
      
      protected var levelSlugg:§0>§ = null;
      
      public var isPlayerSent:Boolean = false;
      
      public var §71§:Boolean = false;
      
      public var §8C§:Boolean = false;
      
      internal var §,R§:§52§ = new §52§();
      
      public function Bloon()
      {
         super();
      }
      
      public static function §;U§() : Vector.<Boolean>
      {
         var _loc1_:Vector.<Boolean> = new Vector.<Boolean>();
         var _loc2_:int = 0;
         while(_loc2_ < §35§)
         {
            _loc1_.push(false);
            _loc2_++;
         }
         return _loc1_;
      }
      
      public static function §7#§() : Vector.<int>
      {
         var _loc1_:Vector.<int> = new Vector.<int>();
         var _loc2_:int = 0;
         while(_loc2_ < §35§)
         {
            _loc1_.push(0);
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function get levelSlug() : §0>§
      {
         return this.levelSlugg;
      }
      
      public function initialise(param1:§0>§, param2:int, param3:§7;§, param4:Number, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Number = 0) : void
      {
         this.levelSlugg = param1;
         this.id = §2+§++;
         this.§<G§ = this.id;
         this.§]?§ = param8;
         this.overallProgress = 0;
         this.§^Q§ = param1.§]§;
         this.isPlayerSent = param7;
         this.clip.decalVisible = param7;
         this.§-J§ = false;
         this.tile = param3;
         this.§=E§ = param4;
         this.§>>§ = param1.§%Y§.§1V§(x,y);
         this.§-H§.splice(0,this.§-H§.length);
         this.§,V§ = param6;
         this.§3&§ = param5;
         this.clip.camoVisible = this.§,V§ && param2 < MOAB;
         this.clip.regenVisible = this.§3&§ && param2 < MOAB;
         this.§4?§();
         this.§"N§ = param2 >= Bloon.MOAB ? Bloon.§0T§ : param2;
         this.§46§(param2);
         param3.§%Q§(this);
         var _loc9_:§52§ = param3.§'D§[0];
         var _loc10_:§52§ = param3.§'D§[1];
         rotation = Math.atan2(_loc10_.y - _loc9_.y,_loc10_.x - _loc9_.x);
      }
      
      public function §46§(param1:int) : void
      {
         this.type = param1;
         this.§#+§ = §-7§[param1];
         if(this.isPlayerSent && param1 >= MOAB && §?V§.instance.§"0§.§+O§ < 30)
         {
            this.§#+§ *= 0.5;
         }
         this.§91§ = §9E§ * §]9§[param1];
         if(§?V§.instance.§"0§.§+O§ >= 30)
         {
            this.§91§ *= 1 + (§?V§.instance.§"0§.§+O§ - 30) * 0.2;
            if(param1 >= MOAB)
            {
               this.§#+§ *= 1 + (§?V§.instance.§"0§.§+O§ - 30) * 0.4;
            }
         }
         if(§?V§.instance.§"0§.§+O§ >= 35 && param1 == §0T§)
         {
            this.§#+§ = 38;
         }
         this.§8J§ = this.§#+§;
         this.§[&§ = §-M§[param1];
         this.clip.setFrame(param1,this.§#+§ / this.§8J§,this.levelSlugg.§#1§);
         this.radius = this.clip.radius;
         this.§;-§ = §@0§[param1];
         if(param1 == §>%§)
         {
            this.§-J§ = true;
         }
         this.§'-§();
         if(param1 >= Bloon.MOAB)
         {
            z = §^2§ + this.zOffset;
         }
         else if(this.tile)
         {
            z = this.tile.layer + this.zOffset;
         }
         else
         {
            z = this.zOffset;
         }
      }
      
      public function get zOffset() : Number
      {
         return this.id * -0.000001 - 0.001;
      }
      
      private function §'-§() : void
      {
         if(this.type == -1)
         {
            return;
         }
         this.§1<§ = §='§[this.type];
         if(this.§,V§ && this.type < Bloon.MOAB)
         {
            this.§1<§ |= §"$§;
         }
         if(this.§;Q§ != 0)
         {
            this.§1<§ |= §!K§;
         }
      }
      
      public function §4?§() : void
      {
         this.§2?§();
         this.§#-§ = 1;
         this.§^"§();
         this.§]B§ = false;
         this.clip.stunVisible = false;
         this.§!I§ = false;
         this.clip.burnyStuffVisible = false;
         this.§4L§ = 0;
      }
      
      public function §2?§() : void
      {
         this.§,E§ = false;
         this.clip.iceVisible = false;
         this.§4X§ = 0;
         this.§`§ = false;
         this.§#9§ = false;
         this.freezeLayers = 1;
         this.viralDepth = 0;
      }
      
      public function §^"§() : void
      {
         this.§29§ = false;
         this.§4%§ = null;
         this.clip.glueState = 0;
         this.§;Q§ = 0;
         this.§?,§ = 0;
         this.§`7§ = 0;
         this.§6A§ = 1;
         this.§2§ = false;
      }
      
      public function §>'§() : void
      {
         this.levelSlugg.bloonLeaked(this);
         this.destroy();
      }
      
      override public function process(param1:Number) : void
      {
         var _loc4_:Vector.<Vector.<Bloon>> = null;
         var _loc5_:Vector.<Bloon> = null;
         var _loc6_:Bloon = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:* = undefined;
         if(this.levelSlugg == null)
         {
            return;
         }
         if(this.tile == null || this.type == -1)
         {
            return;
         }
         var _loc2_:Number = 1;
         if(this.§^Q§)
         {
            _loc2_ *= 0.5;
         }
         if(this.§38§ > 0)
         {
            --this.§38§;
            _loc2_ *= this.arcticWind;
            if(this.§38§ <= 0)
            {
               this.§38§ = 0;
               this.arcticWind = 1;
            }
         }
         if(this.§]B§)
         {
            _loc2_ *= 0;
            this.§4L§ -= param1;
            if(this.§4L§ <= 0)
            {
               this.§4L§ = 0;
               this.§]B§ = false;
               this.clip.stunVisible = false;
            }
         }
         if(this.§,E§)
         {
            _loc2_ *= 0;
            this.§4X§ -= param1;
            if(this.§4X§ <= 0)
            {
               this.§2?§();
               this.§'-§();
            }
            else if(this.§`§ && this.viralDepth > 0)
            {
               _loc4_ = this.levelSlugg.§%Y§.§`5§(x,y,this.radius);
               for each(_loc5_ in _loc4_)
               {
                  for each(_loc6_ in _loc5_)
                  {
                     if(!(_loc6_.§,E§ || _loc6_.type >= MOAB || this.viralDepth <= 0))
                     {
                        _loc7_ = _loc6_.x - x;
                        _loc8_ = _loc6_.y - y;
                        _loc9_ = _loc7_ * _loc7_ + _loc8_ * _loc8_;
                        _loc10_ = this.radius + _loc6_.radius - 20;
                        if(_loc10_ * _loc10_ >= _loc9_)
                        {
                           _loc6_.§8V§(this);
                           break;
                        }
                     }
                  }
               }
            }
         }
         if(this.§29§)
         {
            if(this.type != §0T§)
            {
               _loc2_ *= this.§6A§;
            }
            this.§;Q§ -= param1;
            if(this.§;Q§ <= 0)
            {
               this.§;Q§ = 0;
               this.§29§ = false;
               this.§4%§ = null;
               this.clip.glueState = 0;
               this.§'-§();
            }
            if(this.§?,§ != 0)
            {
               this.§`7§ -= param1;
               if(this.§`7§ <= 0)
               {
                  this.§`7§ = this.§?,§;
                  this.damage(1,this.§'J§,this.§@T§);
               }
            }
         }
         if(this.§!I§)
         {
            this.§"W§ -= param1;
            if(this.§"W§ <= 0)
            {
               this.§"W§ = this.burnInterval;
               this.damage(1,this.§8?§,this.§`B§);
            }
            this.§1Q§ -= param1;
            if(this.§1Q§ <= 0)
            {
               this.§!I§ = false;
               this.clip.burnyStuffVisible = false;
            }
         }
         this.§,R§.x = x;
         this.§,R§.y = y;
         if(this.tile == null || this.type == -1)
         {
            return;
         }
         if(this.§'>§)
         {
            this.§=E§ += this.§91§ * param1 * _loc2_ * this.§#-§;
            this.overallProgress += this.§91§ * param1 * _loc2_ * this.§#-§;
            this.tile.§%Q§(this);
            if(this.type == -1)
            {
               return;
            }
         }
         if(this.type >= Bloon.MOAB && this.§,R§.x != x || this.§,R§.y != y)
         {
            _loc11_ = Math.atan2(y - this.§,R§.y,x - this.§,R§.x);
            while(_loc11_ - rotation > Math.PI)
            {
               _loc11_ -= 2 * Math.PI;
            }
            while(_loc11_ - rotation <= -Math.PI)
            {
               _loc11_ += 2 * Math.PI;
            }
            if(_loc11_ > rotation)
            {
               rotation = Math.min(_loc11_,rotation + §6F§);
            }
            else if(_loc11_ < rotation)
            {
               rotation = Math.max(_loc11_,rotation - §6F§);
            }
         }
         var _loc3_:int = this.§>>§;
         this.§>>§ = this.levelSlugg.§%Y§.§1V§(x,y);
         if(this.§>>§ != _loc3_ && this.type != -1 && this.tile != null)
         {
            this.levelSlugg.§%Y§.§`L§(this,_loc3_,this.§>>§);
         }
         if(this.§3&§ && !this.§,E§ && this.type != this.§"N§)
         {
            this.§+D§ -= param1;
            if(this.§+D§ <= 0)
            {
               this.§+D§ += this.§!N§;
               this.§<>§();
            }
         }
      }
      
      public function §8V§(param1:Bloon) : void
      {
         if(this.type == §>%§ || this.type == §07§)
         {
            return;
         }
         this.§,E§ = true;
         this.clip.iceVisible = true;
         this.§4X§ = param1.§4X§;
         this.§#-§ = param1.§#-§;
         this.§`§ = param1.§`§;
         this.§#9§ = param1.§#9§;
         this.§43§ = param1.§43§;
         this.freezeLayers = param1.freezeLayers;
         --param1.viralDepth;
         param1.viralDepth = 0;
         this.§'-§();
      }
      
      override public function draw(param1:BitmapData) : void
      {
         if(this.type < Bloon.MOAB)
         {
            this.clip.quickDraw(param1,x,y);
         }
         else
         {
            this.clip.drawRotated(param1,x,y,rotation);
         }
      }
      
      public function §[Q§(param1:Projectile) : Boolean
      {
         var _loc2_:uint = 0;
         if(param1.def.canMultiEffect)
         {
            return false;
         }
         if(param1.§9H§.indexOf(this.id) != -1)
         {
            return true;
         }
         for each(_loc2_ in this.§-H§)
         {
            if(param1.§9H§.indexOf(_loc2_) != -1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function §99§(param1:Projectile) : void
      {
         var _loc7_:IceEffectDef = null;
         var _loc8_:GlueEffectDef = null;
         var _loc9_:BurnEffectDef = null;
         var _loc10_:WindEffectDef = null;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = false;
         var _loc14_:§52§ = null;
         var _loc15_:Vector.<§7;§> = null;
         var _loc16_:§7;§ = null;
         var _loc17_:§52§ = null;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:§5T§ = null;
         var _loc22_:Number = NaN;
         var _loc2_:int = this.type;
         var _loc3_:Tower = param1.owner;
         var _loc4_:DamageEffectDef = param1.def.damageEffect;
         var _loc5_:Number = param1.def.popCashScale;
         if(this.type < Bloon.MOAB)
         {
            _loc7_ = param1.def.iceEffect;
            _loc8_ = param1.def.glueEffect;
            _loc9_ = param1.def.burnEffect;
            _loc10_ = param1.def.windEffect;
         }
         var _loc6_:StunEffectDef = param1.def.stunEffect;
         if(_loc4_ != null)
         {
            _loc11_ = _loc4_.cantBreak == null || _loc4_.cantBreak.indexOf(this.type) == -1;
            _loc12_ = this.§,E§ == false || _loc4_.canBreakIce;
            if(_loc11_ && _loc12_)
            {
               param1.§9H§.push(this.id);
            }
            else if(this.§,E§)
            {
               §<?§.play();
               param1.pierce = 0;
            }
            else if(this.type == §?<§)
            {
               §&%§.play();
               param1.pierce = 0;
            }
         }
         else
         {
            param1.§9H§.push(this.id);
         }
         if(param1.def.removeCamo)
         {
            this.clip.camoVisible = this.§,V§ = false;
            this.§'-§();
         }
         if(param1.def.removeRegen && this.§3&§)
         {
            this.clip.regenVisible = this.§3&§ = false;
            this.clip.setFrame(this.type,this.§#+§ / this.§8J§,this.levelSlugg.§#1§);
         }
         if(_loc7_ != null)
         {
            this.§43§ = param1.owner;
            this.§#9§ = _loc7_.shards;
            if(_loc7_.lifespan != 0)
            {
               this.§,E§ = true;
               this.clip.iceVisible = true;
               this.§4X§ = _loc7_.lifespan;
               this.§#-§ = _loc7_.permafrost;
               this.§`§ = _loc7_.viral;
               this.viralDepth = 40;
               this.freezeLayers = _loc7_.freezeLayers;
               this.§'-§();
               if(this.§`§)
               {
                  §-1§.§2"§(this,param1);
               }
            }
            this.arcticWind = _loc7_.arcticWind;
            this.§38§ = 3;
         }
         if(_loc8_ != null)
         {
            this.§@T§ = _loc3_;
            this.§4%§ = _loc8_;
            this.§29§ = true;
            this.clip.glueState = 1;
            this.§;Q§ = _loc8_.lifespan;
            this.§6A§ = _loc8_.speedScale;
            this.§?,§ = _loc8_.corosionInterval;
            this.§`7§ = this.§?,§;
            this.§2§ = _loc8_.soak;
            this.§'J§ = _loc5_;
            this.§'-§();
            if(this.§?,§ != 0 && this.§?,§ <= 1)
            {
               this.clip.glueState = 2;
            }
         }
         if(_loc9_ != null)
         {
            _loc13_ = _loc9_.cantBurn == null || _loc9_.cantBurn.indexOf(this.type) == -1;
            if(_loc13_)
            {
               this.§`B§ = _loc3_;
               this.clip.burnyStuffVisible = true;
               this.§1Q§ = _loc9_.lifespan;
               this.burnInterval = _loc9_.burnInterval;
               if(!this.§!I§)
               {
                  this.§"W§ = this.burnInterval;
               }
               this.§!I§ = true;
               this.§8?§ = _loc5_;
            }
         }
         if(_loc10_ != null && Math.random() <= _loc10_.chance && this.type != §?<§ && this.type < MOAB)
         {
            _loc14_ = new §52§(x,y);
            _loc15_ = new Vector.<§7;§>();
            this.tile.§#!§(_loc15_);
            if(_loc15_.length != 0)
            {
               _loc16_ = _loc15_[Math.floor(Math.random() * _loc15_.length)];
               _loc17_ = _loc16_.§'D§[0];
               _loc18_ = _loc17_.x - _loc14_.x;
               _loc19_ = _loc17_.y - _loc14_.y;
               _loc20_ = Math.sqrt(_loc18_ * _loc18_ + _loc19_ * _loc19_);
               _loc21_ = new §5T§();
               _loc21_.§]M§ = true;
               _loc21_.layer = §1X§;
               _loc21_.§'D§ = Vector.<§52§>([_loc14_,_loc17_]);
               _loc21_.§<+§ = _loc21_.§-N§ = _loc20_;
               _loc21_.§^J§.push(_loc16_);
               this.tile = _loc21_;
               this.§=E§ = 0;
               this.overallProgress = 0;
               this.levelSlugg.§;$§ = true;
               if(param1.owner.§`!§ != "NinjaMonkey")
               {
                  this.§^"§();
                  this.§2?§();
               }
               this.§'-§();
            }
         }
         if(_loc4_ != null)
         {
            if(_loc11_ && _loc12_)
            {
               _loc22_ = _loc4_.damage;
               if(this.type >= Bloon.MOAB)
               {
                  _loc22_ *= _loc4_.blimpScale;
               }
               if(this.type == Bloon.§0T§)
               {
                  _loc22_ *= _loc4_.ceramicScale;
               }
               if(_loc4_.kill && this.type < MOAB)
               {
                  this.kill(_loc5_,_loc3_,_loc4_.showPop);
               }
               else if(_loc4_.peelLayer && this.type < MOAB)
               {
                  this.§1G§(1,_loc5_,_loc3_,_loc4_.showPop);
               }
               else
               {
                  this.damage(_loc22_,_loc5_,_loc3_,_loc4_.showPop);
               }
            }
         }
         if(_loc6_ != null)
         {
            if((_loc6_.cantEffect == null || _loc6_.cantEffect.indexOf(this.type) == -1) && _loc6_.isStunning(param1))
            {
               this.§]B§ = true;
               this.clip.stunVisible = true;
               this.§+@§ = _loc6_.inherit;
               this.§4L§ = _loc6_.lifespan;
               if(this.type == §9?§)
               {
                  this.§4L§ = Math.min(this.§4L§,0.5);
               }
               else if(this.type == BFB)
               {
                  this.§4L§ = Math.min(this.§4L§,2);
               }
               this.§'-§();
            }
         }
         if(_loc7_ != null)
         {
            this.§43§ = param1.owner;
            this.§#9§ = _loc7_.shards;
         }
      }
      
      public function damage(param1:int, param2:Number, param3:Tower, param4:Boolean = true) : void
      {
         var _loc5_:int = 0;
         var _loc6_:* = this.§#+§;
         while(param1 > 0 && this.type - _loc5_ >= §0T§)
         {
            _loc6_--;
            param1--;
            if(_loc6_ == 0)
            {
               _loc5_++;
               _loc6_ = §-7§[this.type - _loc5_];
            }
         }
         _loc5_ += param1;
         if(_loc5_ != 0)
         {
            this.§1G§(_loc5_,param2,param3,param4);
         }
         else
         {
            if(this.type == §0T§)
            {
               §5?§.play();
            }
            else if(this.type >= MOAB)
            {
               §82§[Math.floor(§82§.length * Math.random())].play(25);
            }
            this.§#+§ = _loc6_;
            this.clip.setFrame(this.type,this.§#+§ / this.§8J§,this.levelSlugg.§#1§);
         }
      }
      
      public function kill(param1:Number, param2:Tower, param3:Boolean = true) : void
      {
         this.§1G§(this.type + 1,param1,param2,param3);
      }
      
      public function §1G§(param1:int, param2:Number, param3:Tower, param4:Boolean = true) : void
      {
         var _loc11_:Burst = null;
         if(this.type < 0)
         {
            return;
         }
         param1 = param1 > this.type + 1 ? int(this.type + 1) : param1;
         if(param4 && §60§ < 15)
         {
            §%H§[int(Math.random() * 4)].play();
            ++§60§;
            _loc11_ = Pool.get(Burst);
            _loc11_.initialise(x,y,this.levelSlugg);
         }
         if(this.type == §9?§)
         {
            §#K§.play();
         }
         else if(this.type == BFB)
         {
            §#>§.play();
         }
         else if(this.type == MOAB)
         {
            §3'§.play();
         }
         var _loc5_:int = 1;
         var _loc6_:Boolean = false;
         var _loc8_:* = this.type;
         var _loc10_:int = 0;
         while(param1 > 0)
         {
            _loc10_ += _loc5_;
            if(_loc8_ == 0)
            {
               this.§2H§(param3,_loc10_);
               this.destroy();
               return;
            }
            if(§?V§.instance.§"0§.§+O§ < 35)
            {
               _loc5_ *= §]8§[_loc8_];
            }
            else if(_loc8_ >= MOAB)
            {
               _loc5_ *= §]8§[_loc8_];
            }
            _loc6_ = _loc8_ == §07§;
            if(_loc8_ == §>%§ || _loc8_ == §?<§ || _loc8_ == §07§)
            {
               _loc8_ -= 2;
            }
            else
            {
               _loc8_--;
            }
            param1--;
            if(!this.§2§)
            {
               this.§^"§();
               this.§'-§();
            }
            if(this.§,E§)
            {
               if(this.§#9§)
               {
                  this.§19§();
               }
               --this.freezeLayers;
               if(this.freezeLayers == 0)
               {
                  this.§2?§();
                  this.§'-§();
               }
            }
            else
            {
               this.§#-§ = 1;
            }
            if(!this.§+@§ && this.§]B§)
            {
               this.§]B§ = false;
               this.§4L§ = 0;
               this.clip.stunVisible = false;
            }
         }
         if(this.type >= MOAB && _loc8_ < MOAB)
         {
            this.levelSlugg.§;$§ = true;
            this.clip.camoVisible = this.§,V§;
            this.clip.regenVisible = this.§3&§;
         }
         this.§46§(_loc8_);
         if(--_loc5_ > 0)
         {
            this.§42§(_loc5_,_loc6_);
         }
         this.§2H§(param3,_loc10_);
         this.§-H§.push(this.id);
         this.id = §2+§++;
      }
      
      private function §2H§(param1:Tower, param2:int) : void
      {
         if(param1 != null)
         {
            param1.popCount += param2;
         }
         §@§.dispatchEvent(new BloonEvent(BloonEvent.POP,this,param2));
      }
      
      override public function destroy() : void
      {
         this.type = -1;
         this.levelSlugg.§^,§(this);
         this.levelSlugg = null;
      }
      
      internal function §42§(param1:int, param2:Boolean) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Bloon = null;
         var _loc6_:uint = 0;
         var _loc3_:int = 0;
         while(_loc3_ < param1)
         {
            _loc4_ = (_loc3_ + 1) * Math.min(60 / param1,20);
            _loc5_ = Pool.get(Bloon);
            if(param2)
            {
               _loc5_.initialise(this.levelSlugg,this.type - (1 - _loc3_ % 2),this.tile,this.§=E§ - _loc4_,this.§3&§,this.§,V§,this.isPlayerSent,this.§]?§);
            }
            else
            {
               _loc5_.initialise(this.levelSlugg,this.type,this.tile,this.§=E§ - _loc4_,this.§3&§,this.§,V§,this.isPlayerSent,this.§]?§);
            }
            this.levelSlugg.addBloon(_loc5_);
            _loc5_.§-H§.push(this.id);
            for each(_loc6_ in this.§-H§)
            {
               _loc5_.§-H§.push(_loc6_);
            }
            _loc5_.§,E§ = this.§,E§;
            _loc5_.§4X§ = this.§4X§;
            _loc5_.§#-§ = this.§#-§;
            _loc5_.§`§ = this.§`§;
            _loc5_.§#9§ = this.§#9§;
            _loc5_.§43§ = this.§43§;
            _loc5_.freezeLayers = this.freezeLayers;
            _loc5_.arcticWind = this.arcticWind;
            _loc5_.§38§ = this.§38§;
            _loc5_.§29§ = this.§29§;
            _loc5_.§;Q§ = this.§;Q§;
            _loc5_.§?,§ = this.§?,§;
            _loc5_.§`7§ = this.§`7§;
            _loc5_.§6A§ = this.§6A§;
            _loc5_.§2§ = this.§2§;
            _loc5_.§'J§ = this.§'J§;
            _loc5_.overallProgress = this.overallProgress - _loc4_;
            if(this.§+@§)
            {
               _loc5_.§]B§ = this.§]B§;
               _loc5_.§+@§ = this.§+@§;
               _loc5_.§4L§ = this.§4L§;
            }
            else
            {
               _loc5_.§]B§ = false;
               _loc5_.§4L§ = 0;
            }
            _loc5_.§+@§ = false;
            _loc5_.§!I§ = this.§!I§;
            _loc5_.§"W§ = this.§"W§;
            _loc5_.burnInterval = this.burnInterval;
            _loc5_.§1Q§ = this.§1Q§;
            _loc5_.§8?§ = this.§8?§;
            _loc5_.clip.bloonVisible = this.clip.bloonVisible;
            _loc5_.clip.camoVisible = this.§,V§ && _loc5_.type < Bloon.MOAB;
            _loc5_.clip.glueState = this.clip.glueState;
            _loc5_.clip.iceVisible = this.clip.iceVisible;
            _loc5_.clip.regenVisible = this.§3&§ && _loc5_.type < Bloon.MOAB;
            _loc5_.clip.burnyStuffVisible = this.clip.burnyStuffVisible;
            _loc5_.clip.stunVisible = this.clip.stunVisible;
            _loc5_.§"N§ = this.§"N§;
            _loc5_.§!N§ = this.§!N§;
            _loc5_.§+D§ = this.§!N§;
            _loc5_.§-J§ = this.§-J§;
            _loc5_.rotation = rotation;
            _loc5_.clip.setFrame(_loc5_.type,_loc5_.§#+§,this.levelSlugg.§#1§);
            _loc5_.§'-§();
            _loc3_++;
         }
      }
      
      public function §<>§() : void
      {
         if(this.type < this.§"N§)
         {
            if(this.type == §=9§ && this.§-J§ || this.type == §>%§)
            {
               ++this.type;
            }
            else if(this.type == §''§)
            {
               if(this.§"N§ == §?<§)
               {
                  ++this.type;
               }
               else
               {
                  this.type += 2;
               }
            }
            this.§46§(++this.type);
         }
      }
      
      public function get § !§() : Boolean
      {
         if(this.tile == null)
         {
            return false;
         }
         if(this.type >= Bloon.MOAB)
         {
            return false;
         }
         if(this.§>Y§.§]V§ == §7;§.underpass)
         {
            return true;
         }
         if(this.§>Y§.§]V§ == §7;§.§17§)
         {
            return true;
         }
         return false;
      }
      
      public function get tile() : §7;§
      {
         return this.§>Y§;
      }
      
      public function set tile(param1:§7;§) : void
      {
         var _loc2_:int = this.§>Y§ != null ? this.§>Y§.layer : 0;
         this.§>Y§ = param1;
         if(Boolean(this.§>Y§) && Boolean(this.§>Y§.§]V§ == §7;§.§?D§) && this.type < Bloon.MOAB)
         {
            this.clip.bloonVisible = false;
         }
         else
         {
            this.clip.bloonVisible = true;
         }
         if(this.type >= Bloon.MOAB)
         {
            return;
         }
         if(this.§>Y§ != null && _loc2_ != this.tile.layer)
         {
            z = this.§>Y§.layer + this.zOffset;
            this.levelSlugg.§;$§ = true;
         }
      }
      
      public function §]4§() : Number
      {
         return this.tile.§]4§() - this.§=E§;
      }
      
      public function §&E§() : Number
      {
         return this.tile.§&E§() - this.tile.§-N§ + this.§=E§;
      }
      
      private function §19§() : void
      {
         var _loc1_:ProjectileDef = new ProjectileDef().Display(IceShard).Pierce(1).DamageEffect(new DamageEffectDef().Damage(1).CantBreak(Vector.<int>([Bloon.§?<§])).CanBreakIce(false));
         var _loc2_:Spread = new Spread().Range(70).Power(350).ReloadTime(1.66).Projectile(_loc1_).Angle(Math.PI * 2 * 2 / 3).Count(5).Rotate(false).RandRotate(true);
         _loc2_.execute(this.§43§,this,null);
      }
   }
}

