/**
 * @file maptiles.cpp
 * Code for the maptiles function.
 */
	 			
#include <iostream>
#include <map>
#include "maptiles.h"

using namespace std;

MosaicCanvas * mapTiles(SourceImage const & theSource, vector<TileImage> const & theTiles)
{
    /**
     * @todo Implement this function!
     */

     int row = theSource.getRows();
     int column = theSource.getColumns();
     
     MosaicCanvas* ret = new MosaicCanvas(row, column);
      
     vector< Point<3> > colors;
     map<Point<3>, TileImage> theMap;
     
     for (int i = 0; i < theTiles.size(); i++)
    {
        //get average color
        RGBAPixel temp = theTiles.at(i).getAverageColor();
        Point<3> temp1(temp.red, temp.green, temp.blue);
        theMap[temp1] = theTiles.at(i);
        colors.push_back(temp1);
    }
    
    KDTree<3>::KDTree tree(colors);
    
    
    for (int i = 0; i < row; i++)
    {
        for (int j = 0; j < column; j++)
        {
        RGBAPixel temp2 = theSource.getRegionColor(i, j);
        Point<3> temp3(temp2.red, temp2.green, temp2.blue);
        Point<3> closestPoint = tree.findNearestNeighbor(temp3);
        TileImage pic = theMap[closestPoint];
        ret->setTile(i,j,pic);
        }
     }
     
     
	return ret;
}

