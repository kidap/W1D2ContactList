//
//  ContactList.h
//  W1D2ContactList
//
//  Created by Karlo Pagtakhan on 03/08/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface ContactList : NSObject

@property(nonatomic) NSMutableArray* allContacts;

-(id) init;
-(void)addContact:(Contact *)newContact;
-(void)printContactList;
-(void)showContactUsingIndex:(int) index;
@end
