# New ports collection makefile for:    synaptics
# Date created:				2004-01-02
# Whom:					nork@FreeBSD.org
#
# $FreeBSD: ports/x11-servers/synaptics/Makefile,v 1.6 2006/08/13 01:49:25 nork Exp $
# $MidnightBSD: mports/x11-servers/synaptics/Makefile,v 1.1 2006/12/11 02:44:10 laffer1 Exp $ 

PORTNAME=	synaptics
PORTVERSION=	0.14.6
PORTREVISION=	0
CATEGORIES=	x11-servers
MASTER_SITES=	http://web.telia.com/~u89404340/touchpad/files/:synaptics
DISTFILES=	${PORTNAME}-${PORTVERSION}${EXTRACT_SUFX}:synaptics \
		${X_DISTFILES:C/$/:x11/}
EXTRACT_ONLY=	${PORTNAME}-${PORTVERSION}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Synaptics touchpad X driver
LICENSE=	gpl2

BUILD_DEPENDS=	${X11BASE}/bin/X:${X_SERVER_PORT}
RUN_DEPENDS=	${BUILD_DEPENDS}

FAKE_OPTS=	trueprefix

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_X_PREFIX=	yes

.include <bsd.port.pre.mk>

X11VERSION!=	${MAKE} -C `${MAKE} -f bsd.port.mk -VX_SERVER_PORT` \
			-VPORTVERSION

.if	${X_WINDOW_SYSTEM:L} == xorg

MASTER_SITES+=	${MASTER_SITE_XORG:C/$/:x11/}
MASTER_SITE_SUBDIR=	X11R${X11VERSION}/src/:x11
DIST_SUBDIR=	xorg
X_DISTFILES=	X11R${X11VERSION}-src3.tar.gz

.else

BROKEN=		${X_WINDOW_SYSTEM:L} not supported.

.endif

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
	mkdir ${PREFIX}/lib/modules/input

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for FILE in ${PORTDOCS}
	@${INSTALL_DATA} ${WRKSRC}/${FILE} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.post.mk>
