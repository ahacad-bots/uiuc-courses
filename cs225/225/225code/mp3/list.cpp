/**
 * @file list.cpp
 * Doubly Linked List (MP 3).
 *
 * @author Chase Geigle
 * @date (created) Fall 2011
 * @date (modified) Spring 2012, Fall 2012
 *
 * @author Jack Toole
 * @date (modified) Fall 2011
 */

/**
 * Destroys the current List. This function should ensure that
 * memory does not leak on destruction of a list.
 */
#include <iostream>
using namespace std;
template <class T>
List<T>::~List()
{
    /// @todo Graded in MP3.1
	clear();
}

/**
 * Destroys all dynamically allocated memory associated with the current
 * List class.
 */
template <class T>
void List<T>::clear()
{
    /// @todo Graded in MP3.1
	ListNode* temp = head;
	 while (temp != NULL)
   {
      head = head->next;
      delete temp;
      temp = head;
   }

   head = NULL;
   tail = NULL;
   length = 0;
}

/**
 * Inserts a new node at the front of the List.
 * This function **SHOULD** create a new ListNode.
 *
 * @param ndata The data to be inserted.
 */
template <class T>
void List<T>::insertFront(T const & ndata)
{
    /// @todo Graded in MP3.1
	 ListNode* temp;
   temp = new ListNode(ndata);
if (length == 0)
   {
      head = temp;
      tail = temp;
	length++;
   }
else
        {
        temp->next = head;
	temp->prev = NULL;
	head->prev = temp;
	head=temp;
	length++;
	}
}

/**
 * Inserts a new node at the back of the List.
 * This function **SHOULD** create a new ListNode.
 *
 * @param ndata The data to be inserted.
 */
template <class T>
void List<T>::insertBack( const T & ndata )
{
    /// @todo Graded in MP3.1
	ListNode* temp;
   temp = new ListNode(ndata);
if (length == 0)
   {
      head = temp;
      tail = temp;
      length++;
   }
else	{
	temp->next = NULL;
	temp->prev = tail;
	tail->next = temp;
	tail = temp;
	length++;
	}
	

}


/**
 * Reverses the current List.
 */
template <class T>
void List<T>::reverse()
{
    reverse(head, tail);
}

/**
 * Helper function to reverse a sequence of linked memory inside a List,
 * starting at startPoint and ending at endPoint. You are responsible for
 * updating startPoint and endPoint to point to the new starting and ending
 * points of the rearranged sequence of linked memory in question.
 *
 * @param startPoint A pointer reference to the first node in the sequence
 *  to be reversed.
 * @param endPoint A pointer reference to the last node in the sequence to
 *  be reversed.
 */
template <class T>
void List<T>::reverse( ListNode * & startPoint, ListNode * & endPoint )
{
    /// @todo Graded in MP3.1
	 if(startPoint == NULL || startPoint == endPoint)
        return;
	ListNode * startprev = startPoint -> prev;
	ListNode * endnext = endPoint -> next;
        
	if (startPoint->prev != NULL)
        {
                startprev -> next = endPoint;
        }
        if (endPoint->next != NULL)
        {
                endnext -> prev = startPoint;
        }
	ListNode* p = startPoint;
        ListNode* temp = startPoint;
        //treversal 
    while(p != endPoint)
        {	
		temp = temp -> next;
                p -> next = p->prev;
                p -> prev = temp;
                p = temp;
        }
		endPoint->next = endPoint->prev;
		endPoint->prev = startprev;
		startPoint ->next = endnext;
	temp = startPoint;
        startPoint = endPoint;
        endPoint = temp;
	if (startPoint->prev == NULL)
        {
               head = startPoint;
        }
        if (endPoint->next == NULL)
        {
                tail = endPoint;
        }
	temp=NULL;
	p=NULL;
}



/**
 * Reverses blocks of size n in the current List. You should use your
 * reverse( ListNode * &, ListNode * & ) helper function in this method!
 *
 * @param n The size of the blocks in the List to be reversed.
 */
template <class T>
void List<T>::reverseNth( int n )
{
    /// @todo Graded in MP3.1
if(head == NULL ||tail == NULL|| n<=0 || n==1 )
	return;
	if(n >= length)
    {
        reverse(head,tail);
        return;
    }			
			ListNode* temp = head;
			ListNode* temp1;
			int count = length;
			//what if not reach whole length
		while(count >=n)
	{
		temp1 = temp;
		for(int i=0; i<n-1;i++)
		temp1=temp1->next;
		reverse(temp,temp1);
		temp = temp1->next;
		count = count-n;
	}
		//after all N block are runed 
		if(temp!=NULL)
		reverse(temp,tail);
	tail = temp;
}


/**
 * Modifies the List using the waterfall algorithm.
 * Every other node (starting from the second one) is removed from the
 * List, but appended at the back, becoming the new tail. This continues
 * until the next thing to be removed is either the tail (**not necessarily
 * the original tail!**) or NULL.  You may **NOT** allocate new ListNodes.
 * Note that since the tail should be continuously updated, some nodes will
 * be moved more than once.
 */
template <class T>
void List<T>::waterfall()
{
    /// @todo Graded in MP3.1
	if(head == NULL || tail==NULL ||length==1)
	return;
	ListNode* temp = head;
	ListNode* temp2 = temp->next;
	for(int i=0;i<length-2;i++)
	{temp2->next->prev=temp;
	temp->next=temp2->next;
	temp2->next=NULL;
	temp2->prev=tail;
	tail->next=temp2;
	tail=temp2;
	temp=temp->next;
	temp2=temp->next;
	}
	
}

