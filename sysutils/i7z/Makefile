PORTNAME=	i7z
PORTVERSION=	0.27.4
DISTVERSIONPREFIX=	v
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Thermal and C-state reporting utility for Intel Core CPUs
WWW=		https://github.com/DimitryAndric/i7z

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USE_GITHUB=	yes
GH_ACCOUNT=	DimitryAndric

USES=		gmake

PLIST_FILES=	bin/${PORTNAME} \
		share/man/man1/${PORTNAME}.1.gz

ONLY_FOR_ARCHS=	i386 amd64

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${STAGEDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/doc/${PORTNAME}.man \
		${STAGEDIR}${PREFIX}/share/man/man1/${PORTNAME}.1

.include <bsd.port.mk>
