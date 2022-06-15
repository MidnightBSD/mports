# Created by: Stefan Esser

PORTNAME=	fusefs-libs3
DISTVERSION=	3.11.0
CATEGORIES=	sysutils
MASTER_SITES=	https://github.com/libfuse/libfuse/releases/download/fuse-${DISTVERSION}/
DISTNAME=	fuse-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FUSE library version 3 for filesystems implemented in userspace

LICENSE=	gpl2 lgpl2.1
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		compiler iconv meson tar:xz
USE_LDCONFIG=	yes

LDFLAGS+=	-L${LOCALBASE}/lib ${ICONV_LIB}

PLIST_SUB=	VERSION=${PORTVERSION}

# magus
NO_TEST=	yes

.include <bsd.port.pre.mk>

.if ${CHOSEN_COMPILER_TYPE} == gcc
post-patch:
	${REINPLACE_CMD} -e '/-Wno-unused-result/d' ${WRKSRC}/meson.build
.endif

.include <bsd.port.post.mk>
