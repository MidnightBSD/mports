# $MidnightBSD$
# $FreeBSD: head/x11-wm/compton/Makefile 412351 2016-04-01 14:33:55Z mat $

PORTNAME=	compton
PORTVERSION=	20150920
CATEGORIES=	x11-wm

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Feature-rich compositing window manager for X11

LICENSE=	mit

FAKE_OPTS+=	trueprefix

LIB_DEPENDS=	libconfig.so:devel/libconfig
RUN_DEPENDS=	xprop:x11/xprop \
		xwininfo:x11/xwininfo

USE_GITHUB=	yes
GH_ACCOUNT=	chjj
GH_TAGNAME=	d7f95b5

WRKSRC=		${WRKDIR}/compton-d7f95b5

MAKE_JOBS_UNSAFE=	yes

USES=		gmake pkgconfig
USE_XORG=	x11 xcomposite xdamage xext xfixes xrandr xrender

MAKE_ARGS=	COMPTON_VERSION=git-${PORTVERSION}-${GH_TAGNAME} \
		XDGDIR=${LOCALBASE}/etc/xdg
ALL_TARGET=	${PORTNAME}

OPTIONS_DEFINE=	PCRE DRM OPENGL DBUS DOCS
OPTIONS_DEFAULT=	PCRE DRM OPENGL DBUS

PCRE_DESC=	Blacklist support (via libpcre)
DRM_DESC=	DRM support
DOCS_DESC=	Build manpages (requires AsciiDoc/DocBook)

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MPCRE}
LIB_DEPENDS+=	libpcre.so:devel/pcre
.else
MAKE_ARGS+=	NO_REGEX_PCRE=yes
.endif

.if ${PORT_OPTIONS:MDRM}
LIB_DEPENDS+=	libdrm.so:graphics/libdrm
.else
MAKE_ARGS+=	NO_VSYNC_DRM=yes
.endif

.if ${PORT_OPTIONS:MOPENGL}
USE_GL=		gl
.else
MAKE_ARGS+=	NO_VSYNC_OPENGL=yes
.endif

.if ${PORT_OPTIONS:MDBUS}
LIB_DEPENDS+=	libdbus-1.so:devel/dbus
.else
MAKE_ARGS+=	NO_DBUS=yes
.endif

.if ${PORT_OPTIONS:MDOCS}
BUILD_DEPENDS=	a2x:textproc/asciidoc \
		xsltproc:textproc/libxslt \
		docbook-xml>0:textproc/docbook-xml \
		${LOCALBASE}/share/xsl/docbook/manpages/docbook.xsl:textproc/docbook-xsl
MAKE_ARGS+=	DOCDIR=${DOCSDIR} MANDIR=${MANPREFIX}/man/man1
ALL_TARGET+=	docs
PLIST_FILES+=	man/man1/compton.1.gz man/man1/compton-trans.1.gz
PORTDOCS=	README.md cdbus-driver.sh
.endif

post-patch:
# Adjust the location of configuration file
	@${REINPLACE_CMD} -e '/config_system_dir/s|/etc|${LOCALBASE}&|' \
		${WRKSRC}/src/compton.c

.include <bsd.port.mk>
