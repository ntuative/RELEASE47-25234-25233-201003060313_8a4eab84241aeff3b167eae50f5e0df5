package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_605:String;
      
      private var var_1294:String;
      
      private var var_1295:String;
      
      private var var_1208:int;
      
      private var var_1015:int;
      
      private var var_1296:String;
      
      private var _name:String;
      
      private var var_1228:Boolean;
      
      private var var_694:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_1015 = param1.readInteger();
         this.var_694 = param1.readBoolean();
         this.var_1228 = param1.readBoolean();
         this.var_605 = param1.readString();
         this.var_1208 = param1.readInteger();
         this.var_1295 = param1.readString();
         this.var_1294 = param1.readString();
         this.var_1296 = param1.readString();
      }
      
      public function get gender() : int
      {
         return var_1015;
      }
      
      public function get realName() : String
      {
         return var_1296;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_1295;
      }
      
      public function get categoryId() : int
      {
         return var_1208;
      }
      
      public function get online() : Boolean
      {
         return var_694;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1228;
      }
      
      public function get lastAccess() : String
      {
         return var_1294;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_605;
      }
   }
}
