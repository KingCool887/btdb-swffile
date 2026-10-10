package display
{
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.utils.Dictionary;
   
   public class Clip
   {
      
      public var frameIndex:int = 0;
      
      public var frames:Vector.<Frame>;
      
      private var playing:Boolean = true;
      
      public var labelOver:Dictionary = new Dictionary();
      
      public var sourceClass:Class = null;
      
      public var looping:Boolean = false;
      
      public function Clip()
      {
         super();
      }
      
      public function initialise(param1:Class, param2:int) : void
      {
         this.sourceClass = param1;
         this.frameIndex = 0;
         this.frames = §?V§.instance.§1=§.getFrames(param1,param2);
      }
      
      public function initialiseWithEffect(param1:Class, param2:Class, param3:int) : void
      {
         this.frameIndex = 0;
         this.frames = §?V§.instance.§1=§.getEffectFrames(param1,param2,param3);
      }
      
      public function process() : void
      {
         if(Boolean(this.frames[this.frameIndex].label) && Boolean(this.labelOver[this.frames[this.frameIndex].label]) && (this.frameIndex + 1 >= this.frames.length || this.frames[this.frameIndex].label != this.frames[this.frameIndex + 1].label))
         {
            switch(this.labelOver[this.frames[this.frameIndex].label].command)
            {
               case LabelOverCommand.gotoAndPlay:
                  if(this.labelOver[this.frames[this.frameIndex].label].frameLabelTo)
                  {
                     this.gotoLabel(this.labelOver[this.frames[this.frameIndex].label].frameLabelTo);
                  }
                  else
                  {
                     this.frameIndex = this.labelOver[this.frames[this.frameIndex].label].frameNoTo;
                  }
                  this.playing = true;
                  break;
               case LabelOverCommand.gotoAndStop:
                  if(this.labelOver[this.frames[this.frameIndex].label].frameLabelTo)
                  {
                     this.gotoLabel(this.labelOver[this.frames[this.frameIndex].label].frameLabelTo);
                  }
                  else
                  {
                     this.frameIndex = this.labelOver[this.frames[this.frameIndex].label].frameNoTo;
                  }
                  this.playing = false;
            }
         }
         else if(this.playing)
         {
            ++this.frameIndex;
            if(this.frameIndex >= this.frames.length)
            {
               if(!this.looping)
               {
                  --this.frameIndex;
                  this.playing = false;
               }
               else
               {
                  this.frameIndex = 0;
               }
            }
         }
      }
      
      public function quickDraw(param1:BitmapData, param2:Number, param3:Number) : void
      {
         this.frames[this.frameIndex].quickDraw(param1,param2,param3);
      }
      
      public function drawRotated(param1:BitmapData, param2:Number, param3:Number, param4:Number) : void
      {
         this.frames[this.frameIndex].drawRotated(param1,param2,param3,param4);
      }
      
      public function drawScaled(param1:BitmapData, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         this.frames[this.frameIndex].drawScaled(param1,param2,param3,param4,param5);
      }
      
      public function drawWithEffect(param1:BitmapData, param2:Number, param3:Number, param4:MovieClip, param5:Number = 0, param6:Boolean = false) : void
      {
         this.frames[this.frameIndex].drawWithEffect(param1,param2,param3,param4,param5,param6);
      }
      
      public function drawWithBlendMode(param1:BitmapData, param2:Number, param3:Number, param4:Number, param5:String) : void
      {
         this.frames[this.frameIndex].drawWithBlendMode(param1,param2,param3,param4,param5);
      }
      
      public function gotoAndStop(param1:int) : void
      {
         if(param1 <= 0)
         {
            var _loc2_:int = 0;
         }
         else
         {
            _loc2_ = param1;
         }
         this.frameIndex = _loc2_;
         this.playing = false;
      }
      
      public function gotoAndPlay(param1:int) : void
      {
         if(param1 <= 0)
         {
            var _loc2_:int = 0;
         }
         else
         {
            _loc2_ = param1;
         }
         this.frameIndex = _loc2_;
         this.playing = true;
      }
      
      public function stop() : void
      {
         this.playing = false;
      }
      
      public function play() : void
      {
         this.playing = true;
      }
      
      public function get frameCount() : int
      {
         return this.frames.length;
      }
      
      public function get currentLabel() : String
      {
         return this.frames[this.frameIndex].label;
      }
      
      public function getLabelIndex(param1:String) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.frames.length)
         {
            if(this.frames[_loc2_].label == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function gotoLabel(param1:String) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.frames.length)
         {
            if(this.frames[_loc2_].label == param1)
            {
               this.frameIndex = _loc2_;
               break;
            }
            _loc2_++;
         }
      }
      
      public function hasLabel(param1:String) : Boolean
      {
         var _loc2_:Frame = null;
         for each(_loc2_ in this.frames)
         {
            if(_loc2_.label == param1)
            {
               return true;
            }
         }
         return false;
      }
   }
}

