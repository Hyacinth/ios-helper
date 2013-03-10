//
//  HTTP.h
//  yueyue
//
//  Created by Yu Cong on 12-11-17.
//  Copyright (c) 2012年 Yu Cong. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DOMAIN_URL @"http://pic-news.cloudfoundry.com/resource"

@interface HTTP : NSObject

+(void)sendRequestToPath:(NSString*)url method:(NSString*)method params:(NSDictionary*)params  completionHandler:(void (^)(id)) completionHandler ;


+(void)postJsonToPath:(NSString*)url id:object  completionHandler:(void (^)(id)) completionHandler;

@end
