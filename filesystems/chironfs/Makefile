PORTNAME=	chironfs
PORTVERSION=	1.1.1
CATEGORIES=	filesystems
MASTER_SITES=	https://BSDforge.com/projects/source/sysutils/chironfs/
PKGNAMEPREFIX=	fusefs-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FUSE based filesystem with replication at the filesystem level
WWW=		https://BSDforge.com/projects/sysutils/fusefs-chironfs/

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/doc/copyright

USES=		fuse localbase:ldflags
GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd12.4

PLIST_FILES=	bin/chironfs bin/chirctl share/man/man8/chironfs.8.gz
PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e 's,-liconv,${ICONV_LIB},' ${WRKSRC}/src/Makefile.*

post-patch-DOCS-off:
	@${REINPLACE_CMD} -e 's, doc , ,' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
