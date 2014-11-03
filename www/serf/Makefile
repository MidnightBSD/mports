# $MidnightBSD$

PORTNAME=	serf
PORTVERSION=	1.3.8
CATEGORIES=	www
MASTER_SITES=	http://serf.googlecode.com/svn/src_releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Serf HTTP client library

LICENSE=	apache2

LIB_DEPENDS+=	apr-1:${PORTSDIR}/devel/apr

USE_SCONS=	yes
USES=		tar:bzip2 cpe
USE_OPENSSL=	yes
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	DOCS GSSAPI

SCONS_ENV=	# empty
SCONS_BUILDENV=	# empty
SCONS_ARGS=	APR=${LOCALBASE}/bin/apr-1-config
SCONS_ARGS+=	APU=${LOCALBASE}/bin/apu-1-config
SCONS_ARGS+=	OPENSSL=${OPENSSLBASE}
SCONS_ARGS+=	PREFIX=${PREFIX}
SCONS_ARGS+=	CC=${CC}
SCONS_ARGS+=	CFLAGS="${CFLAGS}"

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MGSSAPI}
SCONS_ARGS+=	GSSAPI="/usr"
.endif

post-patch:
	@${REINPLACE_CMD} -e '/^Requires.private/d' ${WRKSRC}/build/serf.pc.in

post-install:
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/design-guide.txt ${DOCSDIR}

regression-test check: build
	@(cd ${WRKSRC} && ${SCONS_BIN} check)

.include <bsd.port.mk>
