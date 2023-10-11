#include <iostream>
#include <string>
#include "scene.h"


using namespace std;
//Constuctor
Scene::Scene(int max)
{
sceneImage = new Image*[max];
	for(int i=0; i<max; i++)
{
	sceneImage[i] = NULL;
}
	maxindex = max;
	x = new int[max];
	y = new int[max];
	for(int i=0; i<max; i++)
{
	x[i] = 0;
	y[i] = 0;
}
}
Scene::~Scene()
{
	for(int i=0; i<maxindex; i++)
{
	if(sceneImage[i] != NULL)
{
	delete sceneImage[i];
	sceneImage[i]=NULL;
}
}
	if(x != NULL)
	delete []x;
	if(y != NULL)
	delete []y;
	delete []sceneImage;
}
//copy constructer
Scene::Scene(const Scene& source)
{
	maxindex = source.maxindex;
        sceneImage = new Image *[maxindex];
	for(int i=0; i<maxindex; i++)
{
	sceneImage[i] = NULL;
}
	x = new int[maxindex];
	y = new int[maxindex];
for(int i=0; i<maxindex; i++)
{
	x[i] = 0;
	y[i] = 0;
}
    for(int i=0; i<maxindex; i++)
    {
        if(source.sceneImage[i] != NULL)
        {
            sceneImage[i] = new Image(*(source.sceneImage[i]));
		x[i] = source.x[i];
	        y[i] = source.y[i];
        }
        else
        {
            sceneImage[i] = NULL;
	
        }
    }
}
//Overloads = operator.
const Scene& Scene::operator=(const Scene& source)
{
if(sceneImage == source.sceneImage && x == source.x &&y == source.y)
	return (*this);
else{
	for(int i=0; i<maxindex; i++)
{
	if(sceneImage[i] != NULL){
	delete sceneImage[i];
	sceneImage[i]=NULL;
}
}

delete []sceneImage;
delete []x;
delete []y;
	maxindex = source.maxindex;
	sceneImage = new Image*[maxindex];
	x = new int[maxindex];
	y = new int[maxindex];
for(int i=0; i<maxindex; i++)
{
	x[i] = 0;
	y[i] = 0;
}
	for(int i=0; i<maxindex; i++)
{
            if(source.sceneImage[i] != NULL)
            {
                sceneImage[i] = new Image(*(source.sceneImage[i]));
		x[i] = source.x[i];
		y[i] = source.y[i];
            }
            else
            {
                sceneImage[i] = NULL;
            }
	
	
}

    return (*this);}
}

//changemaxlayer
void Scene::changemaxlayers(int newmax)
{
if(newmax < maxindex)
{
	for(int i=newmax; i<maxindex; i++)
	{
	if(sceneImage[i] != NULL)
	{
	cout << "invalid newmax" << endl;
	return;
	}
	}
}
	Image **tempmaxarray = new Image*[newmax];
	int * xi = new int[newmax];
	int * yi = new int[newmax];
	for(int i=0; i<maxindex; i++)
{
	tempmaxarray[i] = sceneImage[i];
	xi[i]=x[i];
	yi[i]=y[i];
}
	for(int j=maxindex; j<newmax; j++)
{
	tempmaxarray[j] = NULL;
	xi[j]=0;
	yi[j]=0;
}
	delete []sceneImage;
	delete []x;
	delete []y;
	sceneImage = tempmaxarray;
	x = xi;
	y = yi;
	maxindex=newmax;
}
void Scene::addpicture(const char* FileName, int index, int x, int y)
{
	if(index<0 || index>=maxindex)
{
	cout << "index out of bounds" << endl;
return;
}
	if(sceneImage[index] != NULL)
{
	delete sceneImage[index];
}
	sceneImage[index] = new Image;
	(*sceneImage[index]).readFromFile(FileName);
	(*this).x[index] = x;
	(*this).y[index] = y;
	return;
}
//change layer function
void Scene::changelayer(int index, int newindex)
{
	if(index<0 || index>maxindex-1 || newindex<0 ||newindex>maxindex-1)
{
	cout << "invalid index" << endl;
	return;
}
	if(index == newindex)
{
	return;
}
	if(sceneImage[newindex] != NULL)
{
	delete sceneImage[newindex];
}
	sceneImage[newindex] = sceneImage[index];
	sceneImage[index]=NULL;
	x[newindex] = x[index];
	x[index] = 0;
	y[newindex] = y[index];
	y[index] = 0;
	return;
}
//translate
void Scene::translate(int index, int xcoord, int ycoord)
{
	if(index<0 || index>maxindex-1 || sceneImage[index]==NULL)
{
	cout << "invalid index" << endl;
	return;
}
	(*this).x[index] = xcoord;
	(*this).y[index] = ycoord;
	return;
}

//Delete an Image
void Scene::deletepicture(int index)
{
	if(index<0 || index>maxindex-1 || sceneImage[index]==NULL)
{
	cout << "invalid index" << endl;
	return;
}
	delete sceneImage[index];
	sceneImage[index]=NULL;

}

//return a pointer
Image* Scene::getpicture(int index)
{
	if(index<0 || index>maxindex-1)
{
	cout << "invalid index" << endl;
	return NULL;
}
	return sceneImage[index];
}
//draw!!!
Image Scene::drawscene() const
{
	int width = 0;
	int height = 0;
	for(int i=0; i<maxindex; i++)
{
	if(sceneImage[i] != NULL)
{
	int w1 = (*sceneImage[i]).width() + x[i];
	if(w1 > width)
	width = w1;
	int h1 = (*sceneImage[i]).height() + y[i];
	if(h1 > height)
	height = h1;
}
}

	Image output;
	output.resize(width, height);
	for(int a=0; a<maxindex; a++)
{
	if(sceneImage[a] != NULL){
	for(int w2=0; w2<int((*sceneImage[a]).width()); w2++)
	{
	for(int h2=0; h2<int((*sceneImage[a]).height()); h2++)
	{
		output(w2+x[a], h2+y[a])->red = (*sceneImage[a])(w2, h2)->red;
		output(w2+x[a], h2+y[a])->green = (*sceneImage[a])(w2, h2)->green;
		output(w2+x[a], h2+y[a])->blue = (*sceneImage[a])(w2, h2)->blue;
	}
	}
}
}

return output;
}

