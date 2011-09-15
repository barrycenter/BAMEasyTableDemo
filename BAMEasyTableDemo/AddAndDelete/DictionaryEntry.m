//
//  DictionaryEntry.m
//  BAMEasyTableDemo
//
//  If you use this software in your project, a credit for Barry Murphy
//  and a link to http://barrycenter.com would be appreciated.
//
//  --------------------------------
//  Simplified BSD License (FreeBSD)
//  --------------------------------
//
//  Copyright 2011 Barry Murphy. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without modification, are
//  permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright notice, this list of
//     conditions and the following disclaimer.
//
//  2. Redistributions in binary form must reproduce the above copyright notice, this list
//     of conditions and the following disclaimer in the documentation and/or other materials
//     provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY BARRY MURPHY "AS IS" AND ANY EXPRESS OR IMPLIED
//  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
//  FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL BARRY MURPHY OR
//  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
//  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
//  ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
//  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
//  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//  The views and conclusions contained in the software and documentation are those of the
//  authors and should not be interpreted as representing official policies, either expressed
//  or implied, of Barry Murphy.


#import "DictionaryEntry.h"


@implementation DictionaryEntry

@synthesize term, alsoTerm, lexicalCategory, definition;

- (NSString *)searchString {
    // You can allow searches to match for terms and also terms.
    return [NSString stringWithFormat:@"%@ %@", term, alsoTerm];
    
    // Or you may want to allow searching against definitions, too.
    //return [NSString stringWithFormat:@"%@ %@ %@", term, alsoTerm, definition];
}


#pragma mark - NSCoding Methods

#define DictionaryEntryTerm            @"DictionaryEntryTerm"
#define DictionaryEntryAlsoTerm        @"DictionaryEntryAlsoTerm"
#define DictionaryEntryLexicalCategory @"DictionaryEntryLexicalCategory"
#define DictionaryEntryDefinition      @"DictionaryEntryDefinition"

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:term forKey:DictionaryEntryTerm];
    [encoder encodeObject:alsoTerm forKey:DictionaryEntryAlsoTerm];
    [encoder encodeObject:lexicalCategory forKey:DictionaryEntryLexicalCategory];
    [encoder encodeObject:definition forKey:DictionaryEntryDefinition];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if ((self = [super init])) {
        self.term = [decoder decodeObjectForKey:DictionaryEntryTerm];
        self.alsoTerm = [decoder decodeObjectForKey:DictionaryEntryAlsoTerm];
        self.lexicalCategory = [decoder decodeObjectForKey:DictionaryEntryLexicalCategory];
        self.definition = [decoder decodeObjectForKey:DictionaryEntryDefinition];
    }
    return self;
}


#pragma mark - NSCopying Methods

- (id)copyWithZone:(NSZone *)zone {
    DictionaryEntry *copy = [[[self class] allocWithZone:zone] init];
    
    copy.term = self.term;
    copy.alsoTerm = [self.alsoTerm copy];
    copy.lexicalCategory = [self.lexicalCategory copy];
    copy.definition = [[self.definition copy] autorelease];
    
    return copy;
}

@end
