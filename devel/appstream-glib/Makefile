# $MidnightBSD$
# $FreeBSD: head/devel/appstream-glib/Makefile 385521 2015-05-06 15:16:53Z mat $

PORTNAME=	appstream-glib
PORTVERSION=	0.2.6
CATEGORIES=	devel
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to help with AppStream metadata

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	gtkdoc-check:${PORTSDIR}/textproc/gtk-doc
LIB_DEPENDS=	libsoup-2.4.so:${PORTSDIR}/devel/libsoup

GH_ACCOUNT=	hughsie
GH_TAGNAME=	f4f3230

WRKSRC=		${WRKDIR}/${PORTNAME}-${GH_TAGNAME}

USES=		autoreconf:build gettext gmake libtool pathfix pkgconfig
USE_GNOME=	gdkpixbuf2 glib20 gtk30
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
USE_GITHUB=	yes
PATHFIX_MAKEFILEIN=	Makefile.am
INSTALL_TARGET=	install-strip

.include <bsd.mport.options.mk>

LIB_DEPENDS+=	libarchive.so.13:${PORTSDIR}/archivers/libarchive

post-patch:
	@${REINPLACE_CMD} -e 's|-Wtype-limits||g' \
		${WRKSRC}/configure.ac

pre-configure:
	(cd ${WRKSRC} && ${SETENV} NOCONFIGURE=yes ${SH} ./autogen.sh)
	${REINPLACE_CMD} 's/DATADIRNAME=lib/DATADIRNAME=share/' \
		${WRKSRC}/configure

.include <bsd.port.mk>
