import Toybox.System;
import Toybox.WatchUi;

class MainMenu {
    private static var _menu;

    function initialize() {
        if(_menu == null) {
            _menu = new WatchUi.Menu2(null);
            setMenu();
        }
    }

    function getView() {
        return _menu;
    }

    private function setMenu() {
        var isTouchScreenAvailable = isTouchScreenAvailable();
        var isDcFillAvailable = SettingsStorage.getIsDcFillAvailable();

        _menu.addItem(new WatchUi.ToggleMenuItem(
            "Background Color",
            {:enabled=>"black", :disabled=>"white"},
            SettingsStorage.isBlackBackgroundColorKey,
            SettingsStorage.getIsBlackBackgroundColor(),
            null
        ));

        if(isDcFillAvailable) {
            _menu.addItem(new WatchUi.ToggleMenuItem(
                "Circles",
                {:enabled=>"filled", :disabled=>"outline"},
                SettingsStorage.isCircleFilledKey,
                SettingsStorage.getIsCircleFilled(),
                null
            ));
        }
        
        if(isTouchScreenAvailable) {
            _menu.addItem(new WatchUi.ToggleMenuItem(
                "Circles Added",
                {:enabled=>"automatically", :disabled=>"manually"},
                SettingsStorage.isCirclesAutomaticallyAddedKey,
                SettingsStorage.getIsCirclesAutomaticallyAdded(),
                null
            ));
        }
    }
}
