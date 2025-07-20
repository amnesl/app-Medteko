find_package(Qt6 REQUIRED COMPONENTS QmlModels)

add_library(productmodel STATIC
    productmodel.cpp
    productmodel.h
    catalogloader.h
    catalogloader.cpp
    trainingmodel.h
    trainingmodel.cpp
    security.h
    keystore.h
)

target_link_libraries(productmodel PUBLIC Qt6::QmlModels)

target_include_directories(productmodel PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
