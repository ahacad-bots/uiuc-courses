/**
 * @file kdtree.cpp
 * Implementation of KDTree class.
 */

#include "math.h"
template<int Dim>
bool KDTree<Dim>::smallerDimVal(const Point<Dim> & first, const Point<Dim> & second, int curDim) const
{
    /**
     * @todo Implement this function!
     */
     	bool ret=false;
        if (first[curDim] == second[curDim])
        ret = (first < second);
        else
    	{ret = (first[curDim] < second[curDim]);
    	}
		return ret;
}


template<int Dim>
bool KDTree<Dim>::shouldReplace(const Point<Dim> & target, const Point<Dim> & currentBest, const Point<Dim> & potential) const
{
    /**
     * @todo Implement this function!
     */
     int d1 =0;//curr
     int d2 =0;//pot
     //calculate distance for d1 and d2
     for (int i = 0; i < Dim; i++)
    {
        d1+= pow(target[i]-currentBest[i],2);
        d2+= pow(target[i]-potential[i],2);
    }
    if (d1 == d2)
        return potential < currentBest;
    return d2 < d1;

}

template<int Dim>
KDTree<Dim>::KDTree(const vector< Point<Dim> > & newPoints)
{
    /**
     * @todo Implement this function!
     */
    points = newPoints;
    if (points.size()!=0)
        buildTree(0, newPoints.size()-1, 0); 
}
template<int Dim>
void KDTree<Dim>::buildTree(int lower, int upper, int dim)
{
		//base case
	if(lower==upper)
        return;
        int median = (lower+upper)/2;
        partition(lower, upper, dim, median);
        //newdim
        int dim2 = dim+1;
    if(dim2>=Dim)
        dim2=dim2-Dim;
        //recursively build
	if (lower < median)
        buildTree(lower , median-1, dim2);
    if (upper > median)
        buildTree(median+1, upper, dim2);
}

template<int Dim>
void KDTree<Dim>::partition(int lower, int upper, int curDim, int k)
{
    //travel all subtree
    while(lower != upper)
    {
        Point<Dim> temp = points[k];
    	Point<Dim> temp1 = points[upper];
    	points[upper] = points[k];
    	points[k] = temp1;
    	int storeIndex = lower;
    	for (int i = lower; i < upper; i++)//sort the whole tree
    {
        if (smallerDimVal(points[i], temp, curDim) || points[i] == temp)
        {
            temp1 = points[storeIndex];
            points[storeIndex] = points[i];
            points[i] = temp1;
            storeIndex++;
        }
    }//now the tree is sorted
    	temp1 = points[upper];
    	points[upper] = points[storeIndex];
    	points[storeIndex] = temp1;
    
        if (storeIndex == k)
            return ;
        else if (k < storeIndex)
            upper = storeIndex-1;
        else
        {
            lower = storeIndex+1;
        }
    }
}


template<int Dim>
Point<Dim> KDTree<Dim>::findNearestNeighbor(const Point<Dim> & query) const
{
    /**
     * @todo Implement this function!
     */
     Point<Dim> ret= walkThrough(query, points[(points.size()-1)/2], 0, points.size()-1, 0);
   return ret;
}
//findhelper
template<int Dim>
Point<Dim> KDTree<Dim>::walkThrough(const Point<Dim> &target, const Point<Dim> &ret, int lower, int upper, int curDim) const
{
//base case
		if (lower == upper)
    {
        if (shouldReplace(target, ret, points[lower]))
        {
            
            return points[lower];
        }
        return ret;
    }
// other
	int median = (lower + upper)/2;
	Point<Dim> ret2 = ret;
//a recording for which side are we going
	int side = 0;//0:left, 1:right
	if (smallerDimVal(points[median], target, curDim)&&upper>median)
	//why do we have to check upper>median?
		{
		int dim2 = curDim+1;
		if(dim2>=Dim)
        dim2=dim2-Dim;
        ret2 = walkThrough(target, ret, median+1, upper, dim2);
        side=1;
		}
	if (smallerDimVal(target, points[median], curDim)&&lower<median)
		{
		int dim2 = curDim+1;
		if(dim2>=Dim)
        dim2=dim2-Dim;
        ret2 = walkThrough(target, ret, lower, median-1, dim2);
        side=0;
        }
    //Check if current node is closer than obtained above
    if (shouldReplace(target, ret2, points[median]))
        ret2 = points[median];
    //prepare to check the other side
    	Point<Dim> m = points[median];//don't understand why can't point[median][Dim]
    	int distance=0;//distance we have now
    	for(int i=0; i< Dim; i++)
    	distance+= pow(target[i]-ret2[i],2);
    if(pow(m[curDim]-target[curDim],2)<=distance)
    {
    	int dim2 = curDim+1;
		if(dim2>=Dim)
        dim2=dim2-Dim;
   
    if(side==0&&upper>median)//left has been checked, goto right
    ret2 = walkThrough(target, ret2, median+1, upper, dim2 );
    if(side==1&&lower<median)//goto left
    ret2 = walkThrough(target, ret2, lower, median-1, dim2 );
    }
	return ret2;
}
	









