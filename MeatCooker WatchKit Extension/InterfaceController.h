//
//  InterfaceController.h
//  MeatCooker WatchKit Extension
//
//  Created by Joe Lucero on 8/31/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MeatTemperature) {
    Rare = 0,
    MediumRare = 1,
    Medium = 2,
    WellDone = 3
};

@interface InterfaceController : WKInterfaceController


@end
