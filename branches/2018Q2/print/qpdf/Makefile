# $MidnightBSD$
# $FreeBSD: head/print/qpdf/Makefile 369562 2014-09-29 22:38:09Z bdrewery $

PORTNAME=	qpdf
PORTVERSION=	7.1.1
CATEGORIES=	print
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command-line tools for transforming and inspecting PDF documents

LICENSE=	artistic2
LICENSE_FILE=	${WRKSRC}/Artistic-2.0

USES=		gmake jpeg libtool localbase
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-static
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e 's|(libdir)/pkgconfig|(prefix)/libdata/pkgconfig|g' \
		${WRKSRC}/make/libtool.mk

.include <bsd.port.mk>
