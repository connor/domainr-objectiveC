//
//  main.m
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
#import "Domainr.h"

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // simply create a new instance of the Domainr class
    Domainr *d = [[Domainr alloc] init];
   
    // the instantiated objects have access to 2 methods:
    //      1. search   (<NSString> query)
    //      2. info     (<NSString> query)
   
    // le search method
    id searchResult = [d search:@"connor"];
    NSLog(@"%@", searchResult);
    

    // accessing a value at a specific key of the search method's response
    NSString *domain = [searchResult objectForKey:@"query"];
    NSLog(@"%@", domain);
    
    
    // le info method
    id infoResult   = [d info:@"cnnr.me"];
    NSLog(@"%@", infoResult);

    NSLog(@"----------------------------------------------------------------------");
    NSLog(@"That's all, folks.");
    NSLog(@"----------------------------------------------------------------------");
    
    [pool drain];
	
    return 0;
}