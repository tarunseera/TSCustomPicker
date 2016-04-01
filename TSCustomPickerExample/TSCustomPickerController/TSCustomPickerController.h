
//  Copyright © 2016 Tarun Seera. All rights reserved.

#import <UIKit/UIKit.h>
@class TSCustomPickerController;

@protocol TSCustomPickerDelegate <NSObject>
-(void)tsCustomPicker:(TSCustomPickerController*)picker didSelectAtIndex:(NSInteger)index;
@end

@protocol TSCustomPickerDataSource <NSObject>

-(NSInteger)numberOfRowsInTSCustomPicker:(TSCustomPickerController *)picker;
-(NSString*)tsCustomPicker:(TSCustomPickerController*)picker titleForRowAtIndex:(NSInteger)index;
-(NSString*)titleForTSCustomPicker:(TSCustomPickerController*)picker;
    
@end
@interface TSCustomPickerController : UIViewController

@property(nonatomic,weak) id <TSCustomPickerDelegate> delegate;
@property(nonatomic,weak) id <TSCustomPickerDataSource> dataSource;

@end
