# $MidnightBSD: mports/textproc/diffutils/Makefile,v 1.2 2011/02/03 04:52:08 laffer1 Exp $
# $FreeBSD: ports/textproc/diffutils/Makefile,v 1.7 2006/05/13 04:24:43 edwin Exp $

PORTNAME=	diffutils
PORTVERSION=	3.2
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	diffutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The GNU diff utilities
LICENSE=	gpl3

LIB_DEPENDS=	sigsegv:${PORTSDIR}/devel/libsigsegv

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--program-prefix=g

INFO=		diffutils
MAN1=		gcmp.1 gdiff.1 gdiff3.1 gsdiff.1

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.else
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.endif

.include <bsd.port.mk>
