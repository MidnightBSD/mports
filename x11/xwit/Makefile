PORTNAME=	xwit
PORTVERSION=	3.4
CATEGORIES=	x11
MASTER_SITES=	XCONTRIB/utilities:source1 FREEBSD_LOCAL/ehaupt:source2
DISTFILES=	${PORTNAME}-${DISTVERSION}${EXTRACT_SUFX}:source1 \
		${PORTNAME}-patchset-${PORTVERSION}${EXTRACT_SUFX}:source2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X interface tool

LICENSE=	mit

USES=		imake xorg
USE_XORG=	x11 xext

PLIST_FILES=	bin/xwit share/man/man1/xwit.1.gz

EXTRA_PATCHES=	${WRKDIR}/${PORTNAME}-patchset-${PORTVERSION}/patch-*

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/${PORTNAME}._man \
		${PREFIX}/share/man/man1/${PORTNAME}.1

.include <bsd.port.mk>