/**
 * Splits the given list into two parts by dividing it at the splitPoint.
 *
 * @param splitPoint Point at which the list should be split into two.
 * @return The second list created from the split.
 */
template <class T>
List<T> List<T>::split(int splitPoint)
{
    if (splitPoint > length)
        return List<T>();

    if (splitPoint < 0)
        splitPoint = 0;

    ListNode * secondHead = split(head, splitPoint);

    int oldLength = length;
    if (secondHead == head)
    {
        // current list is going to be empty
        head = NULL;
        tail = NULL;
        length = 0;
    }
    else
    {
        // set up current list
        tail = head;
        while (tail->next != NULL)
            tail = tail->next;
        length = splitPoint;
    }

    // set up the returned list
    List<T> ret;
    ret.head = secondHead;
    ret.tail = secondHead;
    if (ret.tail != NULL)
    {
        while (ret.tail->next != NULL)
            ret.tail = ret.tail->next;
    }
    ret.length = oldLength - splitPoint;
    return ret;
}

/**
 * Helper function to split a sequence of linked memory at the node
 * splitPoint steps **after** start. In other words, it should disconnect
 * the sequence of linked memory after the given number of nodes, and
 * return a pointer to the starting node of the new sequence of linked
 * memory.
 *
 * This function **SHOULD NOT** create **ANY** new List objects!
 *
 * @param start The node to start from.
 * @param splitPoint The number of steps to walk before splitting.
 * @return The starting node of the sequence that was split off.
 */
template <class T>
typename List<T>::ListNode * List<T>::split(ListNode * start, int splitPoint)
{
    /// @todo Graded in MP3.2
	if(head == NULL || tail==NULL )
	return NULL;
	if(splitPoint>length)
	return head;
	if (splitPoint < 0)
        splitPoint = 0;
	ListNode* temp = start;
	for(int i=0; i<splitPoint;i++)
	{
		temp = temp->next;
	}
	temp->prev->next=NULL;
	temp->prev=NULL;
	return temp;
     // change me!
}

/**
 * Merges the given sorted list into the current sorted list.
 *
 * @param otherList List to be merged into the current list.
 */
template <class T>
void List<T>::mergeWith(List<T> & otherList)
{
    // set up the current list
    head = merge(head, otherList.head);
    tail = head;

    // make sure there is a node in the new list
    if(tail != NULL)
    {
        while (tail->next != NULL)
            tail = tail->next;
    }
    length = length + otherList.length;

    // empty out the parameter list
    otherList.head = NULL;
    otherList.tail = NULL;
    otherList.length = 0;
}

/**
 * Helper function to merge two **sorted** and **independent** sequences of
 * linked memory. The result should be a single sequence that is itself
 * sorted.
 *
 * This function **SHOULD NOT** create **ANY** new List objects.
 *
 * @param first The starting node of the first sequence.
 * @param second The starting node of the second sequence.
 * @return The starting node of the resulting, sorted sequence.
 */
template <class T>
typename List<T>::ListNode * List<T>::merge(ListNode * first, ListNode * second)
{
    /// @todo Graded in MP3.2
	if(first==NULL&&second==NULL)
	return NULL;
	if(first==NULL&&second!=NULL)
	return second;
	if(first!=NULL&&second==NULL)
	return first;
	ListNode* p1 = first;
	ListNode* p2 = second;
	ListNode* temp;
	ListNode* start;
	if(p1->data<p2->data)
	{start=p1;p1=p1->next;}
	else 
	{start=p2;p2=p2->next;}
	temp=start;
	while(p1!=NULL&&p2!=NULL){
	if (p1->data < p2->data)
	{
	temp->next = p1;
	p1->prev=temp;
	temp = p1;
	p1 = p1->next;
	}
	else
	{
	temp->next = p2;
	p2->prev=temp;
	temp = p2;
	p2 = p2->next;
	}
	}
	while(p2!=NULL)
	{temp->next=p2;p2->prev=temp;temp=p2;
	p2=p2->next;}
	while(p1!=NULL)
	{temp->next=p1;p1->prev=temp;temp=p1;
	p1=p1->next;}
	return start; // change me!
}

/**
 * Sorts the current list by applying the Mergesort algorithm.
 */
template <class T>
void List<T>::sort()
{
    if (empty())
        return;
    head = mergesort(head, length);
    tail = head;
    while (tail->next != NULL)
        tail = tail->next;
}

/**
 * Sorts a chain of linked memory given a start node and a size.
 * This is the recursive helper for the Mergesort algorithm (i.e., this is
 * the divide-and-conquer step).
 *
 * @param start Starting point of the chain.
 * @param chainLength Size of the chain to be sorted.
 * @return A pointer to the beginning of the now sorted chain.
 */
template <class T>
typename List<T>::ListNode * List<T>::mergesort(ListNode * start, int chainLength)
{
    /// @todo Graded in MP3.2
	if(chainLength==1)
	return start;
		if(chainLength ==0)
		return NULL;
	int middle = chainLength/2;
	ListNode* other = split(start, middle);
	ListNode* n1 =mergesort(start, middle);
	ListNode* n2 = mergesort (other, chainLength-middle);;
	return merge(n1,n2); // change me!
}
