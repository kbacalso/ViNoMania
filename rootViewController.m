//
//  rootViewController.m
//  ViNoMania
//
//  Created by Mikhail Lomibao Basbas on 11/27/12.
//
//

#import "rootViewController.h"
#import "VNTDViewController.h"

@interface rootViewController ()

@end

@implementation rootViewController
@synthesize TDBattle;

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
    [TDBattle addTarget:self action:@selector(GoToTDBattle) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setTDBattle:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) GoToTDBattle
{
    VNTDViewController *vntdvc = [[VNTDViewController alloc] init];
    [vntdvc setModalPresentationStyle:UIModalTransitionStyleCrossDissolve];
    [self presentModalViewController:vntdvc animated:YES];
}

@end
