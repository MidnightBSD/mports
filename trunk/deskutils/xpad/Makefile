# New ports collection makefile for:	xpad
# Date created:		6 March 2002
# Whom:			Guillaume Paquet <amyfoub@gmail.com>
#
# $MidnightBSD: mports/deskutils/xpad/Makefile,v 1.2 2008/06/19 22:48:09 laffer1 Exp $
# $FreeBSD: ports/deskutils/xpad/Makefile,v 1.16 2007/05/19 20:01:57 flz Exp $
#

PORTNAME=	xpad
PORTVERSION=	2.14
CATEGORIES=	deskutils
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A virtual note-pad system for your X11 desktop
LICENSE=        gpl2
USE_BZIP2=	yes
USE_GNOME=	pkgconfig gtk20 gnomehier intltool
USE_GMAKE=	yes
USE_XORG=	x11 sm
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="${CXXFLAGS} -I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

MAN1=		xpad.1

.include <bsd.port.mk>
