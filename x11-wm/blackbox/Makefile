# New ports collection makefile for:	Blackbox
# Date created:		June 15, 1998
# Whom:			Brian Handy <handy@physics.montana.edu>
#
# $MidnightBSD: mports/x11-wm/blackbox/Makefile,v 1.7 2010/01/01 17:32:09 laffer1 Exp $
# $FreeBSD: ports/x11-wm/blackbox/Makefile,v 1.46 2006/05/13 05:00:41 edwin Exp $
#

PORTNAME=	blackbox
PORTVERSION=	0.70.1
PORTREVISION=	2
CATEGORIES=	x11-wm
MASTER_SITES=	SF/${PORTNAME}wm/${PORTNAME}wm/Blackbox%20${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A small and fast window manager for X11R6
LICENSE=	mit

CONFLICTS=	boxtools-*

PORTDOCS=	AUTHORS COMPLIANCE ChangeLog LICENSE README RELNOTES TODO
MAN1=		blackbox.1

USE_XORG=	x11 xft
USE_GNOME=	gnomehack pkgconfig
GNU_CONFIGURE=	yes
USE_ICONV=	yes

post-patch:
	@${REINPLACE_CMD} -e 's#-pedantic##' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's# bsetroot.1 bsetbg.1##' ${WRKSRC}/doc/Makefile.in

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for doc in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${doc} ${DOCSDIR}/
.endfor
.endif

.include <bsd.port.mk>
