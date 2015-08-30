# Created by: Alexandr Kovalenko <never@nevermind.kiev.ua>
# $MidnightBSD$
# $FreeBSD: head/converters/enca/Makefile 368437 2014-09-18 09:51:18Z tijl $

PORTNAME=	enca
PORTVERSION=	1.13
CATEGORIES=	converters textproc russian ukrainian
MASTER_SITES=	http://dl.cihar.com/enca/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Detect encoding of text files

BUILD_DEPENDS=	umap:${PORTSDIR}/converters/p5-Unicode-Map8
LIB_DEPENDS=	librecode.so:${PORTSDIR}/converters/recode
RUN_DEPENDS=	umap:${PORTSDIR}/converters/p5-Unicode-Map8

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gmake iconv libtool pathfix pkgconfig tar:bzip2
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-html-dir=${DOCSDIR}
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} '/SUBDIRS =/s/test//' ${WRKSRC}/src/Makefile.in

.include <bsd.port.mk>
