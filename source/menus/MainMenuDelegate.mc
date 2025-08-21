import Toybox.Lang;
import Toybox.WatchUi;

class MainMenuViewDelegate extends WatchUi.Menu2InputDelegate {


    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as MenuItem) as Void {
        var id = item.getId().toString();

        if (id.equals(SettingsStorage.isBlackBackgroundColorKey)) {
            var toggleItem = item as WatchUi.ToggleMenuItem;
            SettingsStorage.setIsBlackBackgroundColor(toggleItem.isEnabled());
            return;
        }

        if (id.equals(SettingsStorage.isCircleFilledKey)) {
            var toggleItem = item as WatchUi.ToggleMenuItem;
            SettingsStorage.setIsCircleFilled(toggleItem.isEnabled());
            return;
        }

        if (id.equals(SettingsStorage.isCirclesAutomaticallyAddedKey)) {
            var toggleItem = item as WatchUi.ToggleMenuItem;
            SettingsStorage.setIsCirclesAutomaticallyAdded(toggleItem.isEnabled());
            return;
        }
    }
}
