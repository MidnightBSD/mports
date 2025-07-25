PORTNAME=	gnome-builder
PORTVERSION=	42.1
PORTREVISION=	10
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME/sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+)\..*/\1/}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	IDE for writing software for GNOME
WWW=		https://wiki.gnome.org/Apps/Builder

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

BROKEN=		fails to build with libgit2 1.8.1

LIB_DEPENDS=	libcmark.so:textproc/cmark \
		libdazzle-1.0.so:x11-toolkits/libdazzle \
		libdevhelp-3.so:devel/devhelp \
		libenchant-2.so:textproc/enchant2 \
		libfontconfig.so:x11-fonts/fontconfig \
		libgit2-glib-1.0.so:devel/libgit2-glib \
		libgit2.so:devel/libgit2 \
		libgladeui-2.so:devel/glade \
		libgspell-1.so:textproc/gspell \
		libhandy-1.so:x11-toolkits/libhandy \
		libjson-glib-1.0.so:devel/json-glib \
		libjsonrpc-glib-1.0.so:devel/jsonrpc-glib \
		libpcre.so:devel/pcre \
		libpeas-1.0.so:devel/libpeas \
		libportal.so:deskutils/libportal \
		libportal-gtk3.so:deskutils/libportal-gtk3 \
		libsoup-2.4.so:devel/libsoup \
		libtemplate_glib-1.0.so:devel/template-glib \
		libwebkit2gtk-4.0.so:www/webkit2-gtk@40

PORTSCOUT=	limitw:1,even
PORTDOCS=	*

CONFLICTS_BUILD=	gnome-builder-3.16.*

USES=		compiler:c++11-lang desktop-file-utils gettext gnome \
		localbase:lfdlags meson pkgconfig python:build shebangfix \
		tar:xz vala:lib
USE_GNOME=	cairo gtksourceview4 introspection libxml2 vte3
SHEBANG_FILES=	${WRKSRC}/src/plugins/gradle/gradle_plugin.py \
		${WRKSRC}/src/plugins/maven/maven_plugin.py
USE_LDCONFIG=	yes
BINARY_ALIAS=	python3=${PYTHON_VERSION}

MESON_ARGS=	-Dplugin_color_picker=false \
		-Dplugin_flatpak=false \
		-Dplugin_jhbuild=false \
		-Dplugin_qemu=false \
		-Dplugin_sysprof=false \
		-Dplugin_update_manager=false

PLIST_SUB=	BUILDER_VERSION=${PORTVERSION:R}

GLIB_SCHEMAS=	org.gnome.builder.build.gschema.xml \
		org.gnome.builder.clang.gschema.xml \
		org.gnome.builder.code-insight.gschema.xml \
		org.gnome.builder.editor.gschema.xml \
		org.gnome.builder.editor.language.gschema.xml \
		org.gnome.builder.extension-type.gschema.xml \
		org.gnome.builder.gnome-code-assistance.gschema.xml \
		org.gnome.builder.gschema.xml \
		org.gnome.builder.plugin.gschema.xml \
		org.gnome.builder.plugins.copyright.gschema.xml \
		org.gnome.builder.plugins.eslint.gschema.xml \
		org.gnome.builder.plugins.stylelint.gschema.xml \
		org.gnome.builder.project-tree.gschema.xml \
		org.gnome.builder.project.gschema.xml \
		org.gnome.builder.rust-analyzer.gschema.xml \
		org.gnome.builder.terminal.gschema.xml \
		org.gnome.builder.workbench.gschema.xml

OPTIONS_SUB=		YES
OPTIONS_DEFINE=		CLANG DOCS
OPTIONS_DEFAULT=	CLANG

# track the latest llvm/clang version, the config script picks the newest available
CLANG_DESC=		Build the clang plugin
CLANG_MESON_TRUE=	plugin_clang
CLANG_USES=		llvm:build,run
CLANG_CONFIGURE_ENV=	LLVM_CONFIG=${LLVM_CONFIG}

# 11.1 and older has issues with vala generated code.
post-patch:
	${REINPLACE_CMD} -e '/-Werror=return-type/d' \
		${WRKSRC}/meson.build

.include <bsd.port.mk>
