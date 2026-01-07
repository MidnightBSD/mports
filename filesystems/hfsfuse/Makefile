PORTNAME=	hfsfuse
DISTVERSION=	0.289
CATEGORIES=	filesystems
MASTER_SITES=	https://github.com/0x09/${PORTNAME}/releases/download/${DISTVERSION}/
PKGNAMEPREFIX=	fusefs-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FUSE driver for HFS+ filesystems
WWW=		https://github.com/0x09/hfsfuse

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libublio.so:devel/libublio \
		libutf8proc.so:textproc/utf8proc \
		liblzfse.so:archivers/lzfse

USES=		fuse gmake libarchive localbase
USE_CSTD=	gnu11
LDFLAGS+=	-L/usr/local/lib

ALL_TARGET=	config all

PLIST_FILES=	bin/hfsdump \
		bin/hfsfuse \
		bin/hfstar

PORTDOCS=	README.md

FAKE_MAKEARGS+=	CONFIG_CFLAGS="${CFLAGS}" \
		WITH_UBLIO=system \
		WITH_UTF8PROC=system \

OPTIONS_DEFINE=	DOCS

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/hfsdump ${STAGEDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/hfsfuse ${STAGEDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/hfstar ${STAGEDIR}${PREFIX}/bin

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.md ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
