# $MidnightBSD: mports/devel/gmake/Makefile,v 1.7 2011/09/22 12:55:44 laffer1 Exp $
# $FreeBSD: ports/devel/gmake/Makefile,v 1.62 2006/06/29 22:39:05 ade Exp $

PORTNAME=	gmake
PORTVERSION=	3.82
PORTREVISION=	0
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	make
DISTNAME=	make-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU version of 'make' utility
LICENSE=	gpl3

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd7.0
CONFIGURE_ARGS+=--program-prefix=g
.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
CONFIGURE_ARGS+=--with-libiconv-prefix=${LOCALBASE} \
		--with-libintl-prefix=${LOCALBASE}
PLIST_SUB=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB=	NLS="@comment "
.endif
CONFIGURE_ENV+=	MAKEINFO="makeinfo --no-split"

MAN1=		gmake.1
INFO=		make

.ifdef USE_GMAKE
.error You have `USE_GMAKE' variable defined either in environment or in make(1) arguments. Please undefine and try again.
.endif

post-patch:
	@${RM} ${WRKSRC}/doc/make.info*

post-install:
	@${CHMOD} g-s ${PREFIX}/bin/gmake
	@chgrp ${BINGRP} ${PREFIX}/bin/gmake

.include <bsd.port.mk>
