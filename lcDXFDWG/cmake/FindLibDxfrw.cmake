# - Try to find Cairo
# Once done, this will define
#
#  LIBDXFRW_FOUND - system has Cairo
#  LIBDXFRW_INCLUDE_DIRS - the Cairo include directories
#  LIBDXFRW_LIBRARIES - link these to use Cairo
#
# Copyright (C) 2016 R. van Twisk librecad@rvt.dds.nl
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1.  Redistributions of source code must retain the above copyright
#     notice, this list of conditions and the following disclaimer.
# 2.  Redistributions in binary form must reproduce the above copyright
#     notice, this list of conditions and the following disclaimer in the
#     documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER AND ITS CONTRIBUTORS ``AS
# IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR ITS
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

find_package(PkgConfig QUIET)
#pkg_check_modules(PC_LIBDXFRW QUIET LibDxfrw)

find_path(LIBDXFRW_INCLUDE_DIR
    NAMES libdxfrw.h
    HINTS ${PC_LIBDXFRW_INCLUDEDIR}
          ${PC_LIBDXFRW_INCLUDE_DIRS}
    PATH_SUFFIXES include/libdxfrw include/libdxfrw0 include
    PATHS
        ~/Library/Frameworks
        /Library/Frameworks
        /usr/local
        /usr
        /sw # Fink
        /opt/local # DarwinPorts
        /opt/csw # Blastwave
        /opt
)
mark_as_advanced(LIBDXFRW_INCLUDE_DIR)

find_library(LIBDXFRW_LIBRARY
    NAMES dxfrw dxfrw0
    HINTS ${PC_LIBDXFRW_LIBDIR}
          ${PC_LIBDXFRW_LIBRARY_DIRS}
    PATH_SUFFIXES lib64 lib
        PATHS
        ~/Library/Frameworks
        /Library/Frameworks
        /usr/local
        /usr
        /sw
        /opt/local
        /opt/csw
        /opt
)
mark_as_advanced(LIBDXFRW_LIBRARY)


include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(LibDxfrw DEFAULT_MSG LIBDXFRW_LIBRARY LIBDXFRW_INCLUDE_DIR)
