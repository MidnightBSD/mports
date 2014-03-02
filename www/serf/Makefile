# $MidnightBSD$

PORTNAME=	serf
PORTVERSION=	1.3.4
CATEGORIES=	www
MASTER_SITES=	http://serf.googlecode.com/svn/src_releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Serf HTTP client library

LICENSE=	apache2

LIB_DEPENDS+=	apr-1:${PORTSDIR}/devel/apr

USE_SCONS=	yes
USE_BZIP2=	yes
USE_OPENSSL=	yes
USE_LDCONFIG=	yes

SUB_FILES=	libserf-1.la

OPTIONS_DEFINE=	DOCS

SCONS_ENV=	# empty
SCONS_BUILDENV=	# empty
SCONS_ARGS=	APR=${LOCALBASE}/bin/apr-1-config
SCONS_ARGS+=	APU=${LOCALBASE}/bin/apu-1-config
SCONS_ARGS+=	OPENSSL=${OPENSSLBASE}
SCONS_ARGS+=	PREFIX=${PREFIX}
SCONS_ARGS+=	CC=${CC}
SCONS_ARGS+=	CFLAGS="${CFLAGS}"
SCONS_INSTALL_TARGET=	install --install-sandbox=${STAGEDIR}

post-patch:
	@${REINPLACE_CMD} -e '/^Requires.private/d' ${WRKSRC}/build/serf.pc.in

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/design-guide.txt ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${SUB_FILES:S|^|${WRKDIR}/|} ${STAGEDIR}${PREFIX}/lib

regression-test check: build
	@(cd ${WRKSRC} && ${SCONS_BIN} check)

.include <bsd.port.mk>
