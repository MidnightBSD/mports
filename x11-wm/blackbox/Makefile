# New ports collection makefile for:	Blackbox
# Date created:		June 15, 1998
# Whom:			Brian Handy <handy@physics.montana.edu>
#
# $MidnightBSD: mports/x11-wm/blackbox/Makefile,v 1.5 2008/05/31 19:40:21 laffer1 Exp $
# $FreeBSD: ports/x11-wm/blackbox/Makefile,v 1.46 2006/05/13 05:00:41 edwin Exp $
#

PORTNAME=	blackbox
PORTVERSION=	0.70.1
PORTREVISION=	1
CATEGORIES=	x11-wm
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	blackboxwm

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A small and fast window manager for X11R6
LICENSE=	mit

LIB_DEPENDS=	Xft.2:${PORTSDIR}/x11-fonts/libXft

CONFLICTS=	boxtools-*

PORTDOCS=	AUTHORS COMPLIANCE ChangeLog LICENSE README RELNOTES TODO
MAN1=		blackbox.1

USE_XLIB=	yes
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
