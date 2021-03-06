//
// Copyright 2012 BiasedBit
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

//
//  Created by Bruno de Carvalho (@biasedbit, http://biasedbit.com)
//  Copyright (c) 2012 BiasedBit. All rights reserved.
//

#import "BBCancellable.h"



#pragma mark -

@implementation BBCancellable
{
    BOOL _cancelled;

    __strong NSString* _name;
}


#pragma mark Property synthesizers

@synthesize name = _name;


#pragma mark Creation

- (id)init
{
    return [self initWithName:@"anonymous"];
}

- (id)initWithName:(NSString*)name
{
    self = [super init];
    if (self != nil) {
        _name = name;
    }

    return self;
}


#pragma mark Public methods

- (BOOL)cancel
{
    BOOL previous = _cancelled;
    _cancelled = YES;

    return previous != _cancelled;
}

- (BOOL)isCancelled
{
    return _cancelled;
}


#pragma mark Description

- (NSString*)description
{
    return [NSString stringWithFormat:@"%@{name='%@', cancelled=%@}",
            NSStringFromClass([self class]), _name, _cancelled ? @"YES" : @"NO"];
}

@end

