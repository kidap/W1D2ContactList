//
//  ContactList.m
//  W1D2ContactList
//
//  Created by Karlo Pagtakhan on 03/08/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import "ContactList.h"
#import "Contact.h"

@implementation ContactList

-(id) init{
  
  self.allContacts = [@[] mutableCopy];
  
  return self;
}

-(void)addContact:(Contact *)newContact{;
  [self.allContacts addObject:newContact];
}

-(void)printContactList{
  int index = 0;
  
  NSLog(@"Diplaying the list...");
  
  for (Contact *contact in self.allContacts){
    NSLog(@"#%d: %@()",index, contact.name);
    index ++;
  }
  
  NSLog(@"End of the list");
}

-(void)showContactUsingIndex:(int) index{
  if (index <= [self.allContacts count] - 1){
    
    Contact *contact = self.allContacts[index];
    NSLog(@"Contact #%d name: %@", index, contact.name);
    NSLog(@"Contact #%d email: %@", index, contact.email);
  } else {
    NSLog(@"Contact not found");
  }
}

@end
