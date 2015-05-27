//
//  BusStop.h
//  GetOnThatBus
//
//  Created by alex fallah on 5/27/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface BusStop : NSObject

@property NSString *_id;
@property NSString *_uuid;
@property NSString *_position;
@property NSString *_address;
@property NSString *stop_id;
@property NSString *cta_stop_name;
@property NSString *direction;
@property NSString *routes;
@property NSString *ward;
@property CLLocationDegrees longitude;
@property CLLocationDegrees latitude;

- (id) initWithJSONDictionary:(NSDictionary *)dic;
- (void) parseJSONDictionary:(NSDictionary *)dic;



@end


