/**
 * Ideal Indirection Lab
 * CS 241 - Spring 2016
 */
#include "kernel.h"
#include "mmu.h"

void *ask_kernel_for_frame() { return malloc(sizeof(PageTable)); }
