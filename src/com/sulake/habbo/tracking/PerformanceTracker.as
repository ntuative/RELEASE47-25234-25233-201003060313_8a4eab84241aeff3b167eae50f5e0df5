package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1550:GarbageMonitor = null;
      
      private var var_1313:int = 0;
      
      private var var_1135:Boolean = false;
      
      private var var_1656:String = "";
      
      private var var_1549:String = "";
      
      private var var_363:Number = 0;
      
      private var var_1311:int = 10;
      
      private var var_2322:Array;
      
      private var var_627:int = 0;
      
      private var var_1310:int = 60;
      
      private var var_1078:int = 0;
      
      private var var_1077:int = 0;
      
      private var var_1651:String = "";
      
      private var var_2193:Number = 0;
      
      private var var_1312:int = 1000;
      
      private var var_2191:Boolean = true;
      
      private var var_2192:Number = 0.15;
      
      private var var_153:IHabboConfigurationManager = null;
      
      private var var_1653:String = "";
      
      private var var_1314:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2322 = [];
         super();
         var_1549 = Capabilities.version;
         var_1656 = Capabilities.os;
         var_1135 = Capabilities.isDebugger;
         var_1653 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1550 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1313 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1550.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1550.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_363;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1310 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1549;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_1077;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1312)
         {
            ++var_1078;
            _loc3_ = true;
         }
         else
         {
            ++var_627;
            if(var_627 <= 1)
            {
               var_363 = param1;
            }
            else
            {
               _loc4_ = Number(var_627);
               var_363 = var_363 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1313 > var_1310 * 1000 && var_1314 < var_1311)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_363);
            _loc5_ = true;
            if(var_2191 && var_1314 > 0)
            {
               _loc6_ = differenceInPercents(var_2193,var_363);
               if(_loc6_ < var_2192)
               {
                  _loc5_ = false;
               }
            }
            var_1313 = getTimer();
            if(_loc5_ || _loc3_)
            {
               var_2193 = var_363;
               if(sendReport())
               {
                  ++var_1314;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1311 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1312 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_1653,var_1549,var_1656,var_1651,var_1135,_loc4_,_loc3_,var_1077,var_363,var_1078);
            _connection.send(_loc1_);
            var_1077 = 0;
            var_363 = 0;
            var_627 = 0;
            var_1078 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_153 = param1;
         var_1310 = int(var_153.getKey("performancetest.interval","60"));
         var_1312 = int(var_153.getKey("performancetest.slowupdatelimit","1000"));
         var_1311 = int(var_153.getKey("performancetest.reportlimit","10"));
         var_2192 = Number(var_153.getKey("performancetest.distribution.deviancelimit.percent","10"));
         var_2191 = Boolean(int(var_153.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
