# $MidnightBSD$
# $FreeBSD: ports/textproc/diffutils/Makefile,v 1.7 2006/05/13 04:24:43 edwin Exp $

PORTNAME=	diffutils
PORTVERSION=	3.3
CATEGORIES=	textproc
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The GNU diff utilities

LICENSE=	gpl3

LIB_DEPENDS=	sigsegv:${PORTSDIR}/devel/libsigsegv

USES=		charsetfix
USE_XZ=		yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--program-prefix=g

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes
NLS_USES=	gettext
NLS_CONFIGURE_ENABLE=nls

INFO=		diffutils

post-patch:
	@${REINPLACE_CMD} -e '/^mkdir/s:@mkdir_p@:${MKDIR}:' \
		${WRKSRC}/po/Makefile.in.in

.include <bsd.port.mk>
