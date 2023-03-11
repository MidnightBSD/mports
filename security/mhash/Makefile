PORTNAME=	mhash
PORTVERSION=	0.9.9.9
PORTREVISION=	6
CATEGORIES=	security
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Easy-to-use library for strong hashes such as MD5 and SHA1
WWW=		http://mhash.sourceforge.net/

LICENSE=	lgpl+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		libtool tar:bzip2
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--enable-static \
			--with-gnu-ld

PORTDOCS=	example.c skid2-authentication

OPTIONS_DEFINE=	DOCS

post-install:
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libmhash.so

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/doc/,} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
