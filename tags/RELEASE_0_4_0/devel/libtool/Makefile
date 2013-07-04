# $MidnightBSD: mports/devel/libtool/Makefile,v 1.2 2011/07/16 15:27:24 laffer1 Exp $

PORTNAME?=	libtool
PORTVERSION=	2.4.2
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	libtool
DISTNAME=	libtool-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generic shared library support script
LICENSE=	gpl2

GNU_CONFIGURE=	yes
CONFIGURE_ARGS?= --disable-ltdl-install
CONFIGURE_ENV=	MAKEINFO="makeinfo --no-split"
INFO?=		libtool
.if ${PORTNAME} != "libltdl"
MAN1=		libtool.1 libtoolize.1
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|sed gsed|sed|g' \
		-e 's|CC=cc|CC=${CC}|g' \
		${WRKSRC}/configure ${WRKSRC}/libltdl/configure

post-configure:
	@${FIND} ${WRKSRC} -type f | ${XARGS} ${TOUCH} -f

.include <bsd.port.mk>
