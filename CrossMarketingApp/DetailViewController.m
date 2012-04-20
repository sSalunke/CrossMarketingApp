//
//  DetailViewController.m
//  CrossMarketingApp
//
//  Created by swapnil salunke on 12/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () 

-(void)displayInfoForSelectedIndex:(NSInteger)selectedIndex;

@end


@implementation DetailViewController

@synthesize imageHolder = _imageHolder;
@synthesize appTitle = _appTitle;
@synthesize appDescription = _appDescription;
@synthesize barButtonPrevious = _barButtonPrevious;
@synthesize barButtonNext = _barButtonNext;
@synthesize barButtonGetApplication = _barButtonGetApplication;
@synthesize descToolBar = _descToolBar;
@synthesize currentIndex = _currentIndex;
@synthesize arrayOfItems = _arrayOfItems;


- (void)dealloc
{

    [_imageHolder release];
    
    [_appTitle release];
    [_appDescription release];
    [_barButtonPrevious release];   
    [_barButtonNext release];
    [_barButtonGetApplication release];

    [_descToolBar release];
    [super dealloc];
}

#pragma mark - Managing the detail item

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.

}

- (void)viewDidUnload
{
    [self setImageHolder:nil];
    
    [self setAppTitle:nil];
    [self setAppDescription:nil];
    [self setBarButtonPrevious:nil];
    [self setBarButtonNext:nil];
    [self setBarButtonGetApplication:nil];

    [self setDescToolBar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self displayInfoForSelectedIndex:self.currentIndex];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}
							
- (IBAction)getPreviousItem:(id)sender {
    
    
    self.currentIndex-=1;
    [self displayInfoForSelectedIndex:self.currentIndex];
}

- (IBAction)getNextItem:(id)sender {
    self.currentIndex+=1;
    [self displayInfoForSelectedIndex:self.currentIndex];
}

- (IBAction)getTheApplication:(id)sender {
    
    NSDictionary *infoDict = [self.arrayOfItems objectAtIndex:self.currentIndex];
    NSString *appLink  = [infoDict objectForKey:@"AppLink"];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appLink]];
}

-(void)displayInfoForSelectedIndex:(NSInteger)selectedIndex
{
    NSDictionary *infoDict = [self.arrayOfItems objectAtIndex:selectedIndex];
    self.appTitle.text = [infoDict valueForKey:@"AppTitle"];
   
    NSString *imagePath  = [infoDict valueForKey:@"AppImagePath"];
    
       
    [self.imageHolder getAppImageLazilyWithImagePath:imagePath];
    if (selectedIndex-1<0) {
        self.barButtonPrevious.enabled = NO;
    }
    else
    {
        self.barButtonPrevious.enabled = YES;
    }
    if (selectedIndex+1==self.arrayOfItems.count) {
        self.barButtonNext.enabled = NO;
    }
    else
    {
        self.barButtonNext.enabled = YES;
    }
    
}

@end
