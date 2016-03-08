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
  self.name = name;
  self.email = email;
  
  return self;
}

@end
