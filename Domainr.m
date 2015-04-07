//
//  Domainr.m
//  Domainr API Wrapper
//
//  Created with <3 by Connor Montgomery on Aug 08, 2012.
//  Copyright 2012 Connor Montgomery. All rights reserved.
//
//  This wrapper wouldn't be possible without the excellent
//  Dribbble API wrapper that madebyjoshua.com provided:
//  https://github.com/joshuarussell/Objective-Dribbble
//

#import "Domainr.h"
#import "JSON.h"

@implementation Domainr

@synthesize baseURL;

#pragma mark -
#pragma mark Init
- (id) initWithURL:(NSString *)urlPath andOptions:(NSMutableDictionary *)options {
	
	[super init];
	
	// setup the responseData object
	responseData = [[NSMutableData data] retain];
	
	// set up the baseURL object
	baseURL = [[[NSString alloc] initWithString:@"https://api.domainr.com/v1"] stringByAppendingString:urlPath];	
	
	NSLog(@"----------------------------------------------------------------------");
	NSLog(@"Connecting to: %@", baseURL);
	NSLog(@"----------------------------------------------------------------------");
	
	// create a URL connection using our baseURL object
	NSURLRequest		*request		= [NSURLRequest requestWithURL:[NSURL URLWithString:baseURL]];
	NSURLResponse		*response		= [[NSURLResponse alloc] init];  
	NSError				*error			= [[NSError alloc] init];  
	NSData				*data			= [NSURLConnection sendSynchronousRequest:request
                                              returningResponse:&response error:&error];
	
	// set the response data
	[responseData setData:data];
			
	// convert the NSData responseData object to a NSString object
	NSString			*responseString	= [[NSString alloc] initWithData:responseData
                                                       encoding:NSUTF8StringEncoding];
	
	// get the results in JSON format
	NSMutableDictionary *results		= [responseString JSONValue];

	// don't forget to clean up after yourself
	[responseData	release];
	[error			release];
	[responseString release];
	
	// return the results for later use
	return results;
}

- (Domainr *) search:(NSString *)query {
	NSString *searchURL = [[[NSString alloc] initWithString:@"/search?q="] stringByAppendingFormat:@"%@&client_id=ios_wrapper",query];
	results = [[Domainr alloc] initWithURL:searchURL andOptions:nil];
	return results;
}

- (Domainr *) info:(NSString *)query {
    NSString *infoURL = [[[NSString alloc] initWithString:@"/info?q="] stringByAppendingFormat:@"%@&client_id=ios_wrapper", query];
    results = [[Domainr alloc] initWithURL:infoURL andOptions:nil];
    return results;
}

#pragma mark -
#pragma mark Memory Management
- (void) dealloc {
	[baseURL	release];
	[super		dealloc];
}

@end
