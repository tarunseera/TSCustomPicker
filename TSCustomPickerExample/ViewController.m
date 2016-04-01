//
//  ViewController.m
//  TSCustomPickerExample
//  Copyright © 2016 Tarun Seera. All rights reserved.
//

#import "ViewController.h"
#import "TSCustomPickerController.h"
@interface ViewController ()<TSCustomPickerDelegate,TSCustomPickerDataSource>{

    NSArray* dataArray;
}
@property (weak, nonatomic) IBOutlet UIButton *optionButton;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dataArray=@[@"Sunday",@"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Firday",@"Saturday"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)optionButtonTapped:(id)sender {
    
    UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TSCustomPickerController* tsCustomPickerController = [storyBoard instantiateViewControllerWithIdentifier:@"TSCustomPickerController"];
    tsCustomPickerController.delegate=self;
    tsCustomPickerController.dataSource=self;
    tsCustomPickerController.view.alpha=0.0;
    [self.view addSubview:tsCustomPickerController.view];
    [self addChildViewController:tsCustomPickerController];
    [UIView animateWithDuration:0.5 animations:^{
        
        tsCustomPickerController.view.alpha=1.0;
    }];

}

-(NSInteger)numberOfRowsInTSCustomPicker:(TSCustomPickerController *)picker{
    
    return  dataArray.count;
    //return 24;
}
-(NSString*)tsCustomPicker:(TSCustomPickerController *)picker titleForRowAtIndex:(NSInteger)index{

    return dataArray[index];
}
-(NSString*)titleForTSCustomPicker:(TSCustomPickerController *)picker{
    
    return @"TS Picker";
}

-(void)tsCustomPicker:(TSCustomPickerController *)picker didSelectAtIndex:(NSInteger)index{

    [self.optionButton setTitle:dataArray[index] forState:UIControlStateNormal];
}
@end
