PORTNAME=	portconfig
DISTVERSION=	0.6.1
CATEGORIES=	ports-mgmt

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility to set up BSD port options
WWW=		https://gitlab.com/alfix/portconfig

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${LOCALBASE}/lib/libbsddialog.a:devel/bsddialog

USES=		localbase:ldflags

USE_GITLAB=	yes
GL_ACCOUNT=	alfix

PLIST_FILES=	bin/${PORTNAME} \
		share/man/man1/${PORTNAME}.1.gz

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${STAGEDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.1 ${STAGEDIR}${PREFIX}/share/man/man1/

.include <bsd.port.mk>
