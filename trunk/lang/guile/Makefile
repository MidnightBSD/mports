# $MidnightBSD: mports/lang/guile/Makefile,v 1.11 2011/12/15 00:57:48 laffer1 Exp $

PORTNAME=	guile
PORTVERSION=	1.8.8
PORTREVISION=	0
CATEGORIES=	lang scheme
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	guile

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Ubiquitous Intelligent Language for Extension
LICENSE=	lgpl

LIB_DEPENDS=	gmp.10:${PORTSDIR}/math/gmp

USE_AUTOTOOLS=	autoconf libltdl
USE_GMAKE=	yes
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_GNOME=	
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.0 \
			--host=${ARCH}-portbld-freebsd6.0
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GUILE_VER=	1.8
PLIST_SUB=	GUILE_VER=${GUILE_VER}

MAN1=		guile.1

REINPLACE_FILES=	libguile/smob.c libguile/filesys.c libguile/gc.c \
			libguile/mallocs.c libguile/eval.c libguile/gc-malloc.c \
			libguile/ports.c libguile/gc-mark.c libguile/gc_os_dep.c

INFO=		goops guile-tut guile r5rs

.include <bsd.port.pre.mk>

post-extract:
	cd ${WRKSRC}; ${CHMOD} u+w ${REINPLACE_FILES}
	@${FIND} ${WRKSRC}/doc -name "*.info*" -delete

post-patch:
	@cd ${WRKSRC} ; \
	  ${REINPLACE_CMD} -e 's|<malloc\.h>|<stdlib.h>|g' ${REINPLACE_FILES}
	@${REINPLACE_CMD} -e 's|%%X11BASE%%|${LOCALBASE}|g ; \
		s|%%LOCALBASE%%|${LOCALBASE}|g' ${WRKSRC}/libguile/load.c
	@${REINPLACE_CMD} -e 's|2.61|2.62|g' ${WRKSRC}/aclocal.m4

.include <bsd.port.post.mk>
