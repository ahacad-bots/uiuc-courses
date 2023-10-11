#include "image.h"
void Image::flipleft (){
 const size_t h=this->height();
const size_t w=this->width();
double z=w/2;

	for (size_t yi = 0; yi < h; yi++)
    {
        for (size_t xi = 0; xi < z; xi++)//for loop to cover the graph
        {RGBAPixel* p1=(*this)(xi,yi);
	RGBAPixel* p2=(*this)(w-1-xi,yi);
	RGBAPixel p3=*p2;//deep copy
	(*this)(w-1-xi,yi)->red=p1->red;
	(*this)(w-1-xi,yi)->green=p1->green;
	(*this)(w-1-xi,yi)->blue=p1->blue;
	(*this)(xi,yi)->red=p3.red;
	(*this)(xi,yi)->green=p3.green;
	(*this)(xi,yi)->blue=p3.blue;
		}
	}
}
		
void Image::adjustbrightness ( int r,int g,int b) {
const size_t h=this->height();
	const size_t w=this->width();//height and width
	for (size_t yi = 0; yi < h; yi++)
    {
        for (size_t xi = 0; xi < w; xi++)//for loop to cover the graph
        { 	int r1=(*this)(xi,yi)->red+r;
		if(r1<0){
		(*this)(xi,yi)->red=0;}//make sure the range
		else if(r1>255){
		(*this)(xi,yi)->red=255;}
		else (*this)(xi,yi)->red=r1;
		int g1=(*this)(xi,yi)->green+g;
		if(g1<0){
		(*this)(xi,yi)->green=0;}
		else if(g1>255){
		(*this)(xi,yi)->green=255;}
		else (*this)(xi,yi)->green=g1;
		int b1=(*this)(xi,yi)->blue+b;
		if(b1<0){
		(*this)(xi,yi)->blue=0;}
		else if(b1>255){
		(*this)(xi,yi)->blue=255;}
		else (*this)(xi,yi)->blue=b1;
		}	
	}
}


void Image::invertcolors ( 	) {
const size_t h=this->height();
	const size_t w=this->width();
for (size_t yi = 0; yi < h; yi++)
    {
        for (size_t xi = 0; xi < w; xi++)
        {
	(*this)(xi,yi)->red=255-(*this)(xi,yi)->red;
	(*this)(xi,yi)->green=255-(*this)(xi,yi)->green;
	(*this)(xi,yi)->blue=255-(*this)(xi,yi)->blue;
		}
	}

}





