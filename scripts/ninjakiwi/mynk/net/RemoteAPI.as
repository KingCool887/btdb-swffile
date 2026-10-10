package ninjakiwi.mynk.net
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLVariables;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.system.Security;
   
   public class RemoteAPI extends API
   {
      
      protected var _config:RemoteAPIConfig;
      
      protected var _loader:Loader;
      
      public function RemoteAPI(param1:String, param2:Object)
      {
         super();
         if(param1 == null || param2 == null)
         {
            throw new UninitializedError("RemoteAPI::RemoteAPI( ) - required argument was null");
         }
         this._config = new RemoteAPIConfig();
         this._config.url = param1;
         this._config.urlParams = this.parseParams(param2);
         this._loader = new Loader();
      }
      
      private function parseParams(param1:Object) : URLVariables
      {
         var _loc3_:String = null;
         var _loc2_:URLVariables = new URLVariables();
         for(_loc3_ in param1)
         {
            _loc2_[_loc3_] = param1[_loc3_];
         }
         return _loc2_;
      }
      
      public function get displayObject() : DisplayObjectContainer
      {
         return this._loader;
      }
      
      public function load() : void
      {
         Security.allowDomain(this._config.url);
         var _loc1_:URLRequest = new URLRequest(this._config.url);
         _loc1_.data = this._config.urlParams;
         var _loc2_:ApplicationDomain = new ApplicationDomain();
         var _loc3_:LoaderContext = new LoaderContext(false,_loc2_);
         this.addLoaderListeners();
         this._loader.load(_loc1_,_loc3_);
      }
      
      private function loadComplete(param1:Event) : void
      {
         this.removeLoaderListeners();
         _api = this._loader.content;
         dispatchEvent(param1);
      }
      
      private function loadFailed(param1:IOErrorEvent) : void
      {
         this.removeLoaderListeners();
         dispatchEvent(param1);
      }
      
      private function addLoaderListeners() : void
      {
         this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.loadComplete);
         this._loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.loadFailed);
      }
      
      private function removeLoaderListeners() : void
      {
         this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.loadComplete);
         this._loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.loadFailed);
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         super.addEventListener(param1,param2,param3,param4,param5);
         this._loader.addEventListener(param1,param2,param3,param4,param5);
      }
      
      override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         super.removeEventListener(param1,param2,param3);
         this._loader.removeEventListener(param1,param2,param3);
      }
      
      override public function hasEventListener(param1:String) : Boolean
      {
         return this._loader.hasEventListener(param1) || Boolean(super.hasEventListener(param1));
      }
      
      override public function willTrigger(param1:String) : Boolean
      {
         return this._loader.willTrigger(param1) || Boolean(super.willTrigger(param1));
      }
   }
}

class RemoteAPIConfig
{
   
   public var url:String;
   
   public var urlParams:Object;
   
   public function RemoteAPIConfig()
   {
      super();
   }
}
