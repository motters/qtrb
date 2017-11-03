#!/usr/bin/env python
import sys
import os

# Take a sysroot directory and turn all the abolute symlinks and turn them into
# relative ones such that the sysroot is usable within another system.

if len(sys.argv) != 2:
    print("Usage is " + sys.argv[0] + "<directory>")
    sys.exit(1)

# Get path of sysroot for pi
topdir = sys.argv[1]
topdir = os.path.abspath(topdir)

# Folders requiring symlink updates
needCorrecting = ["/usr/include/", "/opt/vc/", "/usr/lib/", "/lib/"]

# Function to replace the abolute symlinks with relative ones
def handlelink(filep, subdir):
    link = os.readlink(filep)
    if link[0] != "/":
        return
    if link.startswith(topdir):
        return
    #print("Replacing %s with %s for %s" % (link, topdir+link, filep))
    print("Replacing %s with %s for %s" % (link, os.path.relpath(topdir+link, subdir), filep))
    os.unlink(filep)
    os.symlink(os.path.relpath(topdir+link, subdir), filep)

# Function to find relative files within folders
def handleDir(topSubDir):
    for subdir, dirs, files in os.walk(topdir+topSubDir):
        for f in files:
    	    filep = os.path.join(subdir, f)
    	    if os.path.islink(filep):
    	        #print("Considering %s" % filep)
    	        handlelink(filep, subdir)

# Loop though folders requiring symlink update
for topSubDir in needCorrecting:
    handleDir(topSubDir)

