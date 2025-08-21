import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Math;

function isTouchScreenAvailable() as Boolean {
    var deviceSettings = GlobalVariables.deviceSettings;
    return deviceSettings has :isTouchScreen && deviceSettings.isTouchScreen;
}
