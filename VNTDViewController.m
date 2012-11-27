//
//  VNTDViewController.m
//  ViNoMania
//
//  Created by Mikhail Lomibao Basbas on 11/27/12.
//
//

#import "VNTDViewController.h"
#import <QuartzCore/CoreAnimation.h>

@interface VNTDViewController ()

@end

@implementation VNTDViewController
@synthesize obstacle;
@synthesize towers;
@synthesize spacingHorizontal;
@synthesize spacingVertical;
@synthesize maxPerRow;

- (id) init
{
    self = [super init];
    if(self)
    {
        spacingHorizontal = spacingVertical = 40;
        maxPerRow = 8;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initializeMap];
    [self initializeTowers];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    PImageView = nil;
    AImageView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void) initializeMap
{
    obstacle = [[NSMutableArray alloc] init];
    
    // Loop through and create 48 buttons at 50 x 53
    for(int i = 0; i < 88; i++)
    {
        UIButton *pressMe = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [obstacle addObject:pressMe];
        pressMe.frame = CGRectMake(0, 0, 40, 40);
        // Set background image for when button is selected
        [pressMe setBackgroundImage:[UIImage imageNamed:@"selectedImage.png"] forState:UIControlStateSelected];
        // Add target to toggle selected state of button
        [pressMe addTarget:self action:@selector(selectGrid) forControlEvents:UIControlEventTouchUpInside];
        // Hide the button
        [pressMe setHidden:YES];
    }
    
    int col = 0;
    int row = 0;
    
    for(UIButton *view in obstacle)
    {
        // position buttons in 6 x 8 grid
        view.frame = CGRectMake(col * spacingHorizontal, row * spacingVertical, view.frame.size.width, view.frame.size.height);
        [self.view addSubview:view];
        
        if(col % maxPerRow == maxPerRow-1)
        {
            col = 0;
            row++;
        }
        else
        {
            col++;
        }
    }
}

-(void) initializeTowers
{
    towers = [[NSMutableArray alloc] init];
    for(int i = 0; i < 8; i++)
    {
        UIButton *pressMe = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        [towers addObject:pressMe];
        pressMe.frame = CGRectMake(0, 0, 40, 40);
        // Set background image for when button is selected
        [pressMe setBackgroundImage:[UIImage imageNamed:@"selectedImage.png"] forState:UIControlStateSelected];
        // Add target to toggle selected state of button
        [pressMe addTarget:self action:@selector(addTower) forControlEvents:UIControlEventTouchUpInside];
    }
    
    int count = 0;
    
    for(UIButton *view in towers)
    {
        // position buttons in 6 x 8 grid
        view.frame = CGRectMake(count * spacingHorizontal, 11 * spacingVertical, view.frame.size.width, view.frame.size.height);
        [self.view addSubview:view];
        if(count < maxPerRow-1)
        {
            count++;
        }
    }
}

-(void) addTower
{
   for(UIButton *view in obstacle)
   {
       [view setHidden:NO];
   }
}

-(void) selectGrid
{
    NSLog(@"Button Pressed");
    for(UIButton *view in obstacle)
    {
        [view setHidden:YES];
    }
}

@end
