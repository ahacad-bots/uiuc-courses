#include <vector>
#include "dsets.h"
void DisjointSets::addelements(int num)
{
	int temp = tree.size();
	 tree.resize( temp + num );

    for (int i = temp; i < tree.size(); i++)
    {
        tree[i]=-1;
    }
}

int DisjointSets::find(int elem)
{
    if (tree[elem] < 0) return elem;
    else
    {
        tree[elem] = find( tree[ elem ] );
        return find( tree[ elem ] );
    }
}
void DisjointSets::setunion(int a, int b)
{
    a = find(a);
    b = find(b);
    int m =  tree[a]+ tree[b];
    if (  tree[a] <=  tree[b])
    {
         tree[b] = a;
         tree[a] = m;
    }
    else {
         tree[a] = b;
         tree[b] = m;
    }
}


