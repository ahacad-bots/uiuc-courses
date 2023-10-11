#ifndef _image_H_
#define _image_H_

#include <iostream>
#include "png.h"
class Image : public PNG
{
public:
void 	flipleft ();
void 	adjustbrightness (int r, int g, int b);
void 	invertcolors ();};
#endif


