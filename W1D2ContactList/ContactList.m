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
  if ([self.allContacts count] > 0 && index <= [self.allContacts count] - 1){
    
    Contact *contact = self.allContacts[index];
    NSLog(@"Contact #%d name: %@", index, contact.name);
    NSLog(@"Contact #%d email: %@", index, contact.email);
  } else {
    NSLog(@"Contact not found");
  }
}

-(void)findContact:(NSString *) name{
  int index = 0;
  bool nameFound = NO;
  
  //Check if the there is at least 1 contact and the search string is not initial
  if ([self.allContacts count] > 0  && name !=nil){
    
    //Search for contact name
    for (Contact *contact in self.allContacts){
      if ([contact.name containsString:name]){
        //Display found contact
        NSLog(@"Contact #%d name: %@", index, contact.name);
        NSLog(@"Contact #%d email: %@", index, contact.email);
        nameFound = YES;
        index ++;
      }
    }
  }
  
  //Display message
  if (nameFound == NO) {
    NSLog(@"Contact not found");
  }
}

-(bool)isEmailAddressInvalid:(NSString *)email{
  bool emailInvalid = NO;
  
  //Check if the there is at least 1 contact and the search string is not initial
  if ([self.allContacts count] > 0  && email !=nil){
    
    //Search for email address
    for (Contact *contact in self.allContacts){
      if ([contact.email isEqualToString:email]){
        emailInvalid = YES; //email was found
        NSLog(@"Email already exists. Please use another email.");
        return emailInvalid;
      }
    }
  }
  
  return emailInvalid;
}

@end
