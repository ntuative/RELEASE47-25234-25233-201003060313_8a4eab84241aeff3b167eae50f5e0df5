package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_974:SoundChannel = null;
      
      private var var_797:Boolean;
      
      private var var_975:Sound = null;
      
      private var var_687:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_975 = param1;
         var_975.addEventListener(Event.COMPLETE,onComplete);
         var_687 = 1;
         var_797 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_797;
      }
      
      public function stop() : Boolean
      {
         var_974.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_797 = false;
         var_974 = var_975.play(0);
         this.volume = var_687;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_687;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_974.position;
      }
      
      public function get length() : Number
      {
         return var_975.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_687 = param1;
         if(var_974 != null)
         {
            var_974.soundTransform = new SoundTransform(var_687);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_797 = true;
      }
   }
}
