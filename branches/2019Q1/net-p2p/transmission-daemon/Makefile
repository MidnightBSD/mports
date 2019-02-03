# $MidnightBSD$

PORTREVISION=	1
PKGNAMESUFFIX=	-daemon

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast and lightweight daemon BitTorrent client

RUN_DEPENDS=	${GEN_RUN_DEPENDS}

DESCR=		${.CURDIR}/pkg-descr
MASTERDIR=	${.CURDIR}/../transmission-cli
PLIST=		${.CURDIR}/pkg-plist
SLAVEPORT=	daemon

USE_RC_SUBR=	transmission
USERS=		transmission
GROUPS=		transmission

EXTRA_CONF_ARGS=--disable-cli \
		--enable-daemon \
		--without-gtk \
		--disable-mac \
		--disable-nls

.include "${MASTERDIR}/Makefile"
