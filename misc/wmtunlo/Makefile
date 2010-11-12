# $MidnightBSD: mports/misc/wmtunlo/Makefile,v 1.4 2010/01/02 19:12:11 laffer1 Exp $
# $FreeBSD: ports/misc/wmtunlo/Makefile,v 1.7 2004/05/16 23:45:05 adamw Exp $
#

PORTNAME=	wmtunlo
PORTVERSION=	0.1.3
PORTREVISION=   2
CATEGORIES=	misc windowmaker
MASTER_SITES=	http://www.gnu-darwin.org/distfiles/ \
		http://cvsup.theplanet.com/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A falling-down-a-tunnel dockapp
LICENSE=        gpl2

USE_XORG=	x11 xpm xextproto
ALL_TARGET=	wmtunlo

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/wmtunlo ${PREFIX}/bin
	@${MKDIR} ${EXAMPLESDIR}
	@${INSTALL_SCRIPT} ${WRKSRC}/examples/* \
		${EXAMPLESDIR}

.include <bsd.port.mk>
