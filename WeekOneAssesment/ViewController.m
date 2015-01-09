//
//  ViewController.m
//  WeekOneAssesment
//
//  Created by Irwin Gonzales on 1/9/15.
//  Copyright (c) 2015 Irwin Gonzales. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"

@interface ViewController () <UIWebViewDelegate, UITextFieldDelegate, UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *resultNumberLabel;
@property (strong, nonatomic) IBOutlet UITextField *textFieldValueOne;
@property (strong, nonatomic) IBOutlet UITextField *textFieldMultiplyer;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *webButton;

//@property NSInteger *result;

@end

@implementation ViewController




- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.webButton.enabled =false;

}

//Calculation Agorithim
- (IBAction)calculateOnButtonPressed:(id)sender
{
    NSString *numberImputOne =  self.textFieldValueOne.text;
    double resultInt = [numberImputOne integerValue];
    
    
    NSString *numberImputTwo = self.textFieldMultiplyer.text;
    double multiplierInt = [numberImputTwo integerValue];
    
    int result = (resultInt * multiplierInt);
    
    self.navigationItem.title = [NSString stringWithFormat:@"%i", result];

    if (result % 5 == 0);
    {
        self.webButton.enabled = true;
    }

}

//This is the segue
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    WebViewController *vc = segue.destinationViewController;
    vc.title = self.navigationItem.title;
    

}



@end
