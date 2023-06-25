PORTNAME=	trivy
PORTVERSION=	0.41.0
CATEGORIES=	security
MASTER_SITES=	https://github.com/aquasecurity/trivy/releases/download/v0.41.0/
DISTNAME=	trivy_${PORTVERSION}_FreeBSD-64bit

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Security Scanner
WWW=		https://aquasecurity.github.io/trivy

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

WRKSRC=		${WRKDIR}
NO_BUILD=	yes

ONLY_FOR_ARCHS=	amd64

do-install:
	${CP} ${WRKDIR}/trivy ${PREFIX}/bin/trivy
	

.include <bsd.port.mk>
