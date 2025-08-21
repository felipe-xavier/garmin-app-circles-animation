import Toybox.Lang;
import Toybox.WatchUi;

class CirclesAnimationDelegate extends WatchUi.BehaviorDelegate {

    var _view as CirclesAnimationView;

    function initialize(view as CirclesAnimationView) {
        BehaviorDelegate.initialize();
        _view = view;
    }


    function onTap(clickEvent as WatchUi.ClickEvent) as Boolean {
        var coords = clickEvent.getCoordinates();
        System.println(coords);
        
        // Add a new circle at the tap location
        _view.addCircle(coords[0], coords[1]);
        
        return true;
    }

    function onKeyPressed(keyEvent as KeyEvent) as Boolean {

        if (keyEvent.getKey() == WatchUi.KEY_UP) {
            return openMenu();
        }
        
        if (keyEvent.getKey() == WatchUi.KEY_ENTER) {
            if (_view.isPaused) {
                _view.onResume();
            } else {
                _view.onPause();
            }
            return true;
        }

        return false; // Indicate that the key event was not handled
    }

    function onSwipe(swipeEvent as WatchUi.SwipeEvent) {
        var direction = swipeEvent.getDirection();

        if (direction == WatchUi.SWIPE_LEFT) {
            openMenu();
            return true;
        }
 
        return false;
    }

    function openMenu() as Boolean {
        WatchUi.pushView((new MainMenu()).getView(), new MainMenuViewDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}