package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2290:Boolean;
      
      private var var_2289:int;
      
      private var var_2288:Boolean;
      
      private var var_1505:String;
      
      private var var_1296:String;
      
      private var var_1689:int;
      
      private var var_1992:String;
      
      private var var_2287:String;
      
      private var var_1993:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1689 = param1.readInteger();
         this.var_1505 = param1.readString();
         this.var_1992 = param1.readString();
         this.var_2290 = param1.readBoolean();
         this.var_2288 = param1.readBoolean();
         param1.readString();
         this.var_2289 = param1.readInteger();
         this.var_1993 = param1.readString();
         this.var_2287 = param1.readString();
         this.var_1296 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1296;
      }
      
      public function get avatarName() : String
      {
         return this.var_1505;
      }
      
      public function get avatarId() : int
      {
         return this.var_1689;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2290;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2287;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_1993;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2288;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_1992;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2289;
      }
   }
}
