#
#
# $MidnightBSD: ports/palm/libmal/Makefile,v 1.14 2008/04/16 11:13:00 gahr Exp $
#

PORTNAME=	libmal
PORTVERSION=	0.44
CATEGORIES=	palm
MASTER_SITES=	http://jasonday.home.att.net/code/libmal/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library encapsulating malsync
LICENSE=	mpl

LIB_DEPENDS=	pisock.9:${PORTSDIR}/palm/pilot-link

USE_GMAKE=	YES
GNU_CONFIGURE=	yes
HAS_CONFIGURE=	YES
CONFIGURE_ARGS=	--with-pilot-prefix=${LOCALBASE}
USE_LDCONFIG=	YES
CONFLICTS=	malsync-[0-9]*

.include <bsd.port.mk>
