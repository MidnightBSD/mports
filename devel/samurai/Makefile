PORTNAME=	samurai
DISTVERSION=	1.2-16
DISTVERSIONSUFFIX=	-gca5a6ba
CATEGORIES=	devel
#MASTER_SITES=	https://github.com/michaelforney/samurai/releases/download/${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ninja-compatible build tool written in C

LICENSE=	apache2 mit
LICENSE_COMB=	multi
LICENSE_FILE_apache2=	${WRKSRC}/LICENSE
LICENSE_FILE_mit=	${WRKSRC}/LICENSE

USE_GITHUB=	yes
GH_ACCOUNT=	michaelforney
ALL_TARGET=	samu
PLIST_FILES=	bin/samu \
		share/man/man1/samu.1.gz

.include <bsd.port.mk>
