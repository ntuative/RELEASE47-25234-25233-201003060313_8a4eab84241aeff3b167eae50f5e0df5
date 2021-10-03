package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var var_910:LegacyWallGeometry = null;
      
      private var var_608:SelectedRoomObjectData = null;
      
      private var _roomCategory:int = 0;
      
      private var var_610:TileHeightMap = null;
      
      private var var_2222:String = null;
      
      private var _roomId:int = 0;
      
      private var var_609:SelectedRoomObjectData = null;
      
      private var var_909:RoomCamera = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         var_910 = new LegacyWallGeometry();
         var_909 = new RoomCamera();
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_608 != null)
         {
            var_608.dispose();
         }
         var_608 = param1;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(var_610 != null)
         {
            var_610.dispose();
         }
         var_610 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function set worldType(param1:String) : void
      {
         var_2222 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return var_910;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return var_609;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return var_909;
      }
      
      public function dispose() : void
      {
         if(var_610 != null)
         {
            var_610.dispose();
            var_610 = null;
         }
         if(var_910 != null)
         {
            var_910.dispose();
            var_910 = null;
         }
         if(var_909 != null)
         {
            var_909.dispose();
            var_909 = null;
         }
         if(var_608 != null)
         {
            var_608.dispose();
            var_608 = null;
         }
         if(var_609 != null)
         {
            var_609.dispose();
            var_609 = null;
         }
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return var_610;
      }
      
      public function get worldType() : String
      {
         return var_2222;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_609 != null)
         {
            var_609.dispose();
         }
         var_609 = param1;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return var_608;
      }
   }
}
