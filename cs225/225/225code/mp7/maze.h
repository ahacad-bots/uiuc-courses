#ifndef MAZE_H
#define MAZE_H

#include "dsets.h"
#include <iostream>
#include "png.h"
#include <map>
#include <queue>
#include <vector>
class SquareMaze
{
	public:

		SquareMaze();
		void makeMaze (int width,int height);
		bool canTravel ( int x,int y,int dir) const;
		void setWall( int x,int y,int dir, bool exists);
		vector< int > solveMaze ();
		PNG * drawMaze 	() 	const;
		PNG * drawMazeWithSolution ();
	private:
		    vector <int> mazepath;
		int wid;
		int hei;
		DisjointSets cells;
		vector<bool> wallr;
		vector<bool> wallb;
		int exit;
		int getNext( int x, int y, int dir );
};
#endif
