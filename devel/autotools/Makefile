# $MidnightBSD$

PORTNAME=	autotools
PORTVERSION=	20130627
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Autotools meta-port

LICENSE=	agg

RUN_DEPENDS=	libtoolize:${PORTSDIR}/devel/libtool \
		autoconf-2.13:${PORTSDIR}/devel/autoconf213 \
		autoconf-2.69:${PORTSDIR}/devel/autoconf \
		automake-1.16:${PORTSDIR}/devel/automake

PLIST_FILES=	share/${PORTNAME}
NO_BUILD=	yes
NO_FETCH=	yes

do-install:
	@${ECHO_CMD} "Placeholder file" > ${PREFIX}/${PLIST_FILES}

.include <bsd.port.mk>
