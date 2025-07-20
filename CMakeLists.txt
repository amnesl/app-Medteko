cmake_minimum_required(VERSION 3.27)
project(app_medteco LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 COMPONENTS Core Gui Quick Qml QmlModels REQUIRED)

add_subdirectory(core)

qt_add_executable(app
    main.cpp
    qml/ProductCardPage.qml
    qml/Styles.qml
    qml/components/CustomToolBar.qml
)

target_sources(app PRIVATE
    core/security.cpp
    core/keystore.cpp
)

target_link_libraries(app PRIVATE Qt6::Core Qt6::Gui Qt6::Quick Qt6::Qml Qt6::QmlModels productmodel)

qt_add_resources(app "qml"
    FILES
        qml/main.qml
        qml/HomePage.qml
        qml/CategoryPage.qml
        qml/SubcategoryPage.qml
        qml/ProductListPage.qml
        qml/ProductCardPage.qml
        qml/AboutPage.qml
        qml/ExitPage.qml
        qml/ProfilePage.qml
        qml/TrainingPage.qml
        qml/assets/catalog.json
        qml/components/CustomToolBar.qml
        qml/Styles.qml
)
qt_add_resources(app "resources"
    FILES
        resource/data/training.json
)
