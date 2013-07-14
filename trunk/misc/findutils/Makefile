# $MidnightBSD: mports/misc/findutils/Makefile,v 1.7 2013/02/22 03:01:50 laffer1 Exp $

PORTNAME=	findutils
PORTVERSION=	4.5.11
PORTREVISION=	1
CATEGORIES=	misc
MASTER_SITES=	${MASTER_SITE_GNU_ALPHA}
MASTER_SITE_SUBDIR=	findutils
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}${EXTRACT_SUFX}.sig
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The GNU find utilities
LICENSE=	gpl3

USES+=		charsetfix
SIG_FILES=	${DISTNAME}${EXTRACT_SUFX}.sig
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

USE_GMAKE=	yes

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

CONFIGURE_ARGS+=	--program-prefix=g --localstatedir=${LOCALSTATEDIR} \
			--mandir=${PREFIX}/man --infodir=${PREFIX}/info
MAKE_ARGS=	INSTALL_SCRIPT="${INSTALL_SCRIPT}"
MAKE_JOBS_SAFE=	yes

INFO=		find find-maint
MAN1=		gfind.1 gxargs.1 glocate.1 gupdatedb.1 goldfind.1
MAN5=		glocatedb.5

LOCALSTATEDIR?=	/var/db

.include <bsd.port.mk>
