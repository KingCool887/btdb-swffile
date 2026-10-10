package projectiles.behavior.process
{
   import §8U§.§!=§;
   import §8U§.§%L§;
   import §8U§.§52§;
   import §8U§.CubicBezierDef;
   import events.PropertyModEvent;
   import flash.utils.Dictionary;
   import projectiles.Projectile;
   import utils.Pool;
   
   public class FollowPath extends BehaviorProcess
   {
      
      private static var displayOrder:Vector.<String> = null;
      
      public static var concreteCurves:Dictionary = new Dictionary();
      
      private var path_:Vector.<CubicBezierDef>;
      
      public function FollowPath()
      {
         super();
      }
      
      public static function getDisplayOrder() : Vector.<String>
      {
         if(displayOrder == null)
         {
            displayOrder = new Vector.<String>();
            displayOrder.push("path");
         }
         return displayOrder;
      }
      
      public function set path(param1:Vector.<CubicBezierDef>) : void
      {
         if(this.path_ != param1)
         {
            this.path_ = param1;
            dispatchEvent(new PropertyModEvent("path"));
         }
      }
      
      public function get path() : Vector.<CubicBezierDef>
      {
         return this.path_;
      }
      
      public function Path(param1:Array) : FollowPath
      {
         var _loc2_:CubicBezierDef = null;
         if(this.path == null)
         {
            this.path = new Vector.<CubicBezierDef>();
         }
         for each(_loc2_ in param1)
         {
            this.path.push(_loc2_);
         }
         return this;
      }
      
      override public function execute(param1:Projectile, param2:Number) : void
      {
         var _loc4_:§52§ = null;
         var _loc5_:§52§ = null;
         var _loc6_:Vector.<§%L§> = null;
         var _loc7_:CubicBezierDef = null;
         var _loc8_:§%L§ = null;
         var _loc3_:§!=§ = concreteCurves[param1.owner];
         if(_loc3_ == null)
         {
            _loc6_ = new Vector.<§%L§>();
            for each(_loc7_ in this.path)
            {
               _loc8_ = new §%L§();
               _loc8_.initialise(_loc7_);
               _loc6_.push(_loc8_);
            }
            _loc3_ = new §!=§();
            _loc3_.initialise(_loc6_);
            concreteCurves[param1.owner] = _loc3_;
         }
         _loc4_ = Pool.get(§52§);
         _loc4_.x = 24;
         _loc4_.y = 12;
         _loc4_.§ =§(param1.§#J§.rotation);
         _loc5_ = new §52§();
         _loc3_.§4;§(param1.§75§.current / param1.§75§.delay,_loc5_,param1.§#J§.rotation,param1.owner.x + _loc4_.x,param1.owner.y + _loc4_.y);
         Pool.release(_loc4_);
         param1.x = _loc5_.x;
         param1.y = _loc5_.y;
         param1.rotation = param1.§75§.current / param1.§75§.delay * Math.PI * 2 * 3;
      }
   }
}

