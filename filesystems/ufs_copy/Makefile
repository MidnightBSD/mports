PORTNAME=	ufs_copy
PORTVERSION=	20060921
CATEGORIES=	filesystems sysutils
MASTER_SITES=	https://people.freebsd.org/~simokawa/ufs/
DISTNAME=	ufs-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast copy utility for UFS filesystem
WWW=		https://people.freebsd.org/~simokawa/ufs/

LICENSE=	bsd4

USES=		uidfix
WRKSRC=		${WRKDIR}/ufs
MAKE_ARGS=	BINDIR=${PREFIX}/sbin

PORTDOCS=	README

OPTIONS_DEFINE=	DOCS

PLIST_FILES=	sbin/ufs_copy

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA}	${WRKSRC}/${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
