//
//  FoundItemViewController.m
//  Hackathon
//
//  Created by Josh Klobe on 4/14/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import "FoundItemViewController.h"
#import "QuestObject.h"
@interface FoundItemViewController ()

@end

@implementation FoundItemViewController

@synthesize headerLabel, objectImageView, delegate;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.headerLabel.font = [UIFont fontWithName:@"SignPainter" size:20];
    // Do any additional setup after loading the view from its nib.
}

-(void)initializeWithObjectString:(NSString *)theObjectString
{
    theObjectString = @"Pillow";
    self.headerLabel.text = [NSString stringWithFormat:@"YOU FOUND THE %@", theObjectString];
    
    NSString *filename = @"item_pillow.png";
    self.objectImageView.image = [UIImage imageNamed:filename];
    
}

-(IBAction)acceptButtonHit
{
    [self.delegate foundAcceptButtonHit:self];
}

@end
