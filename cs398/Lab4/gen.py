width = 32;

for i in range(1, width):
	print "		wire [%d:%d]out%d;" % (width, 0, i)
for i in range(1, width):    
   print "		register r%d(out%d, wr_data, clock, wr_reg[%d], reset);" % (i, i, i)

#for i in range(width):
#	print "out%d," % (i),	
