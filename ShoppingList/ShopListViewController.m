//
//  ShopListViewController.m
//  ShoppingList
//
//  Created by Simon Tucker on 31/03/2014.
//  Copyright (c) 2014 Brotherlogic. All rights reserved.
//

#import "ShopListViewController.h"
#import "User.h"
#import <Social/Social.h>
#import <Twitter/Twitter.h>
#import <Accounts/Accounts.h>

@interface ShopListViewController ()

@property (strong, nonatomic) ACAccount         *twitterAccount;
@property (strong, nonatomic) ACAccountType     *accountType;
@property (strong, nonatomic) NSArray           *twitterAccounts;

@end

@implementation ShopListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)loginTwitter:(id)sender {
    NSLog(@"We are logging in");
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        ACAccountStore *accountStore = [[ACAccountStore alloc] init];
        ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error) {
            if (granted) {
                NSArray *accounts = [accountStore accountsWithAccountType:accountType];
                if (accounts.count > 0)
                {
                    NSURL *mentionsURL = [NSURL URLWithString:@"https://api.twitter.com/1.1/account/verify_credentials.json"];
                    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
                    
                    for (ACAccount *twitterAccount in accounts) {
                        SLRequest *twitterInfoRequest = [SLRequest requestForServiceType:SLServiceTypeTwitter
                                                                           requestMethod:SLRequestMethodGET
                                                                                     URL:mentionsURL
                                                                              parameters:parameters];
                        [twitterInfoRequest setAccount:twitterAccount];
                        [twitterInfoRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                            
                             NSError *jsonError;
                            NSDictionary *userData =
                            [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingAllowFragments error:&jsonError];
                            NSLog(@"Timeline Response: %@\n", [userData objectForKey:@"id"]);
                            
                            //Create and persist the user
                            NSString *uName = [userData objectForKey:@"name"];
                            NSInteger uID = [[userData objectForKey:@"id"] integerValue];
                            NSURL *avURL = [NSURL URLWithString:[userData objectForKey:@"profile_image_url"]];
                            User *mainUser = [[User alloc] init:uName :&uID :avURL];

                            
                        }];
                    }
                }
            }
        }];
    }
    else
    {
        NSLog(@"Not availble");
    }
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
