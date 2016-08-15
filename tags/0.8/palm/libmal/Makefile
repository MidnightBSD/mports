#
#
# $MidnightBSD$
#

PORTNAME=	libmal
PORTVERSION=	0.44.1
CATEGORIES=	palm
MASTER_SITES=	http://www.jlogday.com/code/libmal/

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
