package com.sulake.habbo.avatar.cache
{
   import com.sulake.core.utils.Map;
   import flash.utils.getTimer;
   
   public class AvatarImageActionCache
   {
       
      
      private var var_2177:int;
      
      private var var_125:Map;
      
      public function AvatarImageActionCache()
      {
         super();
         var_125 = new Map();
         setLastAccessTime();
      }
      
      public function setLastAccessTime() : void
      {
         var_2177 = getTimer();
      }
      
      private function debugInfo(param1:String) : void
      {
      }
      
      public function getLastAccessTime() : int
      {
         return var_2177;
      }
      
      public function getDirectionCache(param1:int) : AvatarImageDirectionCache
      {
         var _loc2_:String = param1.toString();
         return var_125.getValue(_loc2_) as AvatarImageDirectionCache;
      }
      
      public function updateDirectionCache(param1:int, param2:AvatarImageDirectionCache) : void
      {
         var _loc3_:String = param1.toString();
         var_125.add(_loc3_,param2);
      }
      
      public function dispose() : void
      {
         debugInfo("[dispose]");
         if(var_125 == null)
         {
            return;
         }
         var_125.dispose();
      }
   }
}
