PORTNAME=	bmkdep
PORTVERSION=	20140112
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Construct Makefile dependency list

LICENSE=	bsd2

USE_GITHUB=	yes
GH_ACCOUNT=	trociny

USES=		uidfix
MAKE_ENV=	PKGDIR="${PKGDIR}" NO_OBJ=YES

FAKE_OPTS=	trueprefix

PLIST_FILES=	bin/bmkdep man/man1/bmkdep.1.gz

.include <bsd.port.mk>
