PORTNAME=	zpool-iostat-viz
DISTVERSION=	3
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ZFS pool I/O latency statistics
WWW=		https://github.com/chadmiller/zpool-iostat-viz

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python shebangfix
USE_GITHUB=	yes
GH_ACCOUNT=	chadmiller
SHEBANG_FILES=	${WRKSRC}/${PORTNAME}

NO_ARCH=	yes
NO_BUILD=	yes

PLIST_FILES=	bin/${PORTNAME} share/man/man1/${PORTNAME}.1.gz

do-install:
		${INSTALL_SCRIPT} ${WRKSRC}/${PORTNAME} ${STAGEDIR}${PREFIX}/bin
		${INSTALL_MAN} ${FILESDIR}/${PORTNAME}.1 ${STAGEDIR}${PREFIX}/share/man/man1

.include <bsd.port.mk>
