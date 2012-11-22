//
//  UIHelper.m
//  yueyue
//
//  Created by Yu Cong on 12-11-18.
//  Copyright (c) 2012年 Yu Cong. All rights reserved.
//

#import "UIHelper.h"

@implementation UIHelper

+(void)alert:(NSString*) msg
{
    UIAlertView* alert =[[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil];
    [alert show];
}

+(CGFloat)measureTextHeight:(NSString*)text fontSize:(CGFloat)fontSize constrainedToSize:(CGSize)constrainedToSize
{
    CGSize mTempSize = [text sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:constrainedToSize lineBreakMode:UILineBreakModeCharacterWrap];
    return mTempSize.height;
}

+ (void)zoomToFitMapAnnotations:(MKMapView *)mapView userLocation: (CLLocationCoordinate2D)userLocation
{
    if ([mapView.annotations count] == 0) return;
    
    CLLocationCoordinate2D topLeftCoord;
    topLeftCoord.latitude = -90;
    topLeftCoord.longitude = 180;

    CLLocationCoordinate2D bottomRightCoord;
    bottomRightCoord.latitude = 90;
    bottomRightCoord.longitude = -180;
    
    for(id<MKAnnotation> annotation in mapView.annotations) {
        topLeftCoord.longitude = fmin(topLeftCoord.longitude, annotation.coordinate.longitude);
        topLeftCoord.latitude = fmax(topLeftCoord.latitude, annotation.coordinate.latitude);
        bottomRightCoord.longitude = fmax(bottomRightCoord.longitude, annotation.coordinate.longitude);
        bottomRightCoord.latitude = fmin(bottomRightCoord.latitude, annotation.coordinate.latitude);
    }
    
    if(userLocation.latitude!=0){
        topLeftCoord.longitude = fmin(topLeftCoord.longitude, userLocation.longitude);
        topLeftCoord.latitude = fmax(topLeftCoord.latitude, userLocation.latitude);
        bottomRightCoord.longitude = fmax(bottomRightCoord.longitude, userLocation.longitude);
        bottomRightCoord.latitude = fmin(bottomRightCoord.latitude, userLocation.latitude);
    }
    
    MKCoordinateRegion region;
    region.center.latitude = topLeftCoord.latitude - (topLeftCoord.latitude - bottomRightCoord.latitude) * 0.5;
    region.center.longitude = topLeftCoord.longitude + (bottomRightCoord.longitude - topLeftCoord.longitude) * 0.5;
    region.span.latitudeDelta = fabs(topLeftCoord.latitude - bottomRightCoord.latitude) * 1.2;
    
    // Add a little extra space on the sides
    region.span.longitudeDelta = fabs(bottomRightCoord.longitude - topLeftCoord.longitude) * 1.2;
    
    // Add a little extra space on the sides
    region = [mapView regionThatFits:region];
    [mapView setRegion:region animated:YES];
}

@end
