# $MidnightBSD$

PORTNAME=	snappy
PORTVERSION=	1.0.5
CATEGORIES=	archivers
MASTER_SITES=	${MASTER_SITE_GOOGLE_CODE}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A fast compressor/decompressor library
LICENSE=	bsd3

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

ONLY_FOR_ARCH=	i386 amd64

post-patch:
.if defined(NOPORTDOCS)
	${REINPLACE_CMD} -e \
		'/^install-data-am:/ s|install-dist_docDATA||' \
		${WRKSRC}/Makefile.in
.endif

.include <bsd.port.mk>
