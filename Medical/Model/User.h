//
//  User.h
//  Medical
//
//  Created by 许冬 on 2019/5/26.
//  Copyright © 2019 Danny. All rights reserved.
//

#import "RLMObject.h"
#import "RLMArray.h"
#import "Pet.h"

NS_ASSUME_NONNULL_BEGIN

RLM_ARRAY_TYPE(Pet)

@interface User : RLMObject

@property NSString *phone;
@property NSString *name;

@property RLMArray<Pet> *pets;

@end

NS_ASSUME_NONNULL_END
