import Toybox.Lang;
import Toybox.WatchUi;

class CirclesAnimationDelegate extends WatchUi.BehaviorDelegate {

    var _view as CirclesAnimationView;

    function initialize(view as CirclesAnimationView) {
        BehaviorDelegate.initialize();
        _view = view;
    }

    function onMenu() as Boolean {
        return true;
    }

    function onTap(clickEvent as WatchUi.ClickEvent) as Boolean {
        var coords = clickEvent.getCoordinates();
        System.println(coords);
        
        // Add a new circle at the tap location
        _view.addCircle(coords[0], coords[1]);
        
        return true;
    }

    function onKeyPressed(keyEvent as KeyEvent) as Boolean {
        
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

}