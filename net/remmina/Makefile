PORTNAME=	remmina
DISTVERSION=	1.4.33
PORTREVISION=	2
CATEGORIES=	net gnome

PATCH_SITES=	https://gitlab.com/${GL_ACCOUNT}/${GL_PROJECT}/-/commit/
PATCHFILES+=	dbd6f94974c4d7df313963ffefecb1ff8ca9ecb6.patch:-p1 # https://gitlab.com/Remmina/Remmina/-/merge_requests/2540

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GTK Remote Desktop Client
WWW=		https://www.remmina.org/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libappindicator3.so:devel/libappindicator \
		libjson-glib-1.0.so:devel/json-glib \
		libpcre2-8.so:devel/pcre2 \
		libsodium.so:security/libsodium \
		libsoup-2.4.so:devel/libsoup \
		libwayland-client.so:graphics/wayland

FLAVORS=		default lite
lite_PKGNAMESUFFIX=	-lite
lite_DESCR=		${.CURDIR}/pkg-descr-lite

USES=		cmake compiler:c11 desktop-file-utils gettext gnome localbase:ldflags pathfix \
		pkgconfig shared-mime-info ssl shebangfix xorg

USE_GITLAB=	yes
GL_ACCOUNT=	Remmina
GL_PROJECT=	Remmina
GL_TAGNAME=	2c4e1479433e51418ecb6089f35182bfebc5b57e

USE_GNOME=	atk cairo gdkpixbuf glib20 gtk30 pango

USE_XORG=	ice sm x11 xext

SHEBANG_FILES=	data/desktop/remmina-file-wrapper.in
bash_CMD=	${SH}

CMAKE_ARGS=	-DWITH_APPINDICATOR:BOOL=false \
	-DLIBSOUP_LIBRARY=/usr/local/lib/libsoup-2.4.so

CONFLICTS_INSTALL=	remmina-plugin*

OPTIONS_DEFINE=		AVAHI CUPS GCRYPT NLS PYTHON SSH TERM
OPTIONS_DEFAULT=	AVAHI CUPS GCRYPT NLS SSH TERM \
			EXEC RDP SECRET SPICE VNC WWW BASH
OPTIONS_GROUP=		PLUGINS
OPTIONS_GROUP_PLUGINS=	EXEC KWALLET RDP SECRET SPICE VNC WWW
OPTIONS_SINGLE=		SHELL
OPTIONS_SINGLE_SHELL=	BASH ZSH
OPTIONS_SUB=		yes

.if ${FLAVOR:U} == lite
OPTIONS_EXCLUDE=	AVAHI CUPS KWALLET PYTHON SECRET SPICE SSH TERM WWW
COMMENT+=		(lite flavor)
.endif

AVAHI_DESC=		Build with Avahi support
BASH_DESC=		Use BASH for shell wrapper scripts
EXEC_DESC=		Plugin to execute a command
GCRYPT_DESC=		Build with libgcrypt support for password encryption
PYTHON_DESC=		Build with support for Python plugins
RDP_DESC=		Remote Desktop Protocol plugin
SECRET_DESC=		GNOME Keyring plugin
SHELL_DESC=		Shell Scripts
SPICE_DESC=		Spice protocol plugin
SSH_DESC=		Build with SSH tunneling support
TERM_DESC=		Build with terminal support
VNC_DESC=		VNC protocol plugin
WWW_DESC=		Plugin to open an authenticated web browser
ZSH_DESC=		Use ZSH for shell wrapper scripts

AVAHI_LIB_DEPENDS=	libavahi-client.so:net/avahi-app \
			libavahi-ui-gtk3.so:net/avahi-gtk3
AVAHI_CMAKE_BOOL=	WITH_AVAHI

BASH_RUN_DEPENDS=	bash:shells/bash
BASH_VARS=		SH_BIN=${PREFIX}/bin/bash

CUPS_LIB_DEPENDS=	libcups.so:print/cups
CUPS_CMAKE_BOOL=	WITH_CUPS

GCRYPT_LIB_DEPENDS=	libgcrypt.so:security/libgcrypt
GCRYPT_CMAKE_BOOL=	WITH_GCRYPT

