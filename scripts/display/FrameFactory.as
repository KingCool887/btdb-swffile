package display
{
   import flash.display.MovieClip;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class FrameFactory
   {
      
      private var frames:Dictionary = new Dictionary();
      
      public function FrameFactory()
      {
         super();
      }
      
      public function getFrames(param1:Class, param2:int) : Vector.<Frame>
      {
         var _loc3_:* = getQualifiedClassName(param1) + "_clip";
         var _loc4_:Vector.<Frame> = this.frames[_loc3_];
         if(_loc4_ != null)
         {
            return _loc4_;
         }
         var _loc5_:MovieClip = new param1();
         _loc4_ = new Vector.<Frame>();
         var _loc6_:int = 1;
         while(_loc6_ <= _loc5_.totalFrames)
         {
            _loc5_.gotoAndStop(_loc6_);
            _loc4_.push(new Frame(_loc5_,false,param2));
            _loc6_++;
         }
         this.frames[_loc3_] = _loc4_;
         return _loc4_;
      }
      
      public function getEffectFrames(param1:Class, param2:Class, param3:int) : Vector.<Frame>
      {
         var _loc4_:* = getQualifiedClassName(param1) + "_" + getQualifiedClassName(param2) + "_clip";
         var _loc5_:Vector.<Frame> = this.frames[_loc4_];
         if(_loc5_ != null)
         {
            return _loc5_;
         }
         var _loc6_:MovieClip = new param1();
         var _loc7_:MovieClip = new param2();
         _loc5_ = new Vector.<Frame>();
         _loc7_.inner.addChild(_loc6_);
         var _loc8_:int = 1;
         while(_loc8_ <= _loc6_.totalFrames)
         {
            _loc6_.gotoAndStop(_loc8_);
            _loc5_.push(new Frame(_loc7_,true,param3,param1));
            _loc8_++;
         }
         this.frames[_loc4_] = _loc5_;
         return _loc5_;
      }
      
      public function destroyFrames(param1:Class) : void
      {
         var _loc4_:Frame = null;
         var _loc2_:* = getQualifiedClassName(param1) + "_clip";
         var _loc3_:Vector.<Frame> = this.frames[_loc2_];
         this.frames[_loc2_] = null;
         if(_loc3_ != null)
         {
            for each(_loc4_ in _loc3_)
            {
               _loc4_.data.dispose();
            }
         }
      }
   }
}

