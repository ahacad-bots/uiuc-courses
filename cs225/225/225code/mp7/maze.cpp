#include "maze.h"
#include <vector>
#include "dsets.h"
#include <time.h>
using namespace std;

SquareMaze::SquareMaze()
{
    wid = 0;
    hei = 0;
    cells = DisjointSets();
    exit = 0;
}
void SquareMaze::makeMaze (int width,int height)
{
	
	if (width < 2 || height < 2) 
        return;
	wid = width;
	hei = height;
	cells.addelements(wid*hei);
	wallr = vector<bool> (wid*hei, true);
    wallb = vector<bool> (wid*hei, true);
    vector< pair< pair<int, int>, int > >  walls;
    for (int i = 0; i < wid; i++)
    {
        for (int j = 0; j < hei; j++)
        {
            pair< int, int > point (i, j);
            pair< pair< int, int > , int> wallRight ( point, 0);
            pair< pair< int, int > , int> wallBottom ( point, 1);

            walls.push_back(wallRight);
            walls.push_back(wallBottom);
        }
    }
     srand((unsigned)time( NULL ) );
    while (walls.size() != 1)
    {
       
        int m= rand() % walls.size();
        pair < pair< int, int > , int > wall = walls[m];
        walls[m] = walls[walls.size()-1];
        walls.pop_back();
        pair < int, int > point = wall.first;
        int dir = wall.second;
        int x = point.first;
        int y = point.second;
        int temp1 = y * wid + x;
        
          if (dir)
        {
            if ( temp1 + width >= wid*hei)
                continue;
            if ( cells.find( temp1 ) == cells.find( temp1 + width ) )
                continue;
            cells.setunion( temp1, temp1 + width );
            wallb[temp1] = false;
        }
        else
        {
            if ( ( (temp1 + 1) % width) == 0 )
                continue;

            if ( cells.find(temp1) == cells.find( temp1 + 1 ) )
                continue;
            cells.setunion( temp1, temp1 +1);
            wallr[temp1] = false;
        }
     }
}
bool SquareMaze::canTravel(int x, int y, int dir) const
{
 if ( x < 0 || y < 0 || x > wid || y > hei||( x == 0 && dir == 2 ) ||
  ( y == 0 && dir == 3 ) || ( y == hei -1 && dir == 1 ) || ( x == wid -1 && dir == 0 ) )
        return false;


if(dir==3)
return !(wallb[(y-1) * wid + x]);
if(dir==2)
return !(wallr[y * wid + (x-1)]);
if(dir==1)
return !(wallb[y * wid + x]);
if(dir==0)
return !(wallr[y * wid + x]);

            return false;

}

