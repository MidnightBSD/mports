# Created by: Jeremy Chadwick <freebsd@jdc.parodius.com>
# $FreeBSD: head/sysutils/mcelog/Makefile 444980 2017-07-03 19:06:08Z ultima $
# $MidnightBSD$

PORTNAME=	mcelog
PORTVERSION=	153
DISTVERSIONPREFIX=	v
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collects and decodes Machine Check Exception data

LICENSE=	gpl2

TEST_DEPENDS=	bash:shells/bash

USE_GITHUB=	yes
GH_ACCOUNT=	andikleen

USES=		alias gmake shebangfix

SHEBANG_FILES=	tests/cache/inject tests/memdb/inject tests/page/inject \
		tests/pfa/inject tests/server/inject tests/socket/inject \
		tests/trigger tests/unknown/inject

MAKE_ENV+=	FREEBSD=1
MAKE_ARGS+=	CFLAGS="${CFLAGS}" prefix="${PREFIX}"
LDFLAGS+=	-lkvm

PLIST_FILES=	bin/mcelog man/man8/mcelog.8.gz

post-patch:
	@${ECHO} "${DISTVERSIONPREFIX}${PORTVERSION}" >${WRKSRC}/.os_version
	@${CP} ${FILESDIR}/memstream.c ${WRKSRC}/memstream.c
	@${REINPLACE_CMD} 's/\"unknown\"/\"${PORTVERSION}\"/' \
		${WRKSRC}/Makefile

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/mcelog ${STAGEDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/mcelog.8 ${STAGEDIR}${MANPREFIX}/man/man8

.include <bsd.port.mk>
