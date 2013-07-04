# $MidnightBSD: mports/x11-wm/blackbox/Makefile,v 1.8 2011/05/15 19:17:14 laffer1 Exp $

PORTNAME=	blackbox
PORTVERSION=	0.70.1
PORTREVISION=	3
CATEGORIES=	x11-wm
MASTER_SITES=	SF/${PORTNAME}wm/${PORTNAME}wm/Blackbox%20${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A small and fast window manager for X11R6
LICENSE=	mit

PORTDOCS=	AUTHORS COMPLIANCE ChangeLog LICENSE README RELNOTES TODO
MAN1=		blackbox.1

USE_XORG=	x11 xft
USE_GNOME=	gnomehack pkgconfig
GNU_CONFIGURE=	yes
USE_ICONV=	yes

post-patch:
	@${REINPLACE_CMD} -e 's#-pedantic##' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's# bsetroot.1 bsetbg.1##' ${WRKSRC}/doc/Makefile.in
	# Fix the build with libX11 > 1.40
	@${REINPLACE_CMD} -e 's/_XUTIL_H_/_X11&/' ${WRKSRC}/lib/Util.hh

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for doc in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${doc} ${DOCSDIR}/
.endfor
.endif

.include <bsd.port.mk>
