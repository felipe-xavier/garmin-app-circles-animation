import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Lang;
import Toybox.Timer;

// Define colors with their RGB components for alpha blending
var COLORS = [
    Graphics.COLOR_RED,
    Graphics.COLOR_BLUE,
    Graphics.COLOR_GREEN, 
    Graphics.COLOR_YELLOW,
    Graphics.COLOR_PURPLE,
    Graphics.COLOR_ORANGE,
    Graphics.COLOR_DK_RED,
    Graphics.COLOR_PINK,
    Graphics.COLOR_DK_GREEN,
    Graphics.COLOR_DK_BLUE,
    Graphics.COLOR_WHITE,
    Graphics.COLOR_LT_GRAY,
    Graphics.COLOR_DK_GRAY,
    Graphics.COLOR_BLACK,
] as Array<Number>;

// Helper function to get RGB components from a color
function getColorComponents(color as Number) as Array<Number> {
    switch(color) {
        case Graphics.COLOR_RED:
            return [255, 0, 0];
        case Graphics.COLOR_BLUE:
            return [0, 0, 255];
        case Graphics.COLOR_GREEN:
            return [0, 255, 0];
        case Graphics.COLOR_YELLOW:
            return [255, 255, 0];
        case Graphics.COLOR_PURPLE:
            return [128, 0, 128];
        case Graphics.COLOR_ORANGE:
            return [255, 165, 0];
        case Graphics.COLOR_DK_RED:
            return [139, 0, 0];
        case Graphics.COLOR_PINK:
            return [255, 192, 203];
        case Graphics.COLOR_DK_GREEN:
            return [0, 100, 0];
        case Graphics.COLOR_DK_BLUE:
            return [0, 0, 139];
        case Graphics.COLOR_WHITE:
            return [255, 255, 255];
        case Graphics.COLOR_LT_GRAY:
            return [211, 211, 211];
        case Graphics.COLOR_DK_GRAY:
            return [64, 64, 64];
        case Graphics.COLOR_BLACK:
            return [0, 0, 0];
        default:
            return [255, 255, 255]; // White as fallback
    }
}

class Circle {
    var x as Number;
    var y as Number;
    var radius as Number;
    var color as Number;
    var alpha as Float;
    var startTime as Number;
    var maxRadius as Number;
    var duration as Number;
    
    function initialize(x as Number, y as Number, color as Number) {
        self.x = x;
        self.y = y;
        self.radius = 5; // Starting radius
        self.color = color;
        self.alpha = 1.0; // Full opacity
        self.startTime = System.getTimer();
        self.maxRadius = 200; // Maximum radius
        self.duration = 10000; // 10 seconds duration
    }
    
    function update(currentTime as Number) as Boolean {
        var elapsed = currentTime - startTime;
        var progress = elapsed.toFloat() / duration.toFloat();
        
        if (progress >= 1.0) {
            return false; // Remove this circle
        }
        
        // Update radius (grow over time)
        radius = (5 + (maxRadius - 5) * progress).toNumber();
        
        // Update alpha (fade out over time)
        alpha = 1.0 - progress;
        System.println("Progress: " + progress + " Alpha: " + alpha);
        
        return true; // Keep this circle
    }
    
    function draw(dc as Dc) as Void {
        // Convert alpha from 0-1 range to 0-255 range
        var alphaValue = (alpha * 255).toNumber();
        
        // Get RGB components using our helper function
        var rgb = getColorComponents(color);
        
        // Create color with alpha using the same format as 0x40FFFFFF
        // Format: 0xAARRGGBB where AA=alpha, RR=red, GG=green, BB=blue
        var colorWithAlpha = (alphaValue << 24) | (rgb[0] << 16) | (rgb[1] << 8) | rgb[2];

        var isCircleFilled = SettingsStorage.getIsCircleFilled();
        
        if (dc has :setFill && isCircleFilled) {
            dc.setFill(colorWithAlpha);
            dc.fillCircle(x, y, radius);
        } else {
            dc.setColor(colorWithAlpha, Graphics.COLOR_TRANSPARENT);
            dc.drawCircle(x, y, radius);
        }
    }
}

class CirclesAnimationView extends WatchUi.View {
    var circles as Array<Circle> = [];
    var colorIndex as Number = 0;
    var animationTimer as Timer.Timer?;
    var isPaused as Boolean = false;

    function initialize() {
        View.initialize();
        circles = [];
        colorIndex = Math.rand() % COLORS.size();;
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        // Don't set a layout as we're doing custom drawing
        // setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
        System.println("onShow called - starting timer");

    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Clear the screen with white background for better visibility
        var isBlackBackgroundColor = SettingsStorage.getIsBlackBackgroundColor();
        if (isBlackBackgroundColor) {
            dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        } else {
            dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
        }
        dc.clear();

        if (!isPaused) {
            updateCircles();
        }
        
        // Draw all circles
        for (var i = 0; i < circles.size(); i++) {
            circles[i].draw(dc);
        }
        
        // Don't call View.onUpdate as it might override our custom drawing
        // View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
        // Stop animation timer
        if (animationTimer != null) {
            animationTimer.stop();
        }
    }
    function onPause() as Void {
        isPaused = true;
        WatchUi.requestUpdate();
    }
    function onResume() as Void {
        isPaused = false;
        WatchUi.requestUpdate();
    }
    
    function addCircle(x as Number, y as Number) as Void {
        var color = COLORS[colorIndex];
        circles.add(new Circle(x, y, color));
        
        // Cycle to next color
        colorIndex = (colorIndex + 1) % COLORS.size();
    }
    
    function updateCircles() as Void {
        var currentTime = System.getTimer();
        var i = 0;
        
        // Update all circles and remove expired ones
        while (i < circles.size()) {
            if (!circles[i].update(currentTime)) {
                circles.remove(circles[i]);
            } else {
                i++;
            }
        }
        
        // Request a screen update
        WatchUi.requestUpdate();
    }
}
