# Objective-C Domainr API Wrapper

## Usage/Installation
1) Copy the `domainr` folder into your project.

2) Have a `#import Domainr.h` in your source code:

    #import Domainr.h

3) Instantiate a new instance of the `Domainr` class:

    Domainr *d = [[Domainr alloc] init];

4) Call the appropriate method on the object (`search` and `info` are
available):


    // stores the search result in a searchResult variable
    // parameter is (a) keyword(s) passed via string
    id searchResult = [d search:@"connor"];

    // stores the info result in an infoResult variable
    // parameter is a URL passed via a string
    id infoResult = [d info:@"cnnr.me"];


## Example

I have examples of the method calls in [main.m](https://github.com/connor/domainr-objectiveC/blob/master/main.m). The easiest way to see this in action is
to open the Xcode project up and run it. You will see the log populate
with the responses from Domainr.   

## Thanks
A **huge** thank you to Joshua Russell for his [Dribbble API Wrapper](https://github.com/joshuarussell/Objective-Dribbble),
which provided a great starting point for an Objective-C n00b like
myself to make this. &lt;3
