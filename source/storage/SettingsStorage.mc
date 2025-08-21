import Toybox.Application;
import Toybox.Lang;
import Toybox.System;

var isBlackBackgroundColor = "isBlackBackgroundColor";
var isCircleFilled = "isCircleFilled";
var isCirclesAutomaticallyAdded = "isCirclesAutomaticallyAdded";

class SettingsStorage {

    static function getIsBlackBackgroundColor() {
        return Application.Properties.getValue(isBlackBackgroundColor);
    }

    static function setIsBlackBackgroundColor(value) {
        Application.Properties.setValue(isBlackBackgroundColor, value);
    }

    static function getIsCircleFilled() {
        return Application.Properties.getValue(isCircleFilled);
    }

    static function setIsCircleFilled(value) {
        Application.Properties.setValue(isCircleFilled, value);
    }

    static function getIsCirclesAutomaticallyAdded() {
        return Application.Properties.getValue(isCirclesAutomaticallyAdded);
    }
    
    static function setIsCirclesAutomaticallyAdded(value) {
        Application.Properties.setValue(isCirclesAutomaticallyAdded, value);
    }
}
