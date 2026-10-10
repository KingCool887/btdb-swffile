package display
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import utils.Pool;
   
   public class Frame
   {
      
      internal static const testMargin:int = 20;
      
      private static var memoryUsed:Number = 0;
      
      public var handle:Point = new Point();
      
      public var data:BitmapData;
      
      public var rotations:Vector.<BitmapData> = new Vector.<BitmapData>();
      
      public var rotatedHandles:Vector.<Point> = new Vector.<Point>();
      
      private var position:Point = new Point();
      
      public var label:String;
      
      private var sourceClass:Class = null;
      
      private var effectClass:Class = null;
      
      private var sourceIndex:int = 0;
      
      private var rotationCount:int = 0;
      
      public function Frame(param1:MovieClip, param2:Boolean, param3:int, param4:Object = null)
      {
         var _loc7_:int = 0;
         super();
         var _loc5_:Class = null;
         var _loc6_:Boolean = false;
         if(param4 is Class)
         {
            _loc5_ = Class(param4);
         }
         else if(param4 is Boolean)
         {
            _loc6_ = Boolean(param4);
         }
         this.rotationCount = param3;
         if(!param2)
         {
            this.label = param1.currentLabel;
            this.sourceClass = Class(getDefinitionByName(getQualifiedClassName(param1)));
            this.effectClass = null;
            this.sourceIndex = param1.currentFrame;
         }
         else
         {
            this.label = MovieClip(param1.getChildAt(0)).label;
            this.sourceClass = _loc5_;
            this.effectClass = Class(getDefinitionByName(getQualifiedClassName(param1)));
            this.sourceIndex = MovieClip(param1.getChildAt(0)).currentFrame;
         }
         this.data = this.copyToData(param1,this.handle);
         this.rotations.push(this.data);
         this.rotatedHandles.push(this.handle);
         if(_loc6_)
         {
            _loc7_ = 0;
            while(_loc7_ < param3)
            {
               this.initialiseRotation(_loc7_,param1);
               _loc7_++;
            }
         }
         else
         {
            while(this.rotations.length < param3)
            {
               this.rotations.push(null);
               this.rotatedHandles.push(null);
            }
         }
      }
      
      private function initialiseRotation(param1:int, param2:MovieClip = null) : void
      {
         if(param2 == null)
         {
            if(this.effectClass)
            {
               param2 = new this.effectClass();
               param2.addChild(new this.sourceClass());
               MovieClip(param2.getChildAt(0)).gotoAndStop(this.sourceIndex);
            }
            else
            {
               param2 = new this.sourceClass();
               param2.gotoAndStop(this.sourceIndex);
            }
         }
         var _loc3_:Point = new Point();
         this.rotations[param1] = this.copyToData(param2,_loc3_,param1 / this.rotationCount * Math.PI * 2);
         this.rotatedHandles[param1] = _loc3_;
         if(!this.effectClass)
         {
         }
      }
      
      private function copyToData(param1:MovieClip, param2:Point, param3:Number = 0) : BitmapData
      {
         var _loc4_:MovieClip = new MovieClip();
         param1.scaleX = §?V§.instance.scale;
         param1.scaleY = §?V§.instance.scale;
         _loc4_.addChild(param1);
         param1.rotation = param3 * 180 / Math.PI;
         var _loc5_:Rectangle = _loc4_.getBounds(null);
         _loc5_.x = Math.floor(_loc5_.x);
         _loc5_.y = Math.floor(_loc5_.y);
         param2.x = -_loc5_.x;
         param2.y = -_loc5_.y;
         var _loc6_:Matrix = Pool.get(Matrix);
         _loc6_.identity();
         _loc6_.translate(Math.ceil(param2.x + testMargin),Math.ceil(param2.y + testMargin));
         var _loc7_:BitmapData = new BitmapData(_loc5_.width + testMargin * 2,_loc5_.height + testMargin * 2,true,0);
         _loc7_.draw(_loc4_,_loc6_,null,null,null,true);
         _loc5_ = _loc7_.getColorBoundsRect(4278190080,0,false);
         param2.x += testMargin - _loc5_.x;
         param2.y += testMargin - _loc5_.y;
         this.position.x = 0;
         this.position.y = 0;
         _loc5_.width = Math.max(_loc5_.width,1);
         _loc5_.height = Math.max(_loc5_.height,1);
         var _loc8_:BitmapData = new BitmapData(_loc5_.width,_loc5_.height,true,0);
         _loc8_.copyPixels(_loc7_,_loc5_,this.position);
         _loc7_.dispose();
         Pool.release(_loc6_);
         var _loc9_:Number = _loc8_.width * _loc8_.height * 4 * 4 / (1024 * 1024);
         memoryUsed += _loc9_;
         return _loc8_;
      }
      
      public function quickDraw(param1:BitmapData, param2:Number, param3:Number) : void
      {
         this.position.x = param2 * §?V§.instance.scale - this.handle.x;
         this.position.y = param3 * §?V§.instance.scale - this.handle.y;
         param1.copyPixels(this.data,this.data.rect,this.position,null,null,true);
      }
      
      public function drawRotated(param1:BitmapData, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc6_:int = 0;
         var _loc7_:Point = null;
         var _loc8_:BitmapData = null;
         if(this.rotationCount > 0)
         {
            param4 += Math.PI / this.rotationCount;
            while(param4 < 0)
            {
               param4 += Math.PI * 2;
            }
            while(param4 >= Math.PI * 2)
            {
               param4 -= Math.PI * 2;
            }
            _loc6_ = Math.floor(this.rotationCount * param4 / (Math.PI * 2));
            if(this.rotations[_loc6_] == null)
            {
               this.initialiseRotation(_loc6_);
            }
            _loc7_ = this.rotatedHandles[_loc6_];
            _loc8_ = this.rotations[_loc6_];
            this.position.x = param2 * §?V§.instance.scale - _loc7_.x;
            this.position.y = param3 * §?V§.instance.scale - _loc7_.y;
            param1.copyPixels(_loc8_,_loc8_.rect,this.position,null,null,true);
            return;
         }
         var _loc5_:Matrix = Pool.get(Matrix);
         _loc5_.identity();
         _loc5_.translate(-this.handle.x,-this.handle.y);
         _loc5_.rotate(param4);
         _loc5_.translate(param2 * §?V§.instance.scale,param3 * §?V§.instance.scale);
         param1.draw(this.data,_loc5_,null,null,null,true);
         Pool.release(_loc5_);
      }
      
      public function drawScaled(param1:BitmapData, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         var _loc6_:Matrix = Pool.get(Matrix);
         _loc6_.identity();
         _loc6_.translate(-this.handle.x,-this.handle.y);
         _loc6_.scale(param5,param5);
         _loc6_.rotate(param4);
         _loc6_.translate(param2 * §?V§.instance.scale,param3 * §?V§.instance.scale);
         param1.draw(this.data,_loc6_,null,null,null,true);
         Pool.release(_loc6_);
      }
      
      public function drawWithEffect(param1:BitmapData, param2:Number, param3:Number, param4:MovieClip, param5:Number, param6:Boolean = false) : void
      {
         var _loc9_:Number = NaN;
         if(this.rotationCount != 0)
         {
            _loc9_ = Math.PI * 2 / this.rotationCount;
            param5 = Math.round(param5 / _loc9_) * _loc9_;
         }
         var _loc7_:Matrix = Pool.get(Matrix);
         _loc7_.identity();
         _loc7_.translate(-this.handle.x,-this.handle.y);
         _loc7_.rotate(param5);
         _loc7_.translate(param2 * §?V§.instance.scale,param3 * §?V§.instance.scale);
         var _loc8_:Bitmap = new Bitmap(this.data);
         param4.inner.addChild(_loc8_);
         param1.draw(param4,_loc7_,null,null,null,true);
         if(!param6)
         {
            param1.draw(this.data,_loc7_,null,null,null,true);
         }
         param4.inner.removeChildAt(0);
         Pool.release(_loc7_);
      }
      
      public function drawWithBlendMode(param1:BitmapData, param2:Number, param3:Number, param4:Number, param5:String) : void
      {
         var _loc6_:Matrix = Pool.get(Matrix);
         _loc6_.identity();
         _loc6_.translate(-this.handle.x,-this.handle.y);
         _loc6_.rotate(param4);
         _loc6_.translate(param2 * §?V§.instance.scale,param3 * §?V§.instance.scale);
         param1.draw(this.data,_loc6_,null,param5,null,true);
         Pool.release(_loc6_);
      }
   }
}

