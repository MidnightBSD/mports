PORTNAME=	ipdbtools
DISTVERSIONPREFIX=	v
DISTVERSION=	1.1.2
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools for IP based Geo-blocking and Geo-routing

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

FAKE_OPTS=	trueprefix

USES=		compiler:c11
USE_GITHUB=	yes
GH_ACCOUNT=	cyclaero
GH_PROJECT=	ipdb

PLIST_FILES=	bin/ipup \
		bin/ipdb \
		bin/ipdb-update.sh \
		man/man1/ipdbtools.1.gz \
		man/man1/ipup.1.gz \
		man/man1/ipdb.1.gz \
		man/man1/ipdb-update.sh.1.gz

.include <bsd.port.mk>
