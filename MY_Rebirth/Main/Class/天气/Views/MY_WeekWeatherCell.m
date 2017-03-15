//
//  MY_WeekWeatherCell.m
//  MY_Rebirth
//
//  Created by ifly on 2017/3/15.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_WeekWeatherCell.h"

@interface MY_WeekWeatherCell ()

@property (weak, nonatomic) IBOutlet UILabel *weatherLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *sunIconLabel;

@end



@implementation MY_WeekWeatherCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
