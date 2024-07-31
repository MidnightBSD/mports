PORTNAME=	xxhash
PORTVERSION=	0.8.2
DISTVERSIONPREFIX=	v
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extremely fast non-cryptographic hash algorithm
WWW=		https://xxhash.com/ \
		https://github.com/Cyan4973/xxHash

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

FAKE_OPTS=	trueprefix

USES=		gmake

USE_LDCONFIG=	yes

MAKE_ARGS+=	MANDIR=${PREFIX}/share/man/man1

PLIST_SUB=	PORTVERSION=${PORTVERSION}

USE_GITHUB=	yes
GH_ACCOUNT=	Cyan4973
GH_PROJECT=	xxHash

.include <bsd.port.mk>
