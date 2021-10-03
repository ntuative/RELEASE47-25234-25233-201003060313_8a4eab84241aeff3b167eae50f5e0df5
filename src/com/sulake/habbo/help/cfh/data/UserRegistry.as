package com.sulake.habbo.help.cfh.data
{
   import com.sulake.core.utils.Map;
   
   public class UserRegistry
   {
      
      private static const const_1093:int = 80;
       
      
      private var var_483:Map;
      
      private var var_676:String = "";
      
      private var var_1235:Array;
      
      public function UserRegistry()
      {
         var_483 = new Map();
         var_1235 = new Array();
         super();
      }
      
      private function addRoomNameForMissing() : void
      {
         var _loc1_:* = null;
         while(false)
         {
            _loc1_ = var_483.getValue(var_1235.shift());
            if(_loc1_ != null)
            {
               _loc1_.roomName = var_676;
            }
         }
      }
      
      public function registerUser(param1:int, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:* = null;
         if(var_483.getValue(param1) != null)
         {
            var_483.remove(param1);
         }
         if(param3)
         {
            _loc4_ = new UserRegistryItem(param1,param2,var_676);
         }
         else
         {
            _loc4_ = new UserRegistryItem(param1,param2);
         }
         if(param3 && var_676 == "")
         {
            var_1235.push(param1);
         }
         var_483.add(param1,_loc4_);
         purgeUserIndex();
      }
      
      public function getRegistry() : Map
      {
         return var_483;
      }
      
      public function unregisterRoom() : void
      {
         var_676 = "";
      }
      
      private function purgeUserIndex() : void
      {
         var _loc1_:int = 0;
         while(var_483.length > const_1093)
         {
            _loc1_ = var_483.getKey(0);
            var_483.remove(_loc1_);
         }
      }
      
      public function registerRoom(param1:String) : void
      {
         var_676 = param1;
         if(var_676 != "")
         {
            addRoomNameForMissing();
         }
      }
   }
}
