//
//  UIHelper.h
//  yueyue
//
//  Created by Yu Cong on 12-11-18.
//  Copyright (c) 2012年 Yu Cong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface UIHelper : NSObject

+ (void)zoomToFitMapAnnotations:(MKMapView *)mapView userLocation: (CLLocationCoordinate2D)userLocation;

+(CGFloat)measureTextHeight:(NSString*)text fontSize:(CGFloat)fontSize constrainedToSize:(CGSize)constrainedToSize;

+(void)alert:(NSString*) msg;

@end
