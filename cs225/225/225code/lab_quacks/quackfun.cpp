/**
 * @file quackfun.cpp
 * This is where you will implement the required functions for the
 *  stacks and queues portion of the lab.
 */

/**
 * Sums items in a stack.
 * @param s A stack holding values to sum.
 * @return The sum of all the elements in the stack, leaving the original
 *  stack in the same state (unchanged).
 *
 * @note You may modify the stack as long as you restore it to its original
 *  values.
 * @note You may use only two local variables of type T in your function.
 *  Note that this function is templatized on the stack's type, so stacks of
 *  objects overloading the + operator can be summed.
 * @note We are using the Standard Template Library (STL) stack in this
 *  problem. Its pop function works a bit differently from the stack we
 *  built. Try searching for "stl stack" to learn how to use it.
 * @hint Think recursively!
 */
template <typename T>
T QuackFun::sum(stack<T> & s)
{
    // Your code here
	T summing, topping;
	if(!s.empty())
	{
	topping =s.top();
	s.pop();
	summing = topping + sum(s);
	s.push(topping);
	return summing;}
	else return 0;}
	
	 // stub return value (0 for primitive types). Change this!
                // Note: T() is the default value for objects, and 0 for
                // primitive types


/**
 * Reverses even sized blocks of items in the queue. Blocks start at size
 * one and increase for each subsequent block.
 * @param q A queue of items to be scrambled
 *
 * @note Any "leftover" numbers should be handled as if their block was complete.
 * @note We are using the Standard Template Library (STL) queue in this
 *  problem. Its pop function works a bit differently from the stack we
 *  built. Try searching for "stl stack" to learn how to use it.
 * @hint You'll want to make a local stack variable.
 */
template <typename T>
void QuackFun::scramble(queue<T> & q)
{
	if(q.empty())
	return ;
    stack<T> s;// for reverse
    queue<T> q2;// for not change
	int reverse =0;// remember where are we now
	int size = q.size();//the number of size of quene, keep changing
	while(size>reverse)
	{
	if(reverse %2 !=0)
	{
	for(int i=0;i<reverse;i++)//not change
	{
	q2.push(q.front());
	q.pop();
	}
	for(int i=0;i<reverse;i++)
	{
	q.push(q2.front());
	q2.pop();
	}
	}
	else 
	{
	for(int i=0;i<reverse;i++)//reverse
	{
	s.push(q.front());
	q.pop();
	}
	for(int i=0;i<reverse;i++)
	{
	q.push(s.top());
	s.pop();
	}
	}
	size-=reverse;
	reverse++;//change number of times 
	}
	if(reverse %2 !=0)
	{
	for(int i=0;i<size;i++)
	{
	q2.push(q.front());
	q.pop();
	}
	for(int i=0;i<size;i++)
	{
	q.push(q2.front());
	q2.pop();
	}
	}
	else 
	{
	for(int i=0;i<size;i++)
	{
	s.push(q.front());
	q.pop();
	}
	for(int i=0;i<size;i++)
	{
	q.push(s.top());
	s.pop();
	}
	}
    // Your code here
}

/**
 * @return true if the parameter stack and queue contain only elements of exactly
 *  the same values in exactly the same order; false, otherwise.
 *
 * @note You may assume the stack and queue contain the same number of items!
 * @note There are restrictions for writing this function.
 * - Your function may not use any loops
 * - In your function you may only declare ONE local boolean variable to use in your return statement,
 *      and you may only declare TWO local variables of parametrized type T to use however you wish.
 *   No other local variables can be used.
 * - After execution of verifySame, the stack and queue must be unchanged. Be sure to comment your code VERY well.
 */
template <typename T>
bool QuackFun::verifySame(stack<T> & s, queue<T> & q)
{
    bool retval = true; // optional
    T s1; // rename me
    T q1; // rename :)
    	s1=s.top();
	q1=q.back();
	retval =(s1==q1);
    return retval;
}

