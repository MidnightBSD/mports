# $MidnightBSD: mports/x11/idesk/Makefile,v 1.7 2011/05/02 23:47:21 laffer1 Exp $

PORTNAME=	idesk
PORTVERSION=	0.7.5
PORTREVISION=	5
CATEGORIES=	x11
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Place launch icons and background directly on your desktop
LICENSE=	bsd3

BUILD_DEPENDS=	imlib2-config:${PORTSDIR}/graphics/imlib2
LIB_DEPENDS=	Xft.2:${PORTSDIR}/x11-fonts/libXft

USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_AUTOTOOLS=	autoconf
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

CXXFLAGS+=	`imlib2-config --cflags` `freetype-config --cflags`
MAKE_ARGS=	cc="${CXX}" cflags="${CXXFLAGS}"
SUB_FILES=	pkg-message

OPTIONS=	SHAPE	"Enable support of the XShape extension"	on \
		SN	"Startup notification support"	off

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_SHAPE)
CONFIGURE_ARGS+=	--enable-shape
.else
CONFIGURE_ARGS+=	--disable-shape
.endif

.if defined(WITH_SN)
LIB_DEPENDS+=	startup-notification-1.0:${PORTSDIR}/x11/startup-notification
CONFIGURE_ARGS+=	--enable-libsn
.endif

do-install:
		${INSTALL_PROGRAM} ${WRKSRC}/src/idesk ${PREFIX}/bin
		${MKDIR} ${PREFIX}/share/idesk
		${CP} ${WRKSRC}/examples/default.lnk ${PREFIX}/share/idesk/default.lnk.example
		${CP} ${WRKSRC}/examples/dot.ideskrc ${PREFIX}/share/idesk/dot.ideskrc.example
		${CP} ${WRKSRC}/examples/dot.xsession ${PREFIX}/share/idesk/dot.xsession.example
		${CP} ${WRKSRC}/examples/folder_home.xpm ${PREFIX}/share/idesk/folder_home.xpm.example
.if !defined(NOPORTDOCS)
		${MKDIR} ${DOCSDIR}
		${INSTALL_MAN} ${WRKSRC}/README ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
