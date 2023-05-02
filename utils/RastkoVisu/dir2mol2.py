# * *************************************************************
# *  
# *   Soft Active Mater on Surfaces (SAMoS)
# *   
# *   Author: Rastko Sknepnek
# *  
# *   Division of Physics
# *   School of Engineering, Physics and Mathematics
# *   University of Dundee
# *   
# *   (c) 2013, 2014
# * 
# *   School of Science and Engineering
# *   School of Life Sciences 
# *   University of Dundee
# * 
# *   (c) 2015
# * 
# *   Author: Silke Henkes
# * 
# *   Department of Physics 
# *   Institute for Complex Systems and Mathematical Biology
# *   University of Aberdeen  
# * 
# *   (c) 2014, 2015
# *  
# *   This program cannot be used, copied, or modified without
# *   explicit written permission of the authors.
# * 
# * ***************************************************************

# Utility code for converting internal director files to MOL2 format
# suitable for direct visualization.

from datetime import *
import argparse
import sys

parser = argparse.ArgumentParser()
parser.add_argument("-i", "--input", type=str, default='test.dir', help="input file (APCS director fie format)")
parser.add_argument("-o", "--output", type=str, default='out.mol2', help="output file (MOL2 format)")
args = parser.parse_args()

print()
print("\tActive Particles on Curved Spaces (APCS)")
print("\tDirector to mol2 conversion")
print() 
print("\tRastko Sknepnek")
print("\tUniversity of Dundee")
print("\t(c) 2014")
print("\t----------------------------------------------")
print() 
print("\tInput file : ", args.input)
print("\tOutput file : ", args.output)
print() 

start = datetime.now()

inp = open(args.input,'r')

lines = inp.readlines()
lines = [x.strip().split() for x in lines]
inp.close()

out = open(args.output,'w')
out.write('# Generated by dir2mol2.py, (c) Rastko Sknepnek, 2014.\n')
out.write('@<TRIPOS>MOLECULE\n')
out.write('system\n')
out.write('%d %d\n' % (2*(len(lines)-2),len(lines)-2))
out.write('@<TRIPOS>ATOM\n')

idx = 1
for line in lines:
  if line[0] != '#':
    x, y, z, nx, ny, nz = list(map(float, line))
    out.write('%d  1  %f  %f  %f\n' % (idx,x,y,z))
    idx += 1
    out.write('%d  2  %f  %f  %f\n' % (idx,x+nx,y+ny,z+nz))
out.write('@<TRIPOS>BOND\n')
idx = 1
for i in range(0,len(lines)-2):
  out.write('%d  %d  %d  1\n' % (i+1, idx, idx+1))
  idx += 2
out.close()

end = datetime.now()

total = end - start

print() 
print("  *** Completed in ", total.total_seconds(), " seconds *** ")
print()

