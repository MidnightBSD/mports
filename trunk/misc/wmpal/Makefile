# New ports collection makefile for:	wmpal
# Date created:				20 April 2001
# Whom:					Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD: mports/misc/wmpal/Makefile,v 1.4 2010/11/20 04:53:44 laffer1 Exp $
# $FreeBSD: ports/misc/wmpal/Makefile,v 1.11 2006/03/07 08:26:54 ade Exp $
#

PORTNAME=	wmpal
PORTVERSION=	0.6.1
PORTREVISION=	4
CATEGORIES=	misc windowmaker
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A one of the most useless dockapps in the world
LICENSE=        gpl2

LIB_DEPENDS=	dockapp.2:${PORTSDIR}/x11-wm/libdockapp

USE_XORG=	xpm
USE_GNOME=	
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${X11BASE}/include" \
		LDFLAGS="-L${X11BASE}/lib"

PORTDOCS=	README

post-patch:
	@${REINPLACE_CMD} -e 's|"dino"|"daemon"|g' ${WRKSRC}/wmpal.c

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
.endif

.include <bsd.port.mk>
