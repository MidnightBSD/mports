# $MidnightBSD$

PORTNAME=	goom
PORTVERSION=	2k4.0
PORTREVISION=	2
CATEGORIES=	graphics
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}2k4/0
DISTNAME=	${PORTNAME}-${PORTVERSION:S|.|-|}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Visual effects library
LICENSE=	lgpl

WRKSRC=		${WRKDIR}/${PORTNAME}${PORTVERSION:S|.|-|}
USES=		pathfix libtool
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--disable-sdltest --enable-static
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes

.if exists(${X11R6}/bin/xmms) || defined(WITH_XMMS)
LIB_DEPENDS+=	libxmms.so:${PORTSDIR}/multimedia/xmms
PLIST_SUB+=	XMMS=""
.else
PLIST_SUB+=	XMMS="@comment "
.endif

pre-everything::
.if !defined(WITH_XMMS)
	@${ECHO} ""
	@${ECHO} "Define WITH_XMMS to build goom xmms visualization plugin"
	@${ECHO} ""
.endif

.include <bsd.port.mk>
