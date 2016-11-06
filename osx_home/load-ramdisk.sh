#!/bin/bash
# Create and mount RAMDisk 
diskutil eject 'RAMDisk'
diskutil erasevolume HFS+ 'RAMDisk' `hdiutil attach -nomount ram://2097152`

