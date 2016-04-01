
//  Copyright © 2016 Tarun Seera. All rights reserved.
//

#import "TSCustomPickerController.h"


@interface TSCustomPickerController ()<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>{

}

@property(nonatomic,weak)IBOutlet UITableView* pickerTable;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hightConstraint;

@end

@implementation TSCustomPickerController

-(void)viewDidLoad{

    [super viewDidLoad];

    self.pickerTable.alwaysBounceVertical = NO;
    
    
}
-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    //self.hightConstraint.constant=(_productUnitEntity.productList.count+1)*44;
}
#pragma mark - Table View Delegate and Data Soruce
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSInteger rowNumber=[self.dataSource numberOfRowsInTSCustomPicker:self];
    
    CGFloat maxHieght = self.view.frame.size.height-88;
    CGFloat requiredHeight =(rowNumber+1)*44;
    
    if (requiredHeight>maxHieght) {
        
        requiredHeight=maxHieght;
    }
    self.hightConstraint.constant=requiredHeight;
    return rowNumber;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"PickerCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.dataSource tsCustomPicker:self titleForRowAtIndex:indexPath.row];
    return cell;
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    return [self.dataSource titleForTSCustomPicker:self];
}
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    // Background color
    view.tintColor = [UIColor redColor];
    // Text Color
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    [header.textLabel setTextColor:[UIColor whiteColor]];
    [header.textLabel setFont:[UIFont systemFontOfSize:18]];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [self.delegate tsCustomPicker:self didSelectAtIndex:indexPath.row];
    [self viewTapped:nil];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 44;
}
- (IBAction)viewTapped:(id)sender {
        [UIView animateWithDuration:0.5 animations:^{
        self.view.alpha=0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromParentViewController];
            [self.view removeFromSuperview];
        }
    }];
  
}

@end
