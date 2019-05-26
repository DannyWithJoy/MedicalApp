//
//  Pet.h
//  Medical
//
//  Created by 许冬 on 2019/5/26.
//  Copyright © 2019 Danny. All rights reserved.
//

#import "RLMObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface Pet : RLMObject

@property NSString *species;
@property NSString *name;

@end

NS_ASSUME_NONNULL_END
