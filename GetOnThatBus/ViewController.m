//
//  ViewController.m
//  GetOnThatBus
//
//  Created by alex fallah on 5/27/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "BusStop.h"

@interface ViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property MKPointAnnotation *annotation;
@property NSDictionary *json;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.annotation = [MKPointAnnotation new];
    self.json = [NSDictionary new];
    [self loadJson];
}


-(void)loadJson
{
    NSURL *url = [NSURL URLWithString:@"https://s3.amazonaws.com/mobile-makers-lib/bus.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        self.json = [[NSJSONSerialization JSONObjectWithData:data options:0 error:nil]objectForKey:@"row"];
        for (NSDictionary *busStop in self.json)
        {
            BusStop *bus = [[BusStop alloc] initWithJSONDictionary:busStop];
            NSLog(@"hello");
            [self addPoint:bus];
        }
    }];
}


-(void)addPoint:(BusStop *)bus
{
    MKPointAnnotation *point = [MKPointAnnotation new];
    point.coordinate = CLLocationCoordinate2DMake(bus.latitude, bus.longitude);
    [self.mapView addAnnotation:point];
}


#pragma mark - MapViewDelegate methods
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKPinAnnotationView *pin =[[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"pin"];
    pin.canShowCallout = YES;
    pin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    return pin;
}

@end
