/**
 * Machine Problem 1
 * CS 241 - Spring 2016
 */

/* An automatically-expanding array of strings. */
#include "vector.h"
#include <assert.h>
#include <string.h>
#include <stdio.h>

#define INITIAL_CAPACITY 10

void Vector_resize(Vector *vector, size_t new_size);
void Vector_destroy(Vector *vector);

Vector *Vector_create() {
    Vector *this = calloc(1, sizeof(Vector));
    assert(this);
    
    this->array = malloc(sizeof(char *) * INITIAL_CAPACITY);
    this->size = 0;
    this->capacity = INITIAL_CAPACITY;
    
    //if (Vector_resize(this, 10) < 0) {
    //  Vector_destroy(this);
    // return NULL;
    //}
    
    return this;
    // your code here
    //return NULL;
}

void Vector_destroy(Vector *vector) {
    assert(vector);
    for(size_t i = 0; i < vector->size; i++)
    {
        if(vector->array[i] != NULL)
        {
            free(vector->array[i]);
        }
    }
    vector->size = 0;
    vector->capacity = 0;
    free(vector->array);
    free(vector);
    // your code here
}

size_t Vector_size(Vector *vector) {
    assert(vector);
    return vector->size;
    // your code here
    //return 0;
}

void Vector_resize(Vector *vector, size_t new_size) {
    assert(vector);
    assert(new_size >= 0);
    
    if(new_size < vector->size)
    {
        for(size_t i = new_size; i < vector->size; i++)
        {
            free(vector->array[i]);
        }
        vector->size = new_size;
    }
    
    if(new_size > vector->size)
    {
        if(new_size > vector->capacity)
        {
            vector->capacity = (vector->capacity * 2 > new_size) ? vector->capacity * 2 : new_size;
            
            char ** items = realloc(vector->array, vector->capacity * sizeof(char *));
            assert(items);
            
            vector->array = items;
        }
        
        for(size_t i = vector->size; i < new_size; i++)
        {
            vector->array[i] = NULL;
        }
        
        vector->size = new_size;
    }
    
    /*
     void ** items = realloc(vector->array, new_size * sizeof(void*));
     if (!items) {
     return false;
     }
     
     vector->array = items;
     vector->capacity = new_size;
     
     return true;*/
    // your code here
}

void Vector_set(Vector *vector, size_t index, const char *str) {
    assert(vector);
    assert(index < vector->size);
    assert(index >= 0);
    
    char *s = NULL;
    if(str != NULL)
    {
        size_t sl = strlen(str) + 1;
        s = malloc(sizeof(char) * sl);
        strcpy(s, str);
    }
    
    vector->array[index] = s;
    
    
    //assert(vector);
    /*struct vector *clone = vector_create();
     if (!clone) {
     return NULL;
     }
     
     if (clone->capacity < str->size) {
     if (!vector_resize(clone, str->size)) {
     vector_destroy(clone);
     return NULL;
     }
     }
     
     memcpy(clone->array, str->array, str->size * sizeof(void *));
     clone->size = str->size;
     
     if (vector->size == 0 || index > vector->size - 1) {
     return NULL;
     }
     
     clone = vector->array[index];
     vector->array[index] = array;
     return clone;*/
    // your code here
}

const char *Vector_get(Vector *vector, size_t index) {
    assert(vector);
    assert(index < vector->size);
    assert(index >= 0);
    return vector->array[index];
    // your code here
    //return NULL;
}

void Vector_insert(Vector *vector, size_t index, const char *str) {
    assert(vector);
    assert(index >= 0);
    if(index >= vector->size)
    {
        Vector_resize(vector, (index + 1));
    }
    else
    {
        Vector_resize(vector, (vector->size + 1));
    }
    
    size_t size = (vector->size - index) * sizeof(void *);
    memmove(vector->array + index + 1, vector->array + index, size);
    
    char *s = NULL;
    if(str != NULL)
    {
        size_t sl = strlen(str) + 1;
        s = malloc(sizeof(char) * sl);
        strcpy(s, str);
    }
    
    vector->array[index] = s;
    
    // your code here
}

void Vector_delete(Vector *vector, size_t index) {
    assert(vector);
    assert(index < vector->size);
    assert(index >= 0);
    
    free(vector->array[index]);
    vector->array[index] = NULL;
    
    if (index < vector->size - 1) {
        size_t size = (vector->size - index - 1) * sizeof(void *);
        memmove(vector->array + index, vector->array + index + 1, size);
    }
    
    vector->size--;
    
    // your code here, what asserts might you want?
}

void Vector_append(Vector *vector, const char *str) {
    assert(vector);
    Vector_resize(vector, vector->size + 1);
    
    char *s = NULL;
    if(str != NULL)
    {
        size_t sl = strlen(str) + 1;
        s = malloc(sizeof(char) * sl);
        strcpy(s, str);
    }
    
    vector->array[vector->size - 1] = s;
    // your code here
}

