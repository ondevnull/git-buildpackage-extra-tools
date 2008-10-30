#!/bin/sh

/*
 * Author: Jose Luis Rivas <ghostbar at gmx.com>
 * Filename: install.sh
 * Date: October 29, 2008, 21:40.
 *
 * Copyright (c) 2008 Jose Luis Rivas <ghostbar at gmx.com>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
 
if [[ $0 = "-h" ]]; then
	echo
	echo "This is the installer for git-buildpackage-extra-tools,"
	echo "just run it with ./install.sh and will install a symlink"
	echo "in ~/bin/ of the packages and ~/.gbp.conf from ./gbp.conf."
	echo
	echo "Last version downloadable from:"
	echo "git://git.rivco.info/misc/git-buildpackage-extra-tools.git"
fi

if [[ $0 = "-v" ]]; then
	echo 
	echo "Installer for git-buildpackage-extra-tools"
	echo "Version 0.01"
	echo "Copyright 2008 Jose Luis Rivas <ghostbar at gmx.com>"
fi

if [[ $# = 0 ]]; then
	echo
	echo "Checking if ~/bin is created"
	if [[ -d ! ~/bin ]]; then
		mkdir ~/bin
		echo "Created ~/bin..."
	else
		echo "~/bin exists! :D"
	fi
	echo "Starting to symlink the files"
	for i in git-buildpackage-backports git-import-orig-backports git-import-dsc-backports git-buildpackage-experimental git-import-orig-experimental git-import-dsc-experimental
	do
		echo "Symlinking $i..."
		ln -s $i ~/bin/$i
	done
	echo "Symlinking gbp.conf..."
	ln -s gbp.conf ~/.gbp.conf
	echo 
	echo "Dude! You\'re done!"
fi

exit 0
