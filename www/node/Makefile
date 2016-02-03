# $MidnightBSD$
# $FreeBSD: head/www/node/Makefile 345528 2014-02-21 18:41:29Z swills $

PORTNAME=	node
PORTVERSION=	0.12.6
PORTREVISION=	0
CATEGORIES=	www
MASTER_SITES=	http://nodejs.org/dist/v${PORTVERSION}/
DISTNAME=	${PORTNAME}-v${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	V8 JavaScript for client and server

LICENSE=	mit

LIB_DEPENDS=	execinfo:${PORTSDIR}/devel/libexecinfo

HAS_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_PYTHON=	2
USES=		gmake compiler

CONFIGURE_ARGS=	--prefix=${PREFIX_RELDEST} --without-npm --shared-zlib \
		--dest-os=freebsd
PREFIX_RELDEST=	${PREFIX:S,^${DESTDIR},,}
REINPLACE_ARGS=	-i ''

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|' \
		${WRKSRC}/deps/v8/tools/gyp/v8.gyp
	@${REINPLACE_CMD} -e 's|/usr/bin/env python|${PYTHON_CMD}|' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e "s|'python',|'${PYTHON_CMD}',|" \
		${WRKSRC}/deps/v8/build/shim_headers.gypi \
		${WRKSRC}/deps/v8/tools/gyp/v8.gyp \
		${WRKSRC}/deps/v8/src/d8.gyp

post-install:
	${MKDIR} ${PREFIX}/lib/node_modules/
	${TOUCH} ${PREFIX}/lib/node_modules/.keepme
	${MV} ${PREFIX}/share/man/man1/node.1 ${PREFIX}/man/man1/node.1
	gzip ${PREFIX}/man/man1/node.1
	${CHMOD} ${MANMODE} ${PREFIX}/man/man1/node.1.gz

.include <bsd.port.mk>
