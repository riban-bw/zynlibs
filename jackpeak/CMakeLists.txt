cmake_minimum_required(VERSION 3.10)
# set(CMAKE_VERBOSE_MAKEFILE ON)

project(jackpeak VERSION 1.0.0)

include(CheckIncludeFiles)
include(CheckLibraryExists)

link_directories(/usr/local/lib)

add_library(jackpeak SHARED jackpeak.h jackpeak.c)
	target_link_libraries(jackpeak jack)

install(TARGETS jackpeak LIBRARY DESTINATION local/lib)
install(FILES jackpeak.py __init__.py DESTINATION /usr/local/lib/python3/dist-packages/jackpeak)

SET(CPACK_GENERATOR "DEB")
SET(CPACK_DEBIAN_PACKAGE_MAINTAINER "Brian Walton <riban@zynthian.org>")
SET(CPACK_DEBIAN_PACKAGE_NAME "libjackpeak")
SET(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
SET(CPACK_DEBIAN_PACKAGE_RELEASE 1)
SET(CPACK_DEBIAN_PACKAGE_DESCRIPTION "Peak programme metering library for Zynthian")
SET(CPACK_DEBIAN_PACKAGE_SECTION "audio")
SET(CPACK_DEBIAN_PACKAGE_HOMEPAGE "https://github.com/riban-bw/zynlibs")
SET(CPACK_DEBIAN_PACKAGE_SHLIBDEPS ON)
SET(CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA "${CMAKE_CURRENT_SOURCE_DIR}/triggers")
INCLUDE(CPack)
