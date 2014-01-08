//
//  InitialViewController.m
//  EthioTime
//
//  Created by Gabriel Massana on 1/6/14.
//  Copyright (c) 2014 Gabriel Massana. All rights reserved.
//

#import "InitialViewController.h"

@interface InitialViewController ()

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) UILabel *labelTimeHereHour;
@property (nonatomic, strong) UILabel *labelTimeEthiopiaOccidentalTimeHour;
@property (nonatomic, strong) UILabel *labelTimeEthiopiaTimeHour;

@property (nonatomic, strong) UILabel *labelTimeHereMinutes;
@property (nonatomic, strong) UILabel *labelTimeEthiopiaOccidentalTimeMinutes;
@property (nonatomic, strong) UILabel *labelTimeEthiopiaTimeMinutes;

@property (nonatomic, strong) UILabel *labelTimeHereColon;
@property (nonatomic, strong) UILabel *labelTimeEthiopiaOccidentalTimeColon;
@property (nonatomic, strong) UILabel *labelTimeEthiopiaTimeColon;

@property (nonatomic, strong) UILabel *labelTimeHereText;
@property (nonatomic, strong) UILabel *labelTimeEthiopiaOccidentalTimeText;
@property (nonatomic, strong) UILabel *labelTimeEthiopiaTimeText;

@property (nonatomic, strong) UIView *labelTimeHereSeparationLine;
@property (nonatomic, strong) UIView *labelTimeEthiopiaOccidentalTimeSeparationLine;
@property (nonatomic, strong) UIView *labelTimeEthiopiaTimeSeparationLine;

@property (nonatomic) BOOL timerFlag;

@end

