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
#import "EventViewController.h"

@interface ViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property NSDictionary *json;

@property NSMutableArray *busses;

@property MKCoordinateRegion region; //where the map will start

@property EventViewController *evc;

@end

@implementation ViewController


-(void)viewWillAppear:(BOOL)animated
{
    self.json = [NSDictionary new];
    self.evc = [EventViewController new];
    self.busses = [NSMutableArray new];
    [super viewWillAppear:animated];
    self.region = MKCoordinateRegionMake( (CLLocationCoordinate2DMake(41.876438, -87.631905) ),MKCoordinateSpanMake(.20, .20));
    self.mapView.delegate = self;
    [self.mapView setRegion:self.region];
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
            [self addPoint:bus];
            [self.busses addObject:bus];
        }
    }];
}


-(void)addPoint:(BusStop *)bus
{
    MKPointAnnotation *point = [MKPointAnnotation new];
    point.coordinate = CLLocationCoordinate2DMake(bus.latitude, bus.longitude);
    point.title = [NSString stringWithFormat:@"Stop Number: %@",bus._id];
    [self.mapView addAnnotation:point];


//    [self.evc initWithBusStop:bus];
}


#pragma mark - MapViewDelegate methods
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKPinAnnotationView *pin =[[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"pin"];
    pin.canShowCallout = YES;
    pin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    return pin;
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
//    MKCoordinateRegion region = MKCoordinateRegionMake(view.annotation.coordinate, MKCoordinateSpanMake(0.01, 0.01));
//    [self.mapView setRegion:region animated:YES];
    [self performSegueWithIdentifier:@"bus" sender:view];

}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(MKAnnotationView *)sender
{
    self.evc = segue.destinationViewController;
}


@end
