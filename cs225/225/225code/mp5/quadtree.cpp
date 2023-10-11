// **************************************************************
// *		   
// *  quadtree.cpp
// *		   
// *  Quadtree class
// *		   
// *  CS 225 Spring 2008
// *		   
// **************************************************************

#include "quadtree.h"
using namespace std;
Quadtree::Quadtree()
{
	root = NULL;//null tree
}
Quadtree::Quadtree (const PNG & source,int resolution)
{
	 
    buildTree(source, resolution);
//call buildTree for consturct
}
Quadtree::Quadtree ( Quadtree const & other) 
{
	  if (other.root == NULL)
    	{
        	root = NULL;
        	return;
    	}
    	root = duplicate(other.root);//call copy helper function
}
//destructor
Quadtree::~Quadtree()
{
    clear(root);
}
Quadtree const & Quadtree::operator= (Quadtree const & other)
{
	if (root == other.root)
        return *this;

    	//clear self
   	 clear(root);
    	//copy other
    	root = duplicate(other.root);
    	return *this;
}


void Quadtree::buildTree ( PNG const &  source, int resolution)
{
	 root = new QuadtreeNode(0,0,resolution);

    buildTreeHelper (source, resolution, root);
}
void Quadtree::buildTreeHelper (PNG const & source, int resolution, QuadtreeNode *subRoot)
{
    //base case
    if (resolution ==1)
    {
        subRoot->element = *(source(subRoot->x,subRoot->y));
        subRoot->res=1;
        return;
    }
    
    subRoot->nwChild = new QuadtreeNode(subRoot->x, subRoot->y, resolution/2);
    subRoot->neChild = new QuadtreeNode(subRoot->x + resolution/2, subRoot->y, resolution/2);
    subRoot->swChild = new QuadtreeNode(subRoot->x, subRoot->y + resolution/2, resolution/2);
    subRoot->seChild = new QuadtreeNode(subRoot->x + resolution/2, subRoot->y + resolution/2, resolution/2);
    buildTreeHelper(source, resolution/2, subRoot->nwChild);
    buildTreeHelper(source, resolution/2, subRoot->neChild);
    buildTreeHelper(source, resolution/2, subRoot->swChild);
    buildTreeHelper(source, resolution/2, subRoot->seChild);
    subRoot->element.red = (subRoot->nwChild->element.red + subRoot->neChild->element.red + subRoot->swChild->element.red + subRoot->seChild->element.red)/4;
    subRoot->element.green = (subRoot->nwChild->element.green + subRoot->neChild->element.green + subRoot->swChild->element.green + subRoot->seChild->element.green)/4;
    subRoot->element.blue = (subRoot->nwChild->element.blue + subRoot->neChild->element.blue + subRoot->swChild->element.blue + subRoot->seChild->element.blue)/4;
}


//clean helper function
void Quadtree::clear( QuadtreeNode * & subRoot)
{
	if ( subRoot == NULL )
        return;
    
    // clear all other nodes
    	clear(subRoot->nwChild);
    	clear(subRoot->neChild);
    	clear(subRoot->swChild);
    	clear(subRoot->seChild);
    // delete 
    	delete subRoot;
    	subRoot = NULL;
}
//copy helper function
Quadtree::QuadtreeNode * Quadtree::duplicate( QuadtreeNode *otherRoot)
{
    if (otherRoot == NULL)
        return NULL;
    QuadtreeNode *newNode = new QuadtreeNode(otherRoot);
    newNode->nwChild = duplicate(otherRoot->nwChild);
    newNode->neChild = duplicate(otherRoot->neChild);
    newNode->swChild = duplicate(otherRoot->swChild);
    newNode->seChild = duplicate(otherRoot->seChild);
    return newNode;
}
RGBAPixel Quadtree::getPixel 	( int  	x,int  	y ) const
{
return getPix(x,y,root);
}
RGBAPixel Quadtree::getPix(int x, int y, QuadtreeNode *subRoot) const
{
    if ((subRoot->x == x && subRoot->y == y&& subRoot->res == 1) || (subRoot->nwChild == NULL))
        return subRoot->element;
    if ((x >= (subRoot->nwChild)->x && x< ((subRoot->nwChild)->x+(subRoot->nwChild)->res))&& (y >= (subRoot->nwChild)->y && y < ((subRoot->nwChild)->y+(subRoot->nwChild)->res)))
    {
        return getPix(x,y,subRoot->nwChild);

    } 
	else if ((x >= (subRoot->neChild)->x && x< ((subRoot->neChild)->x+(subRoot->neChild)->res))&& (y >= (subRoot->neChild)->y && y < ((subRoot->neChild)->y+(subRoot->neChild)->res)))
    {
        return getPix(x,y,subRoot->neChild);

    } 
	else if ((x >= (subRoot->swChild)->x && x< ((subRoot->swChild)->x+(subRoot->swChild)->res))&& (y >= (subRoot->swChild)->y && y < ((subRoot->swChild)->y+(subRoot->swChild)->res)))
    {
        return getPix(x,y,subRoot->swChild);

    } 
	else
    {
        return getPix(x,y,subRoot->seChild);
    }
}


