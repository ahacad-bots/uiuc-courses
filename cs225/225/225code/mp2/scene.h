#ifndef _scene_H_
#define _scene_H_

#include "image.h"

class Scene
{
public:
Scene(int max);
~Scene();
Scene(const Scene& source);
const Scene& operator=(const Scene& source);
void addpicture(const char* FileName, int index, int x, int y);
void changemaxlayers(int newmax);
void changelayer(int index, int newindex);
void translate(int index, int xcoord, int ycoord);
void deletepicture(int index);
Image* getpicture(int index);
Image drawscene() const;
int maxindex;
Image **sceneImage;
int* x;
int* y;
};
#endif