void SquareMaze::setWall (int x, int y, int dir, bool exists)
{
    if (dir )
        wallb[y * wid + x] = exists;
    else
        wallr[y * wid + x] = exists;
}
vector <int> SquareMaze::solveMaze()
{
	map <int, int> pathMap;
    bool visited [wid][hei];
     for (int i = 0; i < wid; i++ )
    {
        for (int j = 0; j < hei; j++ )
        {
            visited[i][j] = false;
        }
    }
    queue <int > q;
    q.push(0);
    visited[0][0] = true;
     while (!q.empty())
    {
     	int curCell = q.front();
        int mx = curCell%wid;
        int my = curCell/wid;
    	 q.pop();
         for (int i = 0; i < 4; i++)
        {
         int nextCell = getNext( mx, my, i );
            int nx = nextCell%wid;
            int ny = nextCell/wid;
    if (canTravel( mx, my, i) && !visited[ nx ][ ny ] )
		{
      q.push( nextCell );
      visited[ nx ][ ny ] = true;
      pathMap[nextCell] = curCell;
        }
  		}
    }
     int path = 0;
    int endnum = 0;
    for (int i = 0; i < wid; i++)
    {
        int summ = 0;
        int end = (hei-1) * wid + i;
        int start = 0;

        while (end != start)
        {
            end = pathMap[end];
            summ++;
        }

        if (summ > path)
        {
            path = summ;
            endnum = i;
        }
    }
  exit = (hei-1) * wid + endnum;
  int start = 0;

  while (exit != start)
    {
  	int diff = exit- pathMap[exit];
  	  std::vector<int>::iterator it;
      it = mazepath.begin();
  	 if (diff == 1)
             mazepath.insert(it,0);
        else if (diff == -1)
             mazepath.insert(it,2);
        else if (diff == wid)
             mazepath.insert(it,1);
        else if (diff == (-1) * wid) 
             mazepath.insert(it,3);
        exit = pathMap[exit];
  	
    }

    return mazepath;
    
    
}
int SquareMaze::getNext( int x, int y, int dir )
{
     if(dir==0)
            return y * wid + x + 1;
	 if(dir==1)
            return y * wid + x + wid;
     if(dir==2)
            return y * wid + x - 1;
            return y * wid + x - wid;
}
PNG * SquareMaze::drawMaze() const
{
    PNG * mazepic = new PNG( 10 * wid + 1, 10 * hei +1);

    for ( int i = 10; i < mazepic->width(); i++)
    {
        (*mazepic)(i, 0)->red = 0;
        (*mazepic)(i, 0)->green = 0;
        (*mazepic)(i, 0)->blue = 0;
    }

    for (int i = 0; i < mazepic->height(); i++ )
    {
        (*mazepic)(0, i)->red = 0;
        (*mazepic)(0, i)->green = 0;
        (*mazepic)(0, i)->blue = 0;
    }

    int mx;
    int my;

    for ( int x = 0; x < wid; x++ )
    {
        for (int y = 0; y < hei; y++ )
        {
            if (wallb[ y * wid + x ] )
            {
                for (int i = 0; i <11; i++ )
                {
                    mx = x * 10 + i;
                    my = ( y + 1 ) * 10;

                    (*mazepic)(mx, my)->red = 0;
                    (*mazepic)(mx, my)->green = 0;
                    (*mazepic)(mx, my)->blue = 0;
                }
            }

            if ( wallr[ y * wid + x ] )
            {
                for (int i = 0; i <11; i++)
                {
                    mx = (x + 1) * 10;
                    my = y * 10 + i;

                    (*mazepic)(mx, my)->red = 0;
                    (*mazepic)(mx, my)->green = 0;
                    (*mazepic)(mx, my)->blue = 0;
                }
            }
        }
    }

    return mazepic;
}
PNG * SquareMaze::drawMazeWithSolution()
{
PNG * mazepic = drawMaze();
 	int mx = 5;
    int my = 5;

    for ( int i= 0; i < mazepath.size(); i++)
    {
        if ( mazepath[i] == 0 )
        {
            for (int j = 0; j <11; j++ )
            {
                (*mazepic)( mx + j, my )->red = 255;
                (*mazepic)( mx + j, my )->blue = 0;
                (*mazepic)( mx + j, my )->green = 0;
            }
            mx += 10;
        }
                else if ( mazepath [i] == 1)
        {
            for (int j = 0; j <11; j++)
            {
                (*mazepic)( mx, my + j)->red = 255;
                (*mazepic)( mx, my + j)->blue = 0;
                (*mazepic)( mx, my + j)->green = 0;
            }
            my += 10;
        }
        else if ( mazepath [i] == 2)
        {
            for (int j = 0; j <11; j++)
            {
                (*mazepic)( mx - j, my )->red = 255;
                (*mazepic)( mx - j, my )->blue = 0;
                (*mazepic)( mx - j, my )->green = 0;
            }
            mx -= 10;
        }
        else
        {
            for (int j = 0; j <11; j++)
            {
                (*mazepic)( mx, my - j)->red = 255;
                (*mazepic)( mx, my - j)->blue = 0;
                (*mazepic)( mx, my - j)->green = 0;
            }
            my -= 10;
        }

    }

    int exitX = mx - 5;
    int exitY = my + 5;

    for (int i = 1; i < 10; i++)
    {
        (*mazepic)( exitX + i, exitY )->red = 255;
        (*mazepic)( exitX + i, exitY )->green = 255;
        (*mazepic)( exitX + i, exitY )->blue = 255;
    }

    return mazepic;
}



