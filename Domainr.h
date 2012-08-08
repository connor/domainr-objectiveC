//
//  Domainr.h
//  Domainr API Wrapper
//
//  Created with <3 by Connor Montgomery on Aug 08, 2012.
//  Copyright 2012 Connor Montgomery. All rights reserved.
//
//  This wrapper wouldn't be possible without the excellent
//  Dribbble API wrapper that madebyjoshua.com provided:
//  https://github.com/joshuarussell/Objective-Dribbble
//

#import <Foundation/Foundation.h>

@interface Domainr : NSObject  {
	NSString		*baseURL;
	NSMutableData	*responseData;
    NSString        *q;
    id              results;
}

#pragma mark -
#pragma mark Properties
@property (nonatomic, retain) NSString *baseURL;

#pragma mark -
#pragma mark Domainr Method Declarations
- (id) initWithURL:(NSString *)urlPath andOptions:(NSMutableDictionary *)options;
- (Domainr *) search:(NSString *)query;
- (Domainr *) info:(NSString *)query;

@end
