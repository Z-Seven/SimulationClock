//
//  ViewController.m
//  模拟时钟
//
//  Created by 赵富文 on 16/1/27.
//  Copyright © 2016年 youki. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *clockView;

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) CALayer *hourLayer;
@property (strong, nonatomic) CALayer *minuteLayer;
@property (strong, nonatomic) CALayer *secondLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect clockFrame = self.clockView.frame;
    UIImage *clockface = [UIImage imageNamed:@"1"];
    self.clockView.layer.contents = (__bridge id)clockface.CGImage;
    
    CALayer *hourPart = [CALayer layer];
    hourPart.frame = CGRectMake(0, 0, 50, clockFrame.size.width/2);
    hourPart.position = self.clockView.layer.position;
    UIImage *hours = [UIImage imageNamed:@"2"];
    hourPart.contents = (__bridge id)hours.CGImage;
    hourPart.anchorPoint = CGPointMake(0.5, 0.8);
    [self.view.layer addSublayer:hourPart];
    self.hourLayer = hourPart;
    
    CALayer *MinutePart = [CALayer layer];
    MinutePart.frame = CGRectMake(0, 0, 40, clockFrame.size.width/2);
    MinutePart.position = self.clockView.layer.position;
    UIImage *minute = [UIImage imageNamed:@"3"];
    MinutePart.contents = (__bridge id)minute.CGImage;
    MinutePart.anchorPoint = CGPointMake(0.5, 0.8);
    [self.view.layer addSublayer:MinutePart];
    self.minuteLayer = MinutePart;
    
    CALayer *secondPart = [CALayer layer];
    secondPart.frame = CGRectMake(0, 0, 30, clockFrame.size.width/2);
    secondPart.position = self.clockView.layer.position;
    UIImage *second = [UIImage imageNamed:@"4"];
    secondPart.contents = (__bridge id)second.CGImage;
    secondPart.anchorPoint = CGPointMake(0.5, 0.8);
    [self.view.layer addSublayer:secondPart];
    self.secondLayer = secondPart;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(click) userInfo:nil repeats:YES];
    [self click];
}

- (void)click{
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierRepublicOfChina];
    NSCalendarUnit units = NSCalendarUnitHour | NSCalendarUnitMinute |NSCalendarUnitSecond;
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    CGFloat hourAngle = (components.hour / 12.0)*M_PI*2.0;
    CGFloat minuteAngle = (components.minute / 60.0)*M_PI*2.0;
    CGFloat secondAngle = (components.second /60.0)*M_PI*2.0;
    
    self.hourLayer.affineTransform = CGAffineTransformMakeRotation(hourAngle);
    self.minuteLayer.affineTransform = CGAffineTransformMakeRotation(minuteAngle);
    self.secondLayer.affineTransform = CGAffineTransformMakeRotation(secondAngle);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
