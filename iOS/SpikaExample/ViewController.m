//
//  ViewController.m
//  Spika
//
//  Created by mislav on 08/12/15.
//  Copyright © 2015 Clover Studio. All rights reserved.
//

#import "ViewController.h"
#import "CSChatViewController.h"
#import "CSCustomConfig.h"
#import "CSConfig.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *serverTextField;
@property (weak, nonatomic) IBOutlet UITextField *socketTextField;
@property (weak, nonatomic) IBOutlet UITextField *userIdTextField;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *avatarUrlTextField;
@property (weak, nonatomic) IBOutlet UITextField *roomTextField;

@property (nonatomic) BOOL isOnOld;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.serverTextField.text = [CSCustomConfig sharedInstance].server_url;
    self.socketTextField.text = [CSCustomConfig sharedInstance].socket_url;
    
    self.userIdTextField.text = [[[UIDevice currentDevice] name] stringByReplacingOccurrencesOfString:@"’" withString:@""];
    self.usernameTextField.text = [[[UIDevice currentDevice] name] stringByReplacingOccurrencesOfString:@"’" withString:@""];
    self.avatarUrlTextField.text = @"http://ossdemo.spika.chat/spika/img/avatar.jpg";
    self.roomTextField.text = @"default";
    
    self.serverTextField.enabled = NO;
    self.socketTextField.enabled = NO;
    self.serverTextField.textColor = [UIColor lightGrayColor];
    self.socketTextField.textColor = [UIColor lightGrayColor];
    self.isOnOld = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onButton:(id)sender {
    
    [CSCustomConfig sharedInstance].server_url = self.serverTextField.text;
    [CSCustomConfig sharedInstance].socket_url = self.socketTextField.text;
    
    NSDictionary *parameters = @{
                                 paramUserID : self.userIdTextField.text,
                                 paramName : self.usernameTextField.text,
                                 paramAvatarURL : self.avatarUrlTextField.text,
                                 paramRoomID: self.roomTextField.text
                                 };
    
    CSChatViewController *viewController = [[CSChatViewController alloc] initWithParameters:parameters];
    
//    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];    
//    [self presentViewController:navigationController animated:YES completion:nil];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)onEnableConfigSwitch:(UISwitch *)sender {
    if (sender.isOn && !self.isOnOld) {
        self.isOnOld = YES;
        
        self.serverTextField.enabled = YES;
        self.socketTextField.enabled = YES;
        self.serverTextField.textColor = [UIColor blackColor];
        self.socketTextField.textColor = [UIColor blackColor];
    }
    else if (!sender.isOn && self.isOnOld) {
        self.isOnOld = NO;
        
        self.serverTextField.enabled = NO;
        self.socketTextField.enabled = NO;
        self.serverTextField.textColor = [UIColor lightGrayColor];
        self.socketTextField.textColor = [UIColor lightGrayColor];
    }
}

@end
