/*
 * $FreeBSD: ports/devel/qmake4/files/qconfig.cpp,v 1.11 2010/12/02 19:47:06 makc Exp $
 * Hand-crafted...
 * The default prefix (/ usr / local) is dynamicly replaced
 * at configure time.
 */
/* Installation date */
static const char qt_configure_installation          [12+11]    = "qt_instdate=TODAY";

#define QT_CONFIGURE_LICENSEE "Open Source";
#define QT_CONFIGURE_LICENSED_PRODUCTS "OpenSource";
#define QT_CONFIGURE_PREFIX_PATH "/usr/local";
#define QT_CONFIGURE_DOCUMENTATION_PATH "/usr/local/share/doc/qt4";
#define QT_CONFIGURE_HEADERS_PATH "/usr/local/include/qt4";
#define QT_CONFIGURE_LIBRARIES_PATH "/usr/local/lib/qt4";
#define QT_CONFIGURE_BINARIES_PATH "/usr/local/bin";
#define QT_CONFIGURE_PLUGINS_PATH "/usr/local/lib/qt4/plugins";
#define QT_CONFIGURE_IMPORTS_PATH "/usr/local/lib/qt4/imports";
#define QT_CONFIGURE_DATA_PATH "/usr/local/share/qt4";
#define QT_CONFIGURE_TRANSLATIONS_PATH "/usr/local/share/qt4/translations";
#define QT_CONFIGURE_SETTINGS_PATH "/usr/local/etc/xdg";
#define QT_CONFIGURE_EXAMPLES_PATH "/usr/local/share/examples/qt4/examples";
#define QT_CONFIGURE_DEMOS_PATH "/usr/local/share/examples/qt4/demos/";
