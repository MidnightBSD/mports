PORTNAME=	librsync
PORTVERSION=	2.3.2
CATEGORIES=	net devel
MASTER_SITES=	https://github.com/librsync/librsync/releases/download/v${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for delta compression of streams
WWW=		https://github.com/librsync/librsync

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libpopt.so:devel/popt

USES=		cmake compiler:c11 cpe perl5
USE_PERL5=	test
CPE_VENDOR=	librsync_project

TEST_TARGET=	check
USE_LDCONFIG=	yes

PLIST_SUB=	PORTVERSION=${PORTVERSION}

.include <bsd.port.mk>
