PORTNAME=	sqlfs
PORTVERSION=	1.1
PORTEPOCH=	1
CATEGORIES=	filesystems
MASTER_SITES=	SAVANNAH/libsqlfs
PKGNAMEPREFIX=	fusefs-
DISTNAME=	lib${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SQLite backed FUSE file system
WWW=		https://www.nongnu.org/libsqlfs/

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		fuse sqlite

PORTDOCS=	README
PLIST_FILES=	bin/sqlfs

OPTIONS_DEFINE=	DOCS

do-build:
	(cd ${WRKSRC} && ${CC} -DFUSE -DFUSE_USE_VERSION=25		\
		-D_FILE_OFFSET_BITS=64 -D_REENTRANT ${CFLAGS}		\
		-I. -I${LOCALBASE}/include -L${LOCALBASE}/lib		\
		-lfuse -lsqlite${SQLITE_VER} sqlfs.c fuse_main.c	\
		-o sqlfs)

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/sqlfs ${STAGEDIR}${PREFIX}/bin

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