@implementation InitialViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor colorWithRed:230.0f/255.0f green:230.0f/255.0f blue:230.0f/255.0f alpha:1.0f]];

    self.timerFlag = FALSE;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5
                                     target:self
                                   selector:@selector(reloadTime:)
                                   userInfo:nil
                                    repeats:YES];
    
    CGFloat heightText= (SCREEN_HEIGHT - 20) / 3.0f;
    CGFloat widthText= SCREEN_WIDTH / 3.0f;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"h"];
    
    self.labelTimeHereHour = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, widthText, heightText)];
    [self.labelTimeHereHour setText:[dateFormatter stringFromDate:[NSDate date]]];
    [self.labelTimeHereHour setTextColor:[UIColor blackColor]];
    [self.labelTimeHereHour setTextAlignment:NSTextAlignmentRight];
    [self.labelTimeHereHour setFont:[UIFont fontWithName:@"digital-7" size:55]];
    [self.view addSubview:self.labelTimeHereHour];
    
    self.labelTimeEthiopiaOccidentalTimeHour = [[UILabel alloc] initWithFrame:CGRectMake(0, 20+heightText, widthText, heightText)];
    [self.labelTimeEthiopiaOccidentalTimeHour setText:[self getEthiopiaOccidentalTimeHour:[NSDate date]]];
    [self.labelTimeEthiopiaOccidentalTimeHour setTextColor:[UIColor blackColor]];
    [self.labelTimeEthiopiaOccidentalTimeHour setTextAlignment:NSTextAlignmentRight];
    [self.labelTimeEthiopiaOccidentalTimeHour setFont:[UIFont fontWithName:@"digital-7" size:55]];
    [self.view addSubview:self.labelTimeEthiopiaOccidentalTimeHour];

    self.labelTimeEthiopiaTimeHour = [[UILabel alloc] initWithFrame:CGRectMake(0, 20+(2*heightText), widthText, heightText)];
    [self.labelTimeEthiopiaTimeHour setText:[self getEthiopiaTimeHour:[NSDate date]]];
    [self.labelTimeEthiopiaTimeHour setTextColor:[UIColor blackColor]];
    [self.labelTimeEthiopiaTimeHour setTextAlignment:NSTextAlignmentRight];
    [self.labelTimeEthiopiaTimeHour setFont:[UIFont fontWithName:@"digital-7" size:55]];
    [self.view addSubview:self.labelTimeEthiopiaTimeHour];
    
    self.labelTimeHereColon = [[UILabel alloc] initWithFrame:CGRectMake(widthText, 20, 13, heightText)];
    [self.labelTimeHereColon setText:@":"];
    [self.labelTimeHereColon setTextColor:[UIColor blackColor]];
    [self.labelTimeHereColon setTextAlignment:NSTextAlignmentCenter];
    [self.labelTimeHereColon setFont:[UIFont fontWithName:@"digital-7" size:55]];
    [self.view addSubview:self.labelTimeHereColon];
    
    self.labelTimeEthiopiaOccidentalTimeColon = [[UILabel alloc] initWithFrame:CGRectMake(widthText, 20+heightText, 13, heightText)];
    [self.labelTimeEthiopiaOccidentalTimeColon setText:@":"];
    [self.labelTimeEthiopiaOccidentalTimeColon setTextColor:[UIColor blackColor]];
    [self.labelTimeEthiopiaOccidentalTimeColon setTextAlignment:NSTextAlignmentCenter];
    [self.labelTimeEthiopiaOccidentalTimeColon setFont:[UIFont fontWithName:@"digital-7" size:55]];
    [self.view addSubview:self.labelTimeEthiopiaOccidentalTimeColon];
    
    self.labelTimeEthiopiaTimeColon = [[UILabel alloc] initWithFrame:CGRectMake(widthText, 20+(2*heightText), 13, heightText)];
    [self.labelTimeEthiopiaTimeColon setText:@":"];
    [self.labelTimeEthiopiaTimeColon setTextColor:[UIColor blackColor]];
    [self.labelTimeEthiopiaTimeColon setTextAlignment:NSTextAlignmentCenter];
    [self.labelTimeEthiopiaTimeColon setFont:[UIFont fontWithName:@"digital-7" size:55]];
    [self.view addSubview:self.labelTimeEthiopiaTimeColon];
    
    [dateFormatter setDateFormat:@"mm a"];
    
    self.labelTimeHereMinutes = [[UILabel alloc] initWithFrame:CGRectMake(widthText+15, 20, widthText+widthText-10, heightText)];
    [self.labelTimeHereMinutes setText:[dateFormatter stringFromDate:[NSDate date]]];
    [self.labelTimeHereMinutes setTextColor:[UIColor blackColor]];
    [self.labelTimeHereMinutes setTextAlignment:NSTextAlignmentLeft];
    [self.labelTimeHereMinutes setFont:[UIFont fontWithName:@"digital-7" size:55]];
    [self.view addSubview:self.labelTimeHereMinutes];
    
    self.labelTimeEthiopiaOccidentalTimeMinutes = [[UILabel alloc] initWithFrame:CGRectMake(widthText+15, 20+heightText, widthText+widthText-10, heightText)];
    [self.labelTimeEthiopiaOccidentalTimeMinutes setText:[self getEthiopiaOccidentalTimeMinutes:[NSDate date]]];
    [self.labelTimeEthiopiaOccidentalTimeMinutes setTextColor:[UIColor blackColor]];
    [self.labelTimeEthiopiaOccidentalTimeMinutes setTextAlignment:NSTextAlignmentLeft];
    [self.labelTimeEthiopiaOccidentalTimeMinutes setFont:[UIFont fontWithName:@"digital-7" size:55]];
    [self.view addSubview:self.labelTimeEthiopiaOccidentalTimeMinutes];
    
    self.labelTimeEthiopiaTimeMinutes = [[UILabel alloc] initWithFrame:CGRectMake(widthText+15, 20+(2*heightText), widthText+widthText-10, heightText)];
    [self.labelTimeEthiopiaTimeMinutes setText:[self getEthiopiaTimeMinutes:[NSDate date]]];
    [self.labelTimeEthiopiaTimeMinutes setTextColor:[UIColor blackColor]];
    [self.labelTimeEthiopiaTimeMinutes setTextAlignment:NSTextAlignmentLeft];
    [self.labelTimeEthiopiaTimeMinutes setFont:[UIFont fontWithName:@"digital-7" size:55]];
    [self.view addSubview:self.labelTimeEthiopiaTimeMinutes];
    
    CGFloat heightTextTitle= (heightText / 5.5);

    if (USER_INTERFACE_IDIOM == IPAD)
    {
        heightTextTitle= (heightText / 4.5);
    }
    else if (!(USER_INTERFACE_IDIOM == IPAD) && SCREEN_HEIGHT == 480)
    {
        heightTextTitle= (heightText / 8);
    }
    
    
    self.labelTimeHereText = [[UILabel alloc] initWithFrame:CGRectMake(20, 20+heightTextTitle, SCREEN_WIDTH-40, 25)];
    [self.labelTimeHereText setText:@"Local Time"];
    [self.labelTimeHereText setTextColor:[UIColor darkGrayColor]];
    [self.labelTimeHereText setTextAlignment:NSTextAlignmentLeft];
    [self.labelTimeHereText setFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size:20]];
    [self.view addSubview:self.labelTimeHereText];
    
    self.labelTimeEthiopiaOccidentalTimeText = [[UILabel alloc] initWithFrame:CGRectMake(20, 20+heightText+heightTextTitle, SCREEN_WIDTH-40, 25)];
    [self.labelTimeEthiopiaOccidentalTimeText setText:@"Ethiopian Local Time"];
    [self.labelTimeEthiopiaOccidentalTimeText setTextColor:[UIColor darkGrayColor]];
    [self.labelTimeEthiopiaOccidentalTimeText setTextAlignment:NSTextAlignmentLeft];
    [self.labelTimeEthiopiaOccidentalTimeText setFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size:20]];
    [self.view addSubview:self.labelTimeEthiopiaOccidentalTimeText];
    
    self.labelTimeEthiopiaTimeText = [[UILabel alloc] initWithFrame:CGRectMake(20, 20+(2*heightText)+heightTextTitle, SCREEN_WIDTH-40, 25)];
    [self.labelTimeEthiopiaTimeText setText:@"Ethiopian 12-hour clock Time"];
    [self.labelTimeEthiopiaTimeText setTextColor:[UIColor darkGrayColor]];
    [self.labelTimeEthiopiaTimeText setTextAlignment:NSTextAlignmentLeft];
    [self.labelTimeEthiopiaTimeText setFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size:20]];
    [self.view addSubview:self.labelTimeEthiopiaTimeText];
    
    
    self.labelTimeHereSeparationLine = [[UIView alloc] initWithFrame:CGRectMake(20, 20+heightTextTitle, SCREEN_WIDTH-40, 1)];
    [self.labelTimeHereSeparationLine setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:self.labelTimeHereSeparationLine];
    
    self.labelTimeEthiopiaOccidentalTimeSeparationLine = [[UIView alloc] initWithFrame:CGRectMake(20, 20+heightText+heightTextTitle, SCREEN_WIDTH-40, 1)];
    [self.labelTimeEthiopiaOccidentalTimeSeparationLine setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:self.labelTimeEthiopiaOccidentalTimeSeparationLine];

    
    self.labelTimeEthiopiaTimeSeparationLine = [[UIView alloc] initWithFrame:CGRectMake(20, 20+(2*heightText)+heightTextTitle, SCREEN_WIDTH-40, 1)];
    [self.labelTimeEthiopiaTimeSeparationLine setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:self.labelTimeEthiopiaTimeSeparationLine];

    
    if (USER_INTERFACE_IDIOM == IPAD)
    {
        [self.labelTimeEthiopiaTimeText setFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size:35]];
        [self.labelTimeEthiopiaOccidentalTimeText setFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size:35]];
        [self.labelTimeHereText setFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size:35]];

        [self.labelTimeHereHour setFont:[UIFont fontWithName:@"digital-7" size:90]];
        [self.labelTimeEthiopiaOccidentalTimeHour setFont:[UIFont fontWithName:@"digital-7" size:90]];
        [self.labelTimeEthiopiaTimeHour setFont:[UIFont fontWithName:@"digital-7" size:90]];
        
        [self.labelTimeHereColon setFont:[UIFont fontWithName:@"digital-7" size:75]];
        [self.labelTimeEthiopiaOccidentalTimeColon setFont:[UIFont fontWithName:@"digital-7" size:75]];
        [self.labelTimeEthiopiaTimeColon setFont:[UIFont fontWithName:@"digital-7" size:75]];
        
        [self.labelTimeHereMinutes setFont:[UIFont fontWithName:@"digital-7" size:90]];
        [self.labelTimeEthiopiaOccidentalTimeMinutes setFont:[UIFont fontWithName:@"digital-7" size:90]];
        [self.labelTimeEthiopiaTimeMinutes setFont:[UIFont fontWithName:@"digital-7" size:90]];
        
        
        [self.labelTimeHereColon setFrame:CGRectMake(widthText, 20, 15, heightText)];
        [self.labelTimeEthiopiaOccidentalTimeColon setFrame:CGRectMake(widthText, 20+heightText, 15, heightText)];
        [self.labelTimeEthiopiaTimeColon setFrame:CGRectMake(widthText, 20+(2*heightText), 15, heightText)];
        
        
        [self.labelTimeHereText setFrame:CGRectMake(20, 20+heightTextTitle, SCREEN_WIDTH-40, 40)];
        [self.labelTimeEthiopiaOccidentalTimeText setFrame:CGRectMake(20, 20+heightText+heightTextTitle, SCREEN_WIDTH-40, 40)];
        [self.labelTimeEthiopiaTimeText setFrame:CGRectMake(20, 20+(2*heightText)+heightTextTitle, SCREEN_WIDTH-40, 40)];
        
    }
    
}

