PORTNAME=	enca
PORTVERSION=	1.19
CATEGORIES=	converters textproc russian ukrainian
MASTER_SITES=	https://dl.cihar.com/enca/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Detect encoding of text files
WWW=		http://gitorious.org/enca

BUILD_DEPENDS=	umap:converters/p5-Unicode-Map8
LIB_DEPENDS=	librecode.so:converters/recode
RUN_DEPENDS=	umap:converters/p5-Unicode-Map8

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gmake iconv libtool localbase pathfix pkgconfig tar:xz
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-html-dir=${DOCSDIR}
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} '/SUBDIRS =/s/test//' ${WRKSRC}/src/Makefile.in

.include <bsd.port.mk>
