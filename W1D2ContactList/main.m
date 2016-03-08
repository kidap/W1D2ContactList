//
//  main.m
//  W1D2ContactList
//
//  Created by Karlo Pagtakhan on 03/08/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"
#import "ContactList.h"
#import "InputCollector.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    InputCollector *inputHandler = [[InputCollector alloc] init];
    ContactList *mainContactList = [[ContactList alloc] init];
    NSString *enteredString = [[NSString alloc] init];
    
    while (1 == 1){
      
      //Get the input from the user
      enteredString = [NSString stringWithString: [inputHandler inputForPrompt:@"What would you like do next? [new] - Create a new contact, [list] - List all contacts, [show <#(index) of contact>] Show contact using the index, [find <search>] Find the contact, [quit] - Exit Application \n Enter command: "] ];
      
      //Create Contact
      if ([enteredString isEqualToString:@"new"]){
        NSString *name = [[NSString alloc] init];
        NSString *email = [[NSString alloc] init];
        
        
        //Show current status
        NSLog(@"Creating a new contact.");
        
        //Get the data from the user
        name = [NSString stringWithString: [inputHandler inputForPrompt:@"Enter the name: "] ];
        email = [NSString stringWithString: [inputHandler inputForPrompt:@"Enter the email: "] ];
        
        //Create new instance of Contact
        Contact *newContact = [[Contact alloc] initNewContactWithName:name withEmail:email];
        
        //Add the new instance of contact to the contact list
        [mainContactList addContact:newContact];

      // List
      } else if ([enteredString isEqualToString:@"list"]){
        [mainContactList printContactList];

      // Exit
      } else if ([enteredString isEqualToString:@"quit"]){
        return  0;
        
      // Show
      } else if ([enteredString containsString:@"show"]){
        //Get the index from the entered string
        NSString *indexString =[NSString stringWithString:[enteredString stringByReplacingOccurrencesOfString:@"show" withString:@""] ];
        indexString = [ indexString stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        //Check if only numbers where entered
        if (1 ==1){
          int index = [indexString intValue];
          
          //Show the contact using the index
          [mainContactList showContactUsingIndex:index];
        }
        
      // Find
      } else if ([enteredString containsString:@"find"]){
        
        //Get the name from the entered string
        NSString *nameToSearch =[NSString stringWithString:[enteredString stringByReplacingOccurrencesOfString:@"find" withString:@""] ];
        nameToSearch = [ nameToSearch stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        //Search from the contact
        [mainContactList findContact:nameToSearch];
        
      } else {
        if ([enteredString isEqualToString:@""]){
          //Do nothing if user just presses enter
        } else{
          NSLog(@"Input was not recognized.");
        }
      }
      
    }
    
  }
  return 0;
}
