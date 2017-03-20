//
//  ViewController.m
//  Week1Assessment-(Ard)
//
//  Created by ardMac on 20/03/2017.
//  Copyright © 2017 ardMac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;

@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (strong,nonatomic) IBOutletCollection(UIButton) NSArray *operatorButtons;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (UIButton *button in self.operatorButtons){
        [button addTarget:self action:@selector(calculate:) forControlEvents:UIControlEventTouchUpInside];
        self.tabBarController.tabBar.userInteractionEnabled = NO; //disabling the tabbar button
    }
    //if textField1 || textField2 is @"", disable all buttons.
//    if ([self.textField1.text isEqualToString:@""] || [self.textField2.text isEqualToString:@""]){
//        for (UIButton *button in self.operatorButtons) {
//            [button setEnabled:NO];
//        }
//    }else {
//        for (UIButton *button in self.operatorButtons) {
//            [button setEnabled:YES];
//
//    }

    // Do any additional setup after loading the view, typically from a nib.
}



- (void)calculate:(UIButton *)sender {

    int num =[_textField1.text intValue];
    int num2 =[_textField2.text intValue];
    int sum;
    if ([sender.titleLabel.text isEqualToString:@"+"]) {
        sum = num + num2 ;
    }
    else if ([sender.titleLabel.text isEqualToString:@"-"]) {
        sum = num - num2;
    }
    else if ([sender.titleLabel.text isEqualToString:@"÷"]) {
        if (num2 == 0){return;}
        else{
        sum = num / num2;
        }
    }
    else if ([sender.titleLabel.text isEqualToString:@"x"]) {
        sum = num * num2;
    }
    else {return;}
    //bawah ni boleh buat function baru
    if(self.tabBarController.tabBar.userInteractionEnabled == YES) {
        self.tabBarController.tabBar.userInteractionEnabled = NO;
    }
    
    self.answerLabel.text = [NSString stringWithFormat:@"%d", sum];
    
    if (sum%9 == 0) {
        
        
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"GENIUS" message:NULL preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *dismissAction = [ UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:NULL];
        [alert addAction:dismissAction];
        [self presentViewController:alert animated:YES completion:NULL];
    }
    if (sum == 999){
        [self.tabBarController setSelectedIndex:1]; //go to tab bar index 1 = tab 2
        self.tabBarController.tabBar.userInteractionEnabled =YES;
    }
}





@end
