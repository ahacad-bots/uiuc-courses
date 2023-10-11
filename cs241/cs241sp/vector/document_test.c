/**
 * Machine Problem 1
 * CS 241 - Spring 2016
 */

#include "document.h"
#include "stdio.h"
// test your document here
int main()
{
    Document *document = Document_create();
    
    Document_insert_line(document, 0, "Line 0");
    
    Document_insert_line(document, 1, "Line 1");
    
    Document_insert_line(document, 2, "Line 2");
    
    Document_insert_line(document, 3, "Line 3");
    
    Document_insert_line(document, 5, "Line 5");
    
    printf("Document:\n %s\n %s\n %s\n %s\n", Document_get_line(document, 0), Document_get_line(document, 1), Document_get_line(document, 2), Document_get_line(document, 3));
    
    Document_write_to_file(document, "test.txt");
    
    Document_destroy(document);
    
    document = Document_create_from_file("test.txt");
    
    printf("Document:\n %s\n %s\n %s\n %s\n", Document_get_line(document, 0), Document_get_line(document, 1), Document_get_line(document, 2), Document_get_line(document, 3));
}

