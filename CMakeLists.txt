cmake_minimum_required(VERSION 3.10.0)
project(demo6_cmake VERSION 0.1 LANGUAGES C CXX)


# Cmake相关变量参见 https://cmake.org/cmake/help/latest/manual/cmake-variables.7.html


# 添加共享库目标
add_library(mathlib SHARED src/mathlib.cpp)

# 设置编译定义
target_compile_definitions(mathlib PRIVATE BUILD_DLL)

# # 设置编译选项
# target_compile_options(mathlib PRIVATE -m64)

# # 针对Windows平台设置链接选项生成导入库
# if(WIN32)
#     target_link_options(mathlib PRIVATE "LINKER:-out-implib,libmathlib1.a")
# endif()


# LINK_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR})
add_executable(demo6_test1 src/test1.cpp)
add_executable(demo6_test2 src/test2.cpp)
TARGET_LINK_LIBRARIES(demo6_test1 mathlib)
TARGET_LINK_LIBRARIES(demo6_test2 mathlib)

add_test(NAME demo6_cmake_tests1 COMMAND demo6_test1)
add_test(NAME demo6_cmake_tests2 COMMAND demo6_test2)



# set(CMAKE_INSTALL_PREFIX "D:/Program Files/${PROJECT_NAME}" CACHE PATH "Default install path")
# set(CMAKE_INSTALL_PREFIX "D:/Program Files/${PROJECT_NAME}")

# 先设置所有CPack变量

# set(CPACK_PACKAGE_VERSION "1.1.0")

set(CPACK_PACKAGE_VENDOR "ChaosTek")
# set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PACKAGE_NAME "hello_chaos") # 设置包名称

set(CPACK_PACKAGE_VERSION "${PROJECT_VERSION}.3" CACHE STRING "CPack package version")
# set(CPACK_PACKAGING_INSTALL_PREFIX "/opt/myapp")    # 设置安装路径前缀

# 指定生成器（如 ZIP、DEB）
# set(CPACK_GENERATOR "ZIP")
set(CPACK_GENERATOR "NSIS64")  # 使用NSIS生成Windows安装包

# set(CPACK_ABSOLUTE_DESTINATION_FILES "ON") # 允许绝对路径安装文件
# set(CPACK_SET_DESTDIR "ON")  # 启用DESTDIR支持

# 
# CPACK_COMPONENT_INCLUDE_TOPLEVEL_DIRECTORY
# CPACK_CUSTOM_INSTALL_VARIABLES
# CPACK_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION
# CPACK_INCLUDE_TOPLEVEL_DIRECTORY
# CPACK_INSTALL_DEFAULT_DIRECTORY_PERMISSIONS
# CPACK_PACKAGING_INSTALL_PREFIX
# CPACK_SET_DESTDIR
# CPACK_WARN_ON_ABSOLUTE_INSTALL_DESTINATION

# # NSIS相关参数参见 https://cmake.org/cmake/help/latest/cpack_gen/nsis.html
set(CPACK_NSIS_INSTALL_ROOT "D:\\\\Program Files")  # 设置NSIS安装根目录
set(CPACK_PACKAGE_INSTALL_DIRECTORY ${PROJECT_NAME}) # 设置安装目录名称


# 最后再包含CPack模块
include(CPack)


# # 确保可执行文件被安装
install(TARGETS demo6_test1 demo6_test2 mathlib
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION bin
    ARCHIVE DESTINATION lib
)

# install(PROGRAMS demo6_test1 demo6_test1 DESTINATION bin)
# install(LIBRARIES my_library.so DESTINATION lib)



# 可选：安装其他资源文件（如文档、配置文件等）
install(FILES README.md DESTINATION docs)


include(CTest)
enable_testing()

