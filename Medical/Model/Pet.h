//
//  Pet.h
//  Medical
//
//  Created by 许冬 on 2019/5/26.
//  Copyright © 2019 Danny. All rights reserved.
//

#import "RLMObject.h"
#import "RLMArray.h"
#import "SkinExaminationReport.h"

NS_ASSUME_NONNULL_BEGIN

RLM_ARRAY_TYPE(SkinExaminationReport)


@interface Pet : RLMObject

@property NSString *species;
@property NSString *name;

@property RLMArray<SkinExaminationReport> *skinExaminationReports;

@end

NS_ASSUME_NONNULL_END
