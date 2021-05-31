cmake_minimum_required(VERSION 3.10)
# set(CMAKE_VERBOSE_MAKEFILE ON)

project(zynseq VERSION 1.0.0)

include(CheckIncludeFiles)
include(CheckLibraryExists)

link_directories(/usr/local/lib)

add_library(zynseq SHARED zynseq.h zynseq.cpp sequencemanager.cpp pattern.cpp sequence.cpp timebase.cpp track.cpp)
	target_link_libraries(zynseq jack)

install(TARGETS zynseq LIBRARY DESTINATION local/lib)
install(FILES zynseq.py __init__.py DESTINATION /usr/lib/python3/dist-packages/zynseq)

SET(CPACK_GENERATOR "DEB")
SET(CPACK_DEBIAN_PACKAGE_MAINTAINER "Brian Walton <riban@zynthian.org>")
SET(CPACK_DEBIAN_PACKAGE_NAME "libzynseq")
SET(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
SET(CPACK_DEBIAN_PACKAGE_RELEASE 1)
SET(CPACK_DEBIAN_PACKAGE_DESCRIPTION "Step sequencer library for Zynthian")
SET(CPACK_DEBIAN_PACKAGE_SECTION "audio")
SET(CPACK_DEBIAN_PACKAGE_HOMEPAGE "https://github.com/riban-bw/zynlibs")
SET(CPACK_DEBIAN_PACKAGE_SHLIBDEPS ON)
SET(CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA "${CMAKE_CURRENT_SOURCE_DIR}/triggers")
INCLUDE(CPack)
