//
//  MainViewController.m
//  IoT Buddy
//
//  Created by Joel Wehr on 7/13/13.
//  Copyright (c) 2013 Joel Wehr. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    impURL = @""; // Set electric imp URL here
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)viewWillAppear:(BOOL)animated;
{
}

- (IBAction)buttonOnePressed:(id)sender;
{
    [self sendIMPURL:(impURL)withParams:@"0"];
}

- (IBAction)buttonTwoPressed:(id)sender;
{
    [self sendIMPURL:(impURL)withParams:@"1"];
}


-(void)sendIMPURL: (NSString *) url withParams: (NSString *) params;
{
    
    NSString *parameters = [NSString stringWithFormat:@"value=%@", params];
    NSLog(@"%@", parameters);
    responseData = [[NSMutableData data] init];
    request = [NSMutableURLRequest
               requestWithURL:[NSURL URLWithString:(url)]];
    
    // HTTP request type
    [request setHTTPMethod:@"POST"];
    
    [request setHTTPBody:[parameters dataUsingEncoding:NSUTF8StringEncoding]];
    connection = [[NSURLConnection alloc] initWithRequest:request
                                                 delegate:self
                                         startImmediately:YES];
    //[_httpResponseLabel setText:[NSString stringWithFormat:@"%@",request]];
    
    
}

// A response has been received, this is where we initialize the instance var you created
// so that we can append data to it in the didReceiveData method
// Furthermore, this method is called each time there is a redirect so reinitializing it
// also serves to clear it
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    responseData = [[NSMutableData alloc] init];
}

//Check for response data and append it to the data object
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSMutableData *)data
{
    [responseData appendData:data];
    
}

//Check if the connection is finished and output all appended data
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    //NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    //[_httpResponseLabel setText:responseString];
    
}
// Return nil to indicate not necessary to store a cached response for this connection
- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    
    return nil;
}
- (void)connection:(NSURLConnection *)connection

  didFailWithError:(NSError *)error

{
    // inform the user
    //[_httpResponseLabel setText:@"Error"];
    
    /*
     NSLog(@"Connection failed! Error - %@ %@",
     
     [error localizedDescription],
     
     [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
     */
}

@end