KWALLET_USES=		kde:5 qt:5
KWALLET_USE=		kde=wallet qt=buildtools:build,core,gui,qmake:build
KWALLET_CMAKE_BOOL=	WITH_KF5WALLET

NLS_CMAKE_BOOL=		WITH_TRANSLATIONS

PYTHON_USES=		python
PYTHON_CMAKE_BOOL=	WITH_PYTHONLIBS

RDP_LIB_DEPENDS=	libfreerdp2.so:net/freerdp libxkbfile.so:x11/libxkbfile

SECRET_LIB_DEPENDS=	libsecret-1.so:security/libsecret
SECRET_RUN_DEPENDS=	gnome-keyring:security/gnome-keyring

SPICE_BUILD_DEPENDS=	spice-protocol>=0.12.15:devel/spice-protocol
SPICE_LIB_DEPENDS=	libspice-client-gtk-3.0.so:deskutils/spice-gtk
SPICE_CMAKE_BOOL=	WITH_SPICE

SSH_LIB_DEPENDS=	libssh.so:security/libssh
SSH_CMAKE_BOOL=		WITH_LIBSSH
SSH_LDFLAGS=		-fstack-protector

TERM_USE=		gnome=vte3
TERM_CMAKE_BOOL=	WITH_VTE

VNC_LIB_DEPENDS=	libgnutls.so:security/gnutls \
			libvncserver.so:net/libvncserver
VNC_USES=		jpeg
VNC_CMAKE_BOOL=		WITH_LIBVNCSERVER

WWW_LIB_DEPENDS=	libharfbuzz.so:print/harfbuzz \
			libsoup-2.4.so:devel/libsoup \
			libwebkit2gtk-4.0.so:www/webkit2-gtk3

WWW_CMAKE_BOOL=		WITH_WEBKIT2GTK

ZSH_RUN_DEPENDS=	zsh:shells/zsh
ZSH_VARS=		SH_BIN=${PREFIX}/bin/zsh

bash_CMD=		${SH_BIN}

post-patch:
	${REINPLACE_CMD} -e 's,FreeBSD,FreeBSD|DragonFly,' \
		${WRKSRC}/CMakeLists.txt

post-patch-EXEC-off:
	${REINPLACE_CMD} -e '/add_subdirectory(exec)/d' ${WRKSRC}/plugins/CMakeLists.txt

post-patch-GCRYPT-off:
	${REINPLACE_CMD} -e '/find_suggested_package(GCRYPT)/d' ${WRKSRC}/CMakeLists.txt

post-patch-KWALLET-off:
	${REINPLACE_CMD} -e '/add_definitions(-DWITH_KF5WALLET)/d' ${WRKSRC}/plugins/CMakeLists.txt
	${REINPLACE_CMD} -e '/add_subdirectory(kwallet)/d' ${WRKSRC}/plugins/CMakeLists.txt

post-patch-RDP-off:
	${REINPLACE_CMD} -e '/find_suggested_package(FREERDP)/d' ${WRKSRC}/plugins/CMakeLists.txt
	${REINPLACE_CMD} -e '/add_subdirectory(rdp)/d' ${WRKSRC}/plugins/CMakeLists.txt

post-patch-SECRET-off:
	${REINPLACE_CMD} -e '/add_subdirectory(plugins\/secret)/d' ${WRKSRC}/CMakeLists.txt

post-patch-SPICE-off:
	${REINPLACE_CMD} -e '/find_suggested_package(SPICE)/d' ${WRKSRC}/plugins/CMakeLists.txt
	${REINPLACE_CMD} -e '/add_subdirectory(spice)/d' ${WRKSRC}/plugins/CMakeLists.txt

post-patch-SSH-off:
	${REINPLACE_CMD} -e '/find_suggested_package(LIBSSH)/d' ${WRKSRC}/plugins/CMakeLists.txt

post-patch-VNC-off:
	${REINPLACE_CMD} -e' /find_suggested_package(LIBVNCSERVER)/d' ${WRKSRC}/plugins/CMakeLists.txt
	${REINPLACE_CMD} -e '/add_subdirectory(vnc)/d' ${WRKSRC}/plugins/CMakeLists.txt

post-patch-WWW-off:
	${REINPLACE_CMD} -e '/add_subdirectory(www)/d' ${WRKSRC}/plugins/CMakeLists.txt

.include <bsd.port.mk>
