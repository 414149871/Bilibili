//
//  VertiflyPhoneNumViewController.h
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/11/2.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "RootViewController.h"

@interface VertiflyPhoneNumViewController : RootViewController

@property (weak, nonatomic) IBOutlet UILabel *veritiflyResultLabel;

@property (weak, nonatomic) IBOutlet UILabel *phoneNumLabel;

@property (weak, nonatomic) IBOutlet UITextField *vertiflyNumTextField;

@property (nonatomic,strong)NSString  *phoneNumString;
@property (nonatomic,strong)NSString  *areaCodeString;





@end
