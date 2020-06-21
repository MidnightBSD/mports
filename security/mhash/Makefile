PORTNAME=	mhash
PORTVERSION=	0.9.9.9
PORTREVISION=	5
CATEGORIES=	security
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Easy-to-use library for strong hashes such as MD5 and SHA1

LICENSE=	lgpl

USES=		tar:bzip2 libtool
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--enable-static \
			--with-gnu-ld

PORTDOCS=	example.c skid2-authentication

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/doc/,} ${DOCSDIR}
.endif

.include <bsd.port.mk>
