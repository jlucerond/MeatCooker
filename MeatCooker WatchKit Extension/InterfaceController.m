//
//  InterfaceController.m
//  MeatCooker WatchKit Extension
//
//  Created by Joe Lucero on 8/31/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceTimer *timer;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *weightLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *cookLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceButton *timerButton;

@property (nonatomic) int ounces;
@property (nonatomic) int meatTemperature;
@property (nonatomic) BOOL timerRunning;
@property (nonatomic) BOOL metricIsTurnedOn;

@property (strong, nonatomic) NSArray *meatTemperatureStrings;
@property (strong, nonatomic) NSArray *timeModifiers;


@end


@implementation InterfaceController

//life cycle functions
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    self.ounces = 16;
    self.meatTemperature = Medium;
    self.meatTemperatureStrings = @[@"Rare", @"Medium Rare", @"Medium", @"Well Done"];
    self.timeModifiers = @[@0.5, @0.75, @1.0, @1.5];
    [self updateConfiguration];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

//ibactions
- (IBAction)onTimerButton {
    if (self.timerRunning){
        [self.timer stop];
        [self.timerButton setTitle:@"Start Timer"];
    }
    
    else {
        NSDate *countdown = [NSDate dateWithTimeIntervalSinceNow:[self cookTimeForOunces:self.ounces withTemperature:self.meatTemperature]];
        [self.timer setDate:countdown];
        [self.timer start];
        [self.timerButton setTitle:@"Stop Timer"];
    }
    
    self.timerRunning = !self.timerRunning;
}

- (IBAction)onPlusButton {
    self.ounces++;
    [self updateConfiguration];
}

- (IBAction)onMinusButton {
    if (self.ounces != 0){
        self.ounces--;
        [self updateConfiguration];
    }
}

- (IBAction)onTempChange:(float)value {
    self.meatTemperature = (int)value;
    [self updateConfiguration];
}

- (IBAction)onMetricChanged:(BOOL)value {
    self.metricIsTurnedOn = !self.metricIsTurnedOn;
    [self updateConfiguration];
}

//helper methods
- (void) updateConfiguration {
    [self weightLabelText];
    [self.cookLabel setText:self.meatTemperatureStrings[self.meatTemperature]];
}

- (NSTimeInterval) cookTimeForOunces:(int) ounces
           withTemperature:(MeatTemperature) cookTemp {
    
    NSTimeInterval baseTime = 47.0 * 60.0;
    int baseWeight = 16;
    float weightModifer = (float)self.ounces / baseWeight;
    float tempModifier = [self.timeModifiers[cookTemp] floatValue];
    
    return baseTime * weightModifer *tempModifier;
}

- (void) weightLabelText {
    if (self.metricIsTurnedOn){
        //switch to metric
        float grams = (float)self.ounces * 28.3495;
        [self.weightLabel setText:[NSString stringWithFormat: @"Weight: %.1f g", grams]];
    }
    
    else {
        [self.weightLabel setText:[NSString stringWithFormat: @"Weight: %i oz", self.ounces]];
    }
}


@end



