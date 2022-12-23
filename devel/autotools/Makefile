PORTNAME=	autotools
PORTVERSION=	20220528
CATEGORIES=	devel
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Autotools meta-port

LICENSE=	agg

RUN_DEPENDS=	libtoolize:devel/libtool \
		autoconf2.13:devel/autoconf2.13 \
		autoconf2.69:devel/autoconf2.69 \
		autoconf>=2.71:devel/autoconf \
		automake>=1.15:devel/automake

PLIST_FILES=	share/${PORTNAME}
NO_BUILD=	yes
NO_FETCH=	yes

do-install:
	${MKDIR} ${PREFIX}/share
	@${ECHO_CMD} "Placeholder file" > ${PREFIX}/share/${PORTNAME}

.include <bsd.port.mk>
