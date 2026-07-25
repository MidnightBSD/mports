PORTNAME=	libvalkey
DISTVERSION=	0.5.0
CATEGORIES=	databases

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Valkey client library in C
WWW=		https://github.com/valkey-io/${PORTNAME}

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gmake
USE_GITHUB=	yes
GH_ACCOUNT=	valkey-io

MAKE_ARGS=	DEBUG_FLAGS= \
		OPTIMIZATION= \
		PREFIX=${TRUE_PREFIX}

ALL_TARGET=	dynamic

OPTIONS_DEFINE=		TLS
OPTIONS_DEFAULT=	TLS
OPTIONS_SUB=		yes

TLS_USES=	ssl
TLS_MAKE_ARGS=	USE_TLS=1

post-install:
	${STRIP_CMD} ${PREFIX}/lib/libvalkey.so.${DISTVERSION}

	@if [ -e ${PREFIX}/lib/libvalkey_tls.so.${DISTVERSION} ]; then \
		${STRIP_CMD} ${PREFIX}/lib/libvalkey_tls.so.${DISTVERSION}; \
	fi

.include <bsd.port.mk>
