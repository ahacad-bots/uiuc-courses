/**
 * @file graph_tools.cpp
 * This is where you will implement several functions that operate on graphs.
 * Be sure to thoroughly read the comments above each function, as they give
 *  hints and instructions on how to solve the problems.
 */

#include "graph_tools.h"
#include <iostream>
#include <algorithm>
#include <map>

using namespace std;
/**
 * Returns the shortest distance (in edges) between the Vertices
 *  start and end.
 * THIS FUNCTION IS GRADED.
 *
 * @param graph - the graph to search
 * @param start - the vertex to start the search from
 * @param end - the vertex to find a path to
 * @return the minimum number of edges between start and end
 *
 * @todo Label each edge "MINPATH" if it is part of the minimum path
 *
 * @note Remember this is the shortest path in terms of edges,
 *  not edge weights.
 * @note Again, you may use the STL stack and queue.
 * @note You may also use the STL's unordered_map, but it is possible
 *  to solve this problem without it.
 *
 * @hint In order to draw (and correctly count) the edges between two
 *  vertices, you'll have to remember each vertex's parent somehow.
 */
int GraphTools::findShortestPath(Graph & graph, Vertex start, Vertex end)
{ 
	
	/**
    if (start == end)
   	return 0;
	
	vector<Vertex> Vs = graph.getAdjacent(start);
	cout<<"1"<<endl;
	
	int* temp = new int[Vs.size()];
	
	Edge* temp2 = new Edge[Vs.size()];
	
	for(int j = 0; j=Vs.size(); j++)
	{
	temp2[j] = graph.getEdge(start, Vs[j]);
	if(temp2[j].label == "UNEXPLORED")
	{
	temp[j] = 1 + findShortestPath(graph, Vs[j], end);
	temp2[j].label = "VISITED";
	}
	else 
	temp[j] = 9999;
	}
	int min  = temp[0];
	int index = 0;
	
	for(int m=0; m<Vs.size(); m++)
	{
	if(temp[m]<min)
	min = temp[m];
	index = m;
	}
	
	temp2[index].label = "MINPATH";
	return min;**/
	set_empty(graph);
	queue<Vertex> BSTqueue;
	graph.setVertexLabel(start, "VISITED");
	BSTqueue.push(start);
	unordered_map<Vertex, Vertex> vmap;
	while(!BSTqueue.empty())
	{
	Vertex temp = BSTqueue.front();
	vector<Vertex>Vs = graph.getAdjacent(temp);
	BSTqueue.pop();
	for(int j = 0; j<Vs.size(); j++)
	{
	Vertex next = Vs[j];
	if (graph.getVertexLabel(next).compare("UNVISITED") == 0)
            {
                vmap[next] = temp;
                //graph.setEdgeLabel(temp, next, "DISCOVERY");
                graph.setVertexLabel(next, "VISITED");
                BSTqueue.push(next);
            } 
     //else if (graph.getEdgeLabel(temp, next).compare("UNEXPLORED") == 0)
                //{graph.setEdgeLabel(temp, next, "CROSS");}
       }

	
	}
    int count = 0;
    while (end != start)
    {
        graph.setEdgeLabel(end, vmap[end], "MINPATH");
        end = vmap[end];
        count++;
    }

    return count;

}

/**
 * Finds the minimum edge weight in the Graph graph.
 * THIS FUNCTION IS GRADED.
 *
 * @param graph - the graph to search
 * @return the minimum weighted edge
 *
 * @todo Label the minimum edge as "MIN". It will appear blue when
 *  graph.savePNG() is called in minweight_test.
 *
 * @note You must do a traversal.
 * @note You may use the STL stack and queue.
 * @note You may assume the graph is connected.
 *
 * @hint Initially label vertices and edges as unvisited.
 */
int GraphTools::findMinWeight(Graph & graph)
{
	set_empty(graph);
    queue<Vertex> BSTqueue;
    Vertex start = graph.getStartingVertex();
	graph.setVertexLabel(start, "VISITED");
	BSTqueue.push(start);

	Edge min_edge;
	vector<Vertex> a = graph.getAdjacent(start);
	int min_weight = graph.getEdgeWeight(start, a[0]);
	min_edge = graph.getEdge(start, a[0]);
	while(!BSTqueue.empty())
	{
	Vertex temp = BSTqueue.front();
	vector<Vertex>Vs = graph.getAdjacent(temp);
	BSTqueue.pop();
	for(int j = 0; j<Vs.size(); j++)
	{
	Vertex next = Vs[j];
	if (graph.getVertexLabel(next)=="UNVISITED")
            {
                graph.setEdgeLabel(temp, next, "DISCOVERY");
                graph.setVertexLabel(next, "VISITED");
                BSTqueue.push(next);
            } 
     else if (graph.getEdgeLabel(temp, next)=="UNEXPLORED")
              {  graph.setEdgeLabel(temp, next, "CROSS");}
      if(graph.getEdgeWeight(temp, next)<=min_weight)
      {
       min_weight = graph.getEdgeWeight(temp,next);
      min_edge = graph.getEdge(temp, next);
      }          
                
                
                
       }

	}
	min_edge.label = "MIN";
	return min_weight;
}

/**
 * Finds a minimal spanning tree on a graph.
 * THIS FUNCTION IS GRADED.
 *
 * @param graph - the graph to find the MST of
 *
 * @todo Label the edges of a minimal spanning tree as "MST"
 *  in the graph. They will appear blue when graph.savePNG() is called.
 *
 * @note Use your disjoint sets class from MP 7.1 to help you with
 *  Kruskal's algorithm. Copy the files into the libdsets folder.
 * @note You may call std::sort (http://www.cplusplus.com/reference/algorithm/sort/)
 *  instead of creating a priority queue.
 */
void GraphTools::findMST(Graph & graph)
{
	vector<Edge> eds = graph.getEdges();
	sort(eds.begin(), eds.end(),myfunction);
	DisjointSets vers;
    vector <Vertex> vertex_list = graph.getVertices();
    vers.addelements(vertex_list.size());

    for (int i = 0; i < eds.size(); i++)
    {

        Vertex u = eds[i].source;
        Vertex v = eds[i].dest;

        if (vers.find(u) != vers.find(v))
        {
            vers.setunion(u,v);
            graph.setEdgeLabel(u,v,"MST");
        }
    }
}

bool GraphTools::myfunction (Edge a, Edge b) {
    return (a.weight < b.weight); }


void GraphTools::set_empty(Graph & graph)
{
    vector<Edge> eds = graph.getEdges();
	vector<Vertex> vers = graph.getVertices();
	for(int i=0; i<vers.size(); i++)
	{
	graph.setVertexLabel(vers[i],"UNVISITED");
	
	}
	for(int i=0;i<eds.size();i++)
	{
	graph.setEdgeLabel(eds[i].source, eds[i].dest, "UNEXPLORED");
	}
}



