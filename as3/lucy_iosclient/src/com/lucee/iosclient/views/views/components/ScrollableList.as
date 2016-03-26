package com.lucee.iosclient.views.views.components {
	import com.greensock.TweenLite;
	import com.greensock.easing.Strong;
	import com.greensock.plugins.ThrowPropsPlugin;

	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	import flash.utils.getTimer;

	/**
	 * @author marvin
	 */
	public class ScrollableList extends Sprite {
		public var isMoving : Boolean = false;
		// used to determine finger move in pixels
		public var mouseDownY : Number;
		public var mouseUpY : Number;
		public var tolerance : int = 20;
		private var bounds : Rectangle;
		private var bg : Sprite;
		private var scrollList : Sprite;
		private var t1 : uint, t2 : uint, y1 : Number, y2 : Number, yOverlap : Number, yOffset : Number, _w : int, _h : int, _itemh : int, _defaultcol : int, _hicol : int;
		private var scrollMask : Shape;
		private var scrollBar : MovieClip;
		private var scrollBarHeight : Number;
		private var barMaxDistance : Number;
		private var listEndY : Number;
		private var touchTimer : Timer;
		private var bgSpr : Sprite;

		public function ScrollableList(s : Sprite, offset:int) {
			scrollList = s;
			
			bounds = new Rectangle(0, 0, 750, 1334-offset);
			bgSpr = new Sprite();
			bgSpr.graphics.beginFill(0xFF0000);
			bgSpr.graphics.drawRect(0, 0, 750, 1334);

//			scrollList.addChildAt(bgSpr,0);
			addChild(scrollList);

			scrollMask = new Shape();
			scrollMask.graphics.beginFill(0xFF0033, 1);
			scrollMask.graphics.drawRect(bounds.x, bounds.y, bounds.width, bounds.height);
			scrollMask.graphics.endFill();
			scrollList.parent.addChild(scrollMask);
			scrollList.mask = scrollMask;

			this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
		}

		function mouseDownHandler(e : MouseEvent) : void {
			isMoving = false;
			TweenLite.killTweensOf(scrollList);
			y1 = y2 = scrollList.y;
			yOffset = this.mouseY - scrollList.y;
			yOverlap = Math.max(0, scrollList.height - bounds.height);
			t1 = t2 = getTimer();
			scrollList.stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			scrollList.stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
		}

		function mouseMoveHandler(event : MouseEvent) : void {
			isMoving = true;

			// if (scrollBar.alpha < 1) {
			// TweenMax.killTweensOf(scrollBar);
			// if (scrollList.height > scrollMask.height) {
			// TweenMax.to(scrollBar, .5, {alpha:1});
			// } else {
			// scrollBar.alpha = 0;
			// }
			// }

			var newY : Number = this.mouseY - yOffset;
			// if scrollList's position exceeds the bounds, make it drag only half as far with each mouse movement (like iPhone/iPad behavior)
			if (newY > bounds.top) {
				scrollList.y = (newY + bounds.top) * 0.5;
			} else if (newY < bounds.top - yOverlap) {
				scrollList.y = (newY + bounds.top - yOverlap) * 0.5;
			} else {
				scrollList.y = newY;
			}

			var t : uint = getTimer();
			// if the frame rate is too high, we won't be able to track the velocity as well, so only update the values 20 times per second
			if (t - t2 > 50) {
				y2 = y1;
				t2 = t1;
				y1 = scrollList.y;
				t1 = t;
			}

			// test for finger location. If we drag outside the bounds, dispatch a mouse up event.
			if (this.mouseY < scrollMask.y || this.mouseY > bounds.height + scrollMask.y || this.mouseX < scrollMask.x || this.mouseX > bounds.width + scrollMask.x) {
			scrollList.stage.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_UP));
			}

			// we need to update the scrollbar when dragging
			// updateBar();
		}

		public function startTouchTimer(e : MouseEvent) : void {
			mouseDownY = stage.mouseY;
			// selectedButton = ScrollListItem(e.target);
			// trace(e.target.name);
			touchTimer.addEventListener(TimerEvent.TIMER, onListTimer, false, 0, true);
			touchTimer.start();
		}

		public function stopTouchTimer() : void {
			touchTimer.removeEventListener(TimerEvent.TIMER, onListTimer);
			touchTimer.stop();
		}

		function onListTimer(e : Event) : void {
			touchTimer.removeEventListener(TimerEvent.TIMER, onListTimer);
			touchTimer.stop();
			mouseUpY = stage.mouseY;

			// drag down
			if (mouseDownY < mouseUpY) {
				if ((mouseUpY - mouseDownY) < tolerance) {
					// selectedButton.selectItem();
				}
			} else { // drag up
				if ((mouseDownY - mouseUpY) < tolerance) {
					// selectedButton.selectItem();
				}
			}
		}

		function mouseUpHandler(event : MouseEvent) : void {
			scrollList.stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			scrollList.stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);

			var time : Number = (getTimer() - t2) / 1000;
			var yVelocity : Number = (scrollList.y - y2) / time;
			ThrowPropsPlugin.to(scrollList, {throwProps:{y:{velocity:yVelocity, max:bounds.top, min:bounds.top - yOverlap, resistance:300}}, ease:Strong.easeOut, onUpdate:updateBar, onComplete:stoppedMoving}, 1, 0.3, 1);
		}

		function refreshScrollBar(newHeight : Number) : void {
			// set to a minimum value of 4 to match iOS
			if (newHeight > 4) {
				scrollBar.graphics.clear();
				scrollBar.graphics.beginFill(0x505050, .8);
				scrollBar.graphics.drawRoundRect(0, 0, 4, (newHeight), 6, 6);
				scrollBar.graphics.endFill();
			}
		}

		function updateBar() : void {
//			scrollBar.y = (scrollList.y / listEndY) * barMaxDistance;
//
//			if (scrollBar.y > barMaxDistance) {
//				refreshScrollBar(scrollBarHeight - ((scrollBar.y + scrollBarHeight) - scrollMask.height));
//			}
//
//			// pulling down
//			if (scrollBar.y < 1) {
//				scrollBar.y = 0;
//				refreshScrollBar(scrollBarHeight - (scrollList.y / 2));
//			}
		}

		function stoppedMoving() : void {
//			TweenMax.killTweensOf(scrollBar);
//			TweenMax.to(scrollBar, .5, {alpha:0});
			isMoving = false;
		}
	}
}
