# $MidnightBSD$
# $FreeBSD: ports/textproc/diffutils/Makefile,v 1.7 2006/05/13 04:24:43 edwin Exp $

PORTNAME=	diffutils
PORTVERSION=	3.3
PORTREVISION=	2
CATEGORIES=	textproc
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU diff utilities

LICENSE=	gpl3

LIB_DEPENDS=	libsigsegv.so:${PORTSDIR}/devel/libsigsegv

USES=		charsetfix tar:xz
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--program-prefix=g

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes
NLS_USES=	gettext
NLS_CONFIGURE_ENABLE=nls

INFO=		diffutils

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=    NLS="@comment "
.else
USE_GETTEXT=   yes
PLIST_SUB+=    NLS=""
.endif

post-patch:
	@${REINPLACE_CMD} -e '/^mkdir/s:@mkdir_p@:${MKDIR}:' \
		${WRKSRC}/po/Makefile.in.in

.include <bsd.port.mk>
