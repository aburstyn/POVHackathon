//
//  FoundItemViewController.h
//  Hackathon
//
//  Created by Josh Klobe on 4/14/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoundItemViewController : UIViewController
{
    UILabel *headerLabel;
    UIImageView *objectImageView;
    id delegate;
    
}

-(void)initializeWithObjectString:(NSString *)theObjectString;
-(IBAction)acceptButtonHit;

@property (nonatomic, retain) IBOutlet UILabel *headerLabel;
@property (nonatomic, retain) IBOutlet UIImageView *objectImageView;
@property (nonatomic, retain) id delegate;
@end
