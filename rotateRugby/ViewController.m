//
//  ViewController.m
//  rotateRugby
//
//  Created by trung bao on 25/11/2015.
//  Copyright © 2015 baotrung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *rugby;

@end

@implementation ViewController {
    NSTimer *timer;
    CGFloat vecto;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    vecto = 0.0;
    // Do any additional setup after loading the view, typically from a nib.
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                             target:self
                                           selector:@selector(loop)
                                           userInfo:nil
                                            repeats:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)rotate:(id)sender {
    UIRotationGestureRecognizer *rotate = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotateImage:)];
    [self.rugby addGestureRecognizer:rotate];
    
}
- (void)rotateImage:(UIRotationGestureRecognizer *)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateBegan || recognizer.state == UIGestureRecognizerStateChanged) {
        self.rugby.transform = CGAffineTransformRotate(self.rugby.transform, recognizer.rotation);
        recognizer.rotation = 0.0;
        vecto = 0.0;
    }
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        CGFloat x = [recognizer velocity];
        vecto = x;
    }
}
- (void) loop {
    self.rugby.transform = CGAffineTransformRotate(self.rugby.transform,vecto);
    vecto *= 0.95;
}
- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer = nil;
}
@end
