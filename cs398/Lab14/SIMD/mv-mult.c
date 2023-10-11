#include "mv-mult.h"

typedef float v4sf __attribute__ ((vector_size (4*sizeof(float))));
//typedef float v4sf __attribute__ ((mode(V4SF)));
// Matrix-Vector multiplication
// mat is a SIZE by SIZE matrix, that is arranged in row-column, format,
// That is, you first select a particular row, and then a particular column.
// Each row is laid out as a one-dimensional, array, so if you wanted
// to select a particular row, you would use mat[row].  You can
// also select smaller intervals, by using &mat[row][col].
// The vector is also laid out as a one-dimensional arrow, similar to a row.
// M-V multiplication proceeds by taking the dot product of a matrix row
// with the vector, and doing this for each row in the matrix
float *
mv_mult(float mat[SIZE][SIZE], float vec[SIZE]) {
	static float ret[SIZE];
	int i, j;
	float temp[4];
	v4sf acc, X, Y;
	
	for (i = 0 ; i < SIZE ; i ++) {
      ret[i] = 0;
      acc = __builtin_ia32_xorps(acc, acc);
      for (j = 0 ; j < SIZE ; j += 4) {
      		X = __builtin_ia32_loadups(&mat[i][j]);
      		Y = __builtin_ia32_loadups(&vec[j]);
      		acc = __builtin_ia32_addps(acc, __builtin_ia32_mulps(X, Y));
      		//ret[i] += mat[i][j] * vec[j];
      	}
      __builtin_ia32_storeups(temp, acc);
      ret[i] = temp[0]+temp[1]+temp[2]+temp[3];
      for(; j<SIZE; j++){
      	ret[i] += mat[i][j]*vec[j];
      }
	}
	return ret;
}

