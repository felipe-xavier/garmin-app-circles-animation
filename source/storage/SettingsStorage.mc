import Toybox.Application;
import Toybox.Lang;
import Toybox.System;

class SettingsStorage {

    static var isBlackBackgroundColorKey = "isBlackBackgroundColor";
    static var isCircleFilledKey = "isCircleFilled";
    static var isCirclesAutomaticallyAddedKey = "isCirclesAutomaticallyAdded";
    static var isDcFillAvailableKey = "isDcFillAvailable";
    static var isDcFillAvailable = false;

    static function getIsBlackBackgroundColor() {
        return Application.Properties.getValue(isBlackBackgroundColorKey);
    }

    static function setIsBlackBackgroundColor(value) {
        Application.Properties.setValue(isBlackBackgroundColorKey, value);
    }

    static function getIsCircleFilled() {
        return Application.Properties.getValue(isCircleFilledKey);
    }

    static function setIsCircleFilled(value) {
        Application.Properties.setValue(isCircleFilledKey, value);
    }

    static function getIsCirclesAutomaticallyAdded() {
        return Application.Properties.getValue(isCirclesAutomaticallyAddedKey);
    }
    
    static function setIsCirclesAutomaticallyAdded(value) {
        Application.Properties.setValue(isCirclesAutomaticallyAddedKey, value);
    }

    static function getIsDcFillAvailable() {
        return isDcFillAvailable;
    }
    
    static function setIsDcFillAvailable(value) {
        isDcFillAvailable = value;
    }
}
