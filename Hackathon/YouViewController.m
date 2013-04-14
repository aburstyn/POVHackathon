//
//  YouViewController.m
//  Hackathon
//
//  Created by Josh Klobe on 4/13/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import "YouViewController.h"
#import "UserProfileObject.h"
@interface YouViewController ()

@end

@implementation YouViewController

@synthesize userImageView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"profile_icon.png"] tag:0];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.userImageView.image = [UserProfileObject getSharedProfileObject].userImage;

}

@end
