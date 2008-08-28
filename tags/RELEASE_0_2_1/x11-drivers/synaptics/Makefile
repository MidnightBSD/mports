# New ports collection makefile for:    synaptics
# Date created:				2004-01-02
# Whom:					nork@FreeBSD.org
#
# $FreeBSD: ports/x11-drivers/synaptics/Makefile,v 1.10 2007/10/07 10:36:14 erwin Exp $
# $MidnightBSD: mports/x11-drivers/synaptics/Makefile,v 1.2 2008/04/14 18:27:13 laffer1 Exp $
#

PORTNAME=	synaptics
PORTVERSION=	0.14.6
PORTREVISION=	1
CATEGORIES=	x11-drivers
MASTER_SITES=	http://web.telia.com/~u89404340/touchpad/files/:synaptics
DISTFILES=	${PORTNAME}-${PORTVERSION}${EXTRACT_SUFX}:synaptics \
		${X_DISTFILES:C/$/:x11/}
EXTRACT_ONLY=	${PORTNAME}-${PORTVERSION}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Synaptics touchpad X driver
LICENSE=	gpl

BUILD_DEPENDS=	${X11BASE}/bin/X:${X_SERVER_PORT}
RUN_DEPENDS=	${BUILD_DEPENDS}

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_XORG=	xorg-server xi xproto

FAKE_OPTS=	trueprefix

.include <bsd.port.pre.mk>

X11VERSION!=	${MAKE} -C `${MAKE} -f bsd.port.mk -VX_SERVER_PORT` \
			-VPORTVERSION

MASTER_SITES+=	ftp://ftp.freedesktop.org/pub/xorg/individual/xserver/:x11 \
                http://xorg.freedesktop.org/releases/individual/xserver/:x11
DIST_SUBDIR=	xorg/xserver
X_DISTFILES=	xorg-server-1.4.2.tar.bz2
PLIST_SUB+=	XORG="" XFREE86="@comment "
EXTRA_PATCHES=	${FILESDIR}/extra-xorg-server-1.4

post-patch:
	@${REINPLACE_CMD} 's|\(ALLINCLUDES = -I.\)|\1 -I${LOCALBASE}/include -I${LOCALBASE}/include/pixman-1|' \
		${WRKSRC}/Makefile

MAKE_ENV=	TOP=${WRKDIR}/xc CFLAGSCLIENT="${CFLAGS}"

MAN1=		synclient.1 # syndaemon.1
MAN5=		synaptics.5
PORTDOCS=	COMPATIBILITY FILES INSTALL INSTALL.DE INSTALL.FR \
		README README.alps TODO

post-extract:
.for FILE in ${X_DISTFILES}
	@cd ${WRKDIR} && \
		${GZIP_CMD} -dc ${_DISTDIR}/${FILE} | ${TAR} -xf -
.endfor


pre-install:
	${MKDIR} ${PREFIX}/lib/xorg/modules/input/

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for FILE in ${PORTDOCS}
	@${INSTALL_DATA} ${WRKSRC}/${FILE} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.post.mk>
