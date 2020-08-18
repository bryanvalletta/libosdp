#
#  Copyright (c) 2020 Siddharth Chandrasekaran <siddharth@embedjournal.com>
#
#  SPDX-License-Identifier: Apache-2.0
#

# Package Info
set(CPACK_PACKAGE_NAME ${PROJECT_NAME})
set(CPACK_URL ${PROJECT_URL})
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY ${PROJECT_DESCRIPTION})
set(CPACK_RESOURCE_FILE_README "${CMAKE_SOURCE_DIR}/README.md")
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_SOURCE_DIR}/LICENSE")
set(CPACK_PACKAGE_DESCRIPTION_FILE ${CPACK_RESOURCE_FILE_README})
set(CPACK_PACKAGE_DIRECTORY "${CMAKE_BINARY_DIR}/packages")

# Version
set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})

set(PACKAGE_NAME ${PROJECT_NAME}-${PROJECT_VERSION})
set(SYSTEM_NAME ${CMAKE_SYSTEM_NAME}-${CMAKE_HOST_SYSTEM_PROCESSOR})

# Source tarballs
set(CPACK_SOURCE_PACKAGE_FILE_NAME ${PACKAGE_NAME})
set(CPACK_SOURCE_GENERATOR "TGZ;TBZ2")
set(CPACK_SOURCE_IGNORE_FILES
	/.git/
	/.github/
	/build*
	/_config.yml
	/.travis.yml
)

# Binaries
set(CPACK_GENERATOR "TGZ;TBZ2")
set(CPACK_PACKAGE_FILE_NAME ${PACKAGE_NAME}-${SYSTEM_NAME})
include(CPackComponent)
cpack_add_component(distributables
	DISPLAY_NAME  ${PROJECT_NAME}
	DESCRIPTION   "Distributables (Libaray, Binaries, Headers, etc.,)"
)
cpack_add_component(config_files
	DISPLAY_NAME  ${PROJECT_NAME}
	DESCRIPTION   "Package Configuration Files"
)

include(CPack)