-(NSUInteger)supportedInterfaceOrientations
{
    return (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown);
}

#pragma mark Timer reload Time

- (void) reloadTime: (id) sender
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"h"];
    [self.labelTimeHereHour setText:[dateFormatter stringFromDate:[NSDate date]]];
    [self.labelTimeEthiopiaOccidentalTimeHour setText:[self getEthiopiaOccidentalTimeHour:[NSDate date]]];
    [self.labelTimeEthiopiaTimeHour setText:[self getEthiopiaTimeHour:[NSDate date]]];
    
    [dateFormatter setDateFormat:@"mm a"];
    [self.labelTimeHereMinutes setText:[dateFormatter stringFromDate:[NSDate date]]];
    [self.labelTimeEthiopiaOccidentalTimeMinutes setText:[self getEthiopiaOccidentalTimeMinutes:[NSDate date]]];
    [self.labelTimeEthiopiaTimeMinutes setText:[self getEthiopiaTimeMinutes:[NSDate date]]];
    
    if (self.timerFlag == FALSE)
    {
        self.timerFlag = TRUE;
        
        [self.labelTimeHereColon setTextColor:[UIColor blackColor]];
        [self.labelTimeEthiopiaOccidentalTimeColon setTextColor:[UIColor blackColor]];
        [self.labelTimeEthiopiaTimeColon setTextColor:[UIColor blackColor]];

    }
    else
    {
        self.timerFlag = FALSE;
        
        [self.labelTimeHereColon setTextColor:[UIColor clearColor]];
        [self.labelTimeEthiopiaOccidentalTimeColon setTextColor:[UIColor clearColor]];
        [self.labelTimeEthiopiaTimeColon setTextColor:[UIColor clearColor]];
    }
}

