PORTNAME=	lscpu
PORTVERSION=	1.2.0
PORTREVISION=	1
CATEGORIES=	sysutils

PATCH_SITES=	https://github.com/NanXiao/lscpu/commit/
PATCHFILES=	6243acc4393f32a0a52d8eeec35081ebb3027cfe.patch:-p2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Display information about the CPU architecture
WWW=		https://github.com/NanXiao/lscpu

LICENSE=	bsd3

USE_GITHUB=	yes
GH_ACCOUNT=	NanXiao

PLIST_FILES=	bin/${PORTNAME} share/man/man1/${PORTNAME}.1.gz

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.1 ${PREFIX}/share/man/man1

.include <bsd.port.mk>
