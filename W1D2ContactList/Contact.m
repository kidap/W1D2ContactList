//
//  Contact.m
//  W1D2ContactList
//
//  Created by Karlo Pagtakhan on 03/08/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import "Contact.h"

@implementation Contact


-(id) initNewContactWithName:(NSString *)name withEmail:(NSString *) email {
  self = [super init];
  
  _name = name;
  _email = email;
  _numbers = [[NSMutableArray alloc] init];
  
  return self;
}

-(void) addContactNumberWithNumberType:(NSString *)numberType wittNumber:(NSString *)number{
  NSMutableArray *numberArray = [[NSMutableArray alloc] init];

  [numberArray addObject:numberType];
  [numberArray addObject:number];
  [self.numbers addObject:numberArray];
  
}

@end
