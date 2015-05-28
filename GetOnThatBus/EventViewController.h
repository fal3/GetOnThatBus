//
//  EventViewController.h
//  GetOnThatBus
//
//  Created by alex fallah on 5/27/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

#import "ViewController.h"
#import "BusStop.h"

@interface EventViewController : ViewController 

@property BusStop* busStop;

-(void)initWithBusStop:(BusStop *)bus;

@end
