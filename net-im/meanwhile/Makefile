# New ports collection makefile for:	meanwhile
# Date created:		24 June 2004
# Whom:		 	Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/net-im/meanwhile/Makefile,v 1.2 2007/12/28 19:40:20 laffer1 Exp $
# $FreeBSD: ports/net-im/meanwhile/Makefile,v 1.25 2007/01/28 09:07:42 kris Exp $
#

PORTNAME=	meanwhile
PORTVERSION=	1.0.2
CATEGORIES=	net-im
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open Source implementation of the Lotus Sametime protocol
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool:15
USE_GMAKE=	yes
USE_GNOME=	gnomehack glib20
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-doxygen=no \
		--with-gmp-prefix=${LOCALBASE}
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

DOCSDIR=	${PREFIX}/share/doc/${PORTNAME}-doc-${PORTVERSION}

.include <bsd.port.mk>