PNG Quadtree::decompress () const
{
    if (root == NULL)
        return *(new PNG());
   int resolution = root->res;
    PNG temp(resolution, resolution);
	decompresshelper( root, temp);
    return temp;
}
void Quadtree::decompresshelper( QuadtreeNode *subRoot, PNG & source)const
{
	if(subRoot->nwChild==NULL)
	{
	int i = subRoot->x;
	int j = subRoot->y;
	int sizei = i+subRoot->res;
	int sizej = j+subRoot->res;
	for(int m=i; m<sizei; m++)
	{
	for(int n=j; n<sizej; n++)
	{
	(source(m,n))->red=subRoot->element.red;
	(source(m,n))->green=subRoot->element.green;
	(source(m,n))->blue=subRoot->element.blue;
	}
	}
	return;
	}
	decompresshelper(subRoot->nwChild, source);
	decompresshelper(subRoot->neChild, source);
	decompresshelper(subRoot->swChild, source);
	decompresshelper(subRoot->seChild, source);

}
void Quadtree::clockwiseRotate 	() 
{
	 clockwiseR(root); 
}	
void Quadtree::clockwiseR(QuadtreeNode * subRoot)
{
	if(subRoot==NULL)
	return;
	if(subRoot->nwChild==NULL)
	return;
	QuadtreeNode *temp;
	temp = subRoot->nwChild;
	subRoot->nwChild = subRoot->swChild;
	subRoot->swChild = subRoot->seChild;
	subRoot->seChild = subRoot->neChild;
	subRoot->neChild = temp;
		subRoot->nwChild->x = subRoot->x;
    	subRoot->nwChild->y = subRoot->y;

   		subRoot->neChild->x = subRoot->x + subRoot->res/2;
    	subRoot->neChild->y = subRoot->y;
    
    	subRoot->swChild->x = subRoot->x;
    	subRoot->swChild->y = subRoot->y + subRoot->res/2;
    
    	subRoot->seChild->x = subRoot->x + subRoot->res/2;
    	subRoot->seChild->y = subRoot->y + subRoot->res/2;

    clockwiseR(subRoot->nwChild);
    clockwiseR(subRoot->neChild);
    clockwiseR(subRoot->swChild);
    clockwiseR(subRoot->seChild);
		
}
void Quadtree::prune ( int  tolerance)
{
	if(root==NULL)
	return;
	prune(tolerance, root);
}
void Quadtree::prune (int  tolerance, QuadtreeNode * subRoot)
{
	 if (subRoot->nwChild == NULL)
        return;
         if (inTolR(subRoot, subRoot, tolerance))
    {
        //prune
        clear(subRoot->nwChild);
        clear(subRoot->neChild);
        clear(subRoot->swChild);
        clear(subRoot->seChild);
        return;
    }
    
    prune(tolerance,subRoot->nwChild);
    prune(tolerance,subRoot->neChild);
    prune(tolerance,subRoot->swChild);
    prune(tolerance,subRoot->seChild);

}
//calculate distance
int Quadtree::calcdifference(QuadtreeNode * subRoot1, QuadtreeNode * subRoot2)const
{
	int r = (subRoot2->element.red-subRoot1->element.red);
	int g = (subRoot2->element.green-subRoot1->element.green);
	int b = (subRoot2->element.blue-subRoot1->element.blue);
	return r*r+g*g+b*b;
}
//if distance <= tolerance
bool Quadtree::inTol(QuadtreeNode * subRoot1, QuadtreeNode * subRoot2, int tolerance)const
{
	return calcdifference(subRoot1, subRoot2)<=tolerance;
}
//recursive version of inTol
bool Quadtree::inTolR(QuadtreeNode * subRoot1, QuadtreeNode * subRoot2, int tolerance)const
{
	if (subRoot1->nwChild == NULL)
    {
        return inTol(subRoot1, subRoot2, tolerance);
    }
    return inTolR(subRoot1->nwChild, subRoot2, tolerance)&&inTolR(subRoot1->neChild, subRoot2, tolerance)&&inTolR(subRoot1->swChild, subRoot2, tolerance)&&inTolR(subRoot1->seChild, subRoot2, tolerance);
}

int Quadtree::pruneSize ( int  	tolerance) const
{
 return pruneSize(tolerance, root);
}
int Quadtree::pruneSize ( int  	tolerance, QuadtreeNode * subRoot ) const	
{
		if(subRoot==NULL)
		return 0;
		if(subRoot->nwChild == NULL||inTolR(subRoot, subRoot, tolerance)){
		return 1;}
		return pruneSize(tolerance, subRoot->nwChild) + pruneSize(tolerance, subRoot->neChild) + pruneSize(tolerance, subRoot->swChild) + pruneSize(tolerance, subRoot->seChild);
}


int Quadtree::idealPrune (int  	numLeaves) const
{

return  idealPrune(numLeaves, 0, 255*255*255, (255*255*255)/2);
   
} 	

int Quadtree::idealPrune (int  	numLeaves, int low, int high, int m) const
{
  if (pruneSize(m) == numLeaves)
    {
        while (pruneSize(m) == numLeaves)
            m--;
        return m+1;
    }
    if (pruneSize(m) < numLeaves)
    {
        return idealPrune(numLeaves, low, m, int((low+m)/2));
    }
    else
    {
        return idealPrune(numLeaves, m,high, int((m+high)/2));
    }
}
