/**
 * Ideal Indirection Lab
 * CS 241 - Spring 2016
 */
#include "tlb.h"
TLB *TLB_create() { return calloc(1, sizeof(TLB)); }

void *TLB_get_physical_address(TLB **head, void *key, size_t pid) {
  // If the first node has the value we want then we can just return it
  if ((*head)->key == key && (*head)->pid == pid) {
    return (*head)->value;
  }
  // Using the 'slow pointer and fast pointer' trick for singly linked lists
  // find the correct node and promote it to the head.

  // There are a lot of interesting interview questions that arise from this
  // trick:
  //  * Given a singly linked list and head pointer determine if the list has a
  // cycle
  //  * Given a singly linked list and a head pointer return to me the 'kth'
  // element from the end.
  //  * Given a singly linked list and a head pointer return to me the middle
  // element.
  TLB *slow = *head;
  TLB *fast = (*head)->next;
  while (fast) {
    if (fast->key == key && fast->pid == pid) {
      // We found the correct node
      // Now we need to move it to remove it from the list
      // and promote it to the new head.
      slow->next = fast->next;
      fast->next = *head;
      *head = fast;
      return fast->value;
    }
    fast = fast->next;
    slow = slow->next;
  }
  return NULL;
}

void TLB_add_physical_address(TLB **head, void *key, size_t pid, void *value) {
  size_t num_nodes = 2;
  TLB *slow = *head;
  TLB *fast = (*head)->next;
  // Figure out how many nodes are in the linked list
  while (fast && fast->next) {
    num_nodes++;
    fast = fast->next;
    slow = slow->next;
  }
  if (num_nodes >= MAX_NODES) {
    // Need to evict the least recently used item
    // At this point fast is pointing to the tail
    free(fast);
    slow->next = NULL;
  }
  // Push new item to the head of the linked list
  TLB *new_head = TLB_create();
  new_head->key = key;
  new_head->pid = pid;
  new_head->value = value;
  new_head->next = *head;
  *head = new_head;
}

void TLB_delete(TLB *tlb) {
  if (tlb) {
    TLB_delete(tlb->next);
    free(tlb);
  }
}
