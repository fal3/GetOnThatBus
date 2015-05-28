//
//  BusStop.m
//  GetOnThatBus
//
//  Created by alex fallah on 5/27/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

#import "BusStop.h"

@implementation BusStop

- (id) initWithJSONDictionary:(NSDictionary *)dic
{
    if(self = [super init])
    {
        [self parseJSONDictionary:dic];
    }
    return self;
}

- (void) parseJSONDictionary:(NSDictionary *)dic
{
    // PARSER
    id _id_ = [dic objectForKey:@"_id"];
    if([_id_ isKindOfClass:[NSString class]])
    {
        self._id = _id_;
    }

    id _uuid_ = [dic objectForKey:@"_uuid"];
    if([_uuid_ isKindOfClass:[NSString class]])
    {
        self._uuid = _uuid_;
    }

    id _position_ = [dic objectForKey:@"_position"];
    if([_position_ isKindOfClass:[NSString class]])
    {
        self._position = _position_;
    }

    id _address_ = [dic objectForKey:@"_address"];
    if([_address_ isKindOfClass:[NSString class]])
    {
        self._address = _address_;
    }

    id stop_id_ = [dic objectForKey:@"stop_id"];
    if([stop_id_ isKindOfClass:[NSString class]])
    {
        self.stop_id = stop_id_;
    }

    id cta_stop_name_ = [dic objectForKey:@"cta_stop_name"];
    if([cta_stop_name_ isKindOfClass:[NSString class]])
    {
        self.cta_stop_name = cta_stop_name_;
    }

    id direction_ = [dic objectForKey:@"direction"];
    if([direction_ isKindOfClass:[NSString class]])
    {
        self.direction = direction_;
    }

    id routes_ = [dic objectForKey:@"routes"];
    if([routes_ isKindOfClass:[NSString class]])
    {
        self.routes = routes_;
    }

    id ward_ = [dic objectForKey:@"ward"];
    if([ward_ isKindOfClass:[NSString class]])
    {
        self.ward = ward_;
    }

    id longitude_ = [dic objectForKey:@"longitude"];
    if([longitude_ isKindOfClass:[NSString class]])
    {
        self.longitude = [longitude_ doubleValue];
    }

    id latitude_ = [dic objectForKey:@"latitude"];
    if([latitude_ isKindOfClass:[NSString class]])
    {
        self.latitude = [latitude_ doubleValue];
    }
    
    
    
}


@end
