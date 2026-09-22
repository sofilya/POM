cmake_minimum_required(VERSION 3.16)

project(hello-world LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 COMPONENTS Core Quick Gui Widgets REQUIRED)

add_executable(launcher main.cpp qml.qrc)
target_link_libraries(launcher PRIVATE Qt6::Core Qt6::Quick Qt6::Gui Qt6::Widgets)
