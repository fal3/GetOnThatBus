//
//  EventViewController.m
//  GetOnThatBus
//
//  Created by alex fallah on 5/27/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

#import "EventViewController.h"


@interface EventViewController ()
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *routeLabel;
@property (weak, nonatomic) IBOutlet UILabel *wardLabel;



@end

@implementation EventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)initWithBusStop:(BusStop *)bus
{
    self.busStop = bus;
    self.addressLabel.text = bus._address;
    self.routeLabel.text = bus.routes;
    self.wardLabel.text = bus.ward;
}

@end
