PORTNAME=	915resolution
PORTVERSION=	0.5.3
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	sysutils
MASTER_SITES=	FREEBSD_LOCAL/cy

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Resolution tool for Intel i915 video cards

LICENSE=	publicdom
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

ONLY_FOR_ARCHS=	i386 amd64

USE_RC_SUBR=	915resolution

PORTDOCS=	README.txt chipset_info.txt changes.log

OPTIONS_DEFINE=	DOCS

do-build:
	cd ${WRKSRC} && \
		${CC} ${CFLAGS} 915resolution.c -o 915resolution

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/915resolution ${STAGEDIR}${PREFIX}/sbin

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
