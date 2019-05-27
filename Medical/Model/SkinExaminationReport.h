//
//  SkinExaminationReport.h
//  Medical
//
//  Created by 许冬 on 2019/5/27.
//  Copyright © 2019 Danny. All rights reserved.
//

#import "RLMObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface SkinExaminationReport : RLMObject

@property NSDate *date;

@property NSString *checkItem;
@property NSString *sampleType;

@property NSString *checkBacteria;
@property NSString *checkFungus;
@property NSString *checkParasite;
@property NSString *checkHair;
@property NSString *checkAbnormalCell;

@end

NS_ASSUME_NONNULL_END
