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

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}
- (IBAction)onTimerButton {
    NSTimeInterval *myTimeInterval = NSTimeInterval NSTimeIntervalSince1970;
    NSDate *myDate = [[NSDate alloc] initWithTimeIntervalSinceNow:<#(NSTimeInterval)#>]
    NSTimer *myTimer = [[NSTimer alloc] initWithFireDate:<#(NSDate *)#> interval:<#(NSTimeInterval)#> target:nil selector:nil userInfo:nil repeats:false];
}

@end



