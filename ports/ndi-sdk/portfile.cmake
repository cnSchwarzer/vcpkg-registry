vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO cnSchwarzer/ndi-sdk
    REF 494a5c10627cdb07ab1b15b133b183ea9fa92922
    SHA512 7557509bbfc66f14b9988579d1a5406750349bc78d33d13222f008a9d11fd73515ac859daceb7173c133594ef39bc7aacad612d4daafbf9dfcf33f719132fe23
    HEAD_REF master
) 

file(INSTALL "${SOURCE_PATH}/Include/" DESTINATION "${CURRENT_PACKAGES_DIR}/include/ndi-sdk")

if(VCPKG_TARGET_ARCHITECTURE STREQUAL "x86" OR VCPKG_TARGET_ARCHITECTURE STREQUAL "x64") 

file(INSTALL "${SOURCE_PATH}/Bin/${VCPKG_TARGET_ARCHITECTURE}/" DESTINATION "${CURRENT_PACKAGES_DIR}/bin")
file(INSTALL "${SOURCE_PATH}/Lib/${VCPKG_TARGET_ARCHITECTURE}/" DESTINATION "${CURRENT_PACKAGES_DIR}/lib")

file(INSTALL "${SOURCE_PATH}/Bin/${VCPKG_TARGET_ARCHITECTURE}/" DESTINATION "${CURRENT_PACKAGES_DIR}/debug/bin")
file(INSTALL "${SOURCE_PATH}/Lib/${VCPKG_TARGET_ARCHITECTURE}/" DESTINATION "${CURRENT_PACKAGES_DIR}/debug/lib")

else() 
message(FATAL_ERROR "Architecture not supported.") 
endif()
  
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")