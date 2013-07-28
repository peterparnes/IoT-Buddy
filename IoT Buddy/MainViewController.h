//
//  MainViewController.h
//  IoT Buddy
//
//  Created by Joel Wehr on 7/13/13.
//  Copyright (c) 2013 Joel Wehr. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <NSURLConnectionDelegate>
{
    NSString *impURL;
        
    NSURLConnection *connection;
    NSMutableData *responseData;
    NSMutableURLRequest *request;
    
}

//@property (nonatomic, retain) IBOutlet UILabel *httpResponseLabel;
@property (nonatomic, weak) IBOutlet UIButton *buttonOne;

- (IBAction)buttonOnePressed:(id)sender;

@end
