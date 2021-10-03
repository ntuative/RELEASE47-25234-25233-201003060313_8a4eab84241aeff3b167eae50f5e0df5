package com.sulake.habbo.room.utils
{
   import com.sulake.habbo.room.ISelectedRoomObjectData;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class SelectedRoomObjectData implements ISelectedRoomObjectData
   {
       
      
      private var var_73:Vector3d = null;
      
      private var _id:int = 0;
      
      private var var_223:Vector3d = null;
      
      private var var_1828:int = 0;
      
      private var var_1876:String = null;
      
      private var _category:int = 0;
      
      private var var_1875:String = "";
      
      public function SelectedRoomObjectData(param1:int, param2:int, param3:String, param4:IVector3d, param5:IVector3d, param6:int = 0, param7:String = null)
      {
         super();
         _id = param1;
         _category = param2;
         var_1875 = param3;
         var_73 = new Vector3d();
         var_73.assign(param4);
         var_223 = new Vector3d();
         var_223.assign(param5);
         var_1828 = param6;
         var_1876 = param7;
      }
      
      public function get loc() : Vector3d
      {
         return var_73;
      }
      
      public function get typeId() : int
      {
         return var_1828;
      }
      
      public function get dir() : Vector3d
      {
         return var_223;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get instanceData() : String
      {
         return var_1876;
      }
      
      public function get operation() : String
      {
         return var_1875;
      }
      
      public function dispose() : void
      {
         var_73 = null;
         var_223 = null;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
