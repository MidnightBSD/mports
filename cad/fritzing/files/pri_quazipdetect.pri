message("Using FreeBSD-provided quazip detect script.")

SOURCES += \
        src/zlibdummy.c \

QT += core5compat
INCLUDEPATH += "%%LOCALBASE%%/include/QuaZip-Qt6-1.7.1/"
LIBS += "-lquazip1-qt6"