#pragma mark Ethiopian Times

-(NSString *)getEthiopiaOccidentalTimeHour:(NSDate *)localDate
{
    NSTimeInterval secondsInThreeHours = 3 * 60 * 60;
    NSDate *dateThreeHoursAhead = [localDate dateByAddingTimeInterval:secondsInThreeHours];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"h"];
    NSString *dateString = [dateFormatter stringFromDate:dateThreeHoursAhead];
    return dateString;
}

-(NSString *)getEthiopiaTimeHour:(NSDate *)localDate
{
    NSTimeInterval secondsInThreeHours = -3 * 60 * 60;
    NSDate *dateThreeHoursAhead = [localDate dateByAddingTimeInterval:secondsInThreeHours];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"h"];
    NSString *dateString = [dateFormatter stringFromDate:dateThreeHoursAhead];
    return dateString;
}

-(NSString *)getEthiopiaOccidentalTimeMinutes:(NSDate *)localDate
{
    NSTimeInterval secondsInThreeHours = 3 * 60 * 60;
    NSDate *dateThreeHoursAhead = [localDate dateByAddingTimeInterval:secondsInThreeHours];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"mm a"];
    NSString *dateString = [dateFormatter stringFromDate:dateThreeHoursAhead];
    return dateString;
}

-(NSString *)getEthiopiaTimeMinutes:(NSDate *)localDate
{
    NSTimeInterval secondsInThreeHours = -3 * 60 * 60;
    NSDate *dateThreeHoursAhead = [localDate dateByAddingTimeInterval:secondsInThreeHours];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"mm"];
    NSString *dateString = [dateFormatter stringFromDate:dateThreeHoursAhead];
    return dateString;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
