COMPILER = g++
COMPILER_OPTS = -c -g -O0 -Wall -Werror
LINKER = g++
LINKER_OPTS = -lpng
all: testimage testscene

testimage: image.o testimage.o png.o rgbapixel.o 
	$(LINKER) testimage.o image.o png.o rgbapixel.o $(LINKER_OPTS) -o testimage 

testscene: image.o scene.o testscene.o png.o rgbapixel.o 
	$(LINKER) image.o scene.o testscene.o png.o rgbapixel.o $(LINKER_OPTS) -o testscene 

scene.o : scene.cpp image.h scene.h png.h rgbapixel.h
	$(COMPILER) $(COMPILER_OPTS) scene.cpp

testscene.o : testscene.cpp scene.h png.h rgbapixel.h image.h
	$(COMPILER) $(COMPILER_OPTS) testscene.cpp

image.o : png.h rgbapixel.h image.h
	$(COMPILER) $(COMPILER_OPTS) image.cpp

testimage.o : testimage.cpp png.h rgbapixel.h image.h
	$(COMPILER) $(COMPILER_OPTS) testimage.cpp

png.o : png.cpp png.h rgbapixel.h 
	$(COMPILER) $(COMPILER_OPTS) png.cpp

rgbapixel.o : rgbapixel.cpp rgbapixel.h
	$(COMPILER) $(COMPILER_OPTS) rgbapixel.cpp

clean :
	-rm -f *.o testimage testscene 
