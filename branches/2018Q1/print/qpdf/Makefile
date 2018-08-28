# $MidnightBSD$
# $FreeBSD: head/print/qpdf/Makefile 369562 2014-09-29 22:38:09Z bdrewery $

PORTNAME=	qpdf
PORTVERSION=	5.1.2
CATEGORIES=	print
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command-line tools for transforming and inspecting PDF documents

LICENSE=	artistic2

BUILD_DEPENDS=	bash:${PORTSDIR}/shells/bash
LIB_DEPENDS=	libpcre.so:${PORTSDIR}/devel/pcre

OPTIONS_DEFINE=	SDK
OPTIONS_DEFAULT=	SDK
OPTIONS_SUB=	yes

SDK_DESC=	Install header files (required for cups-filters)

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USES=		gmake libtool

post-patch:
	@${REINPLACE_CMD} -e 's|/bin/bash|${LOCALBASE}/bin/bash|' \
		-e 's|(libdir)/pkgconfig|(prefix)/libdata/pkgconfig|g' \
		${WRKSRC}/make/libtool.mk

.include <bsd.port.mk>
