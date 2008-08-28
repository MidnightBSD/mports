# New ports collection makefile for:	findutils
# Date created:				29 March 2000
# Whom:					Robert Withrow <witr@rwwa.com>
#
# $MidnightBSD: mports/misc/findutils/Makefile,v 1.2 2007/11/12 01:06:02 laffer1 Exp $
# $FreeBSD: ports/misc/findutils/Makefile,v 1.30 2007/07/23 09:36:12 rafan Exp $
#

PORTNAME=	findutils
PORTVERSION=	4.4.0
CATEGORIES=	misc
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	findutils
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}${EXTRACT_SUFX}.sig
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The GNU find utilities
LICENSE=	gpl3

SIG_FILES=	${DISTNAME}${EXTRACT_SUFX}.sig
GNU_CONFIGURE=	yes
CONFIGURE_ENV=		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib"
USE_GMAKE=	yes
USE_GCC=	3.4+

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

CONFIGURE_ARGS+=	--program-prefix=g --localstatedir=${LOCALSTATEDIR} \
			--mandir=${PREFIX}/man --infodir=${PREFIX}/info
MAKE_ARGS=	INSTALL_SCRIPT="${INSTALL_SCRIPT}"

INFO=		find find-maint
MAN1=		gfind.1 gxargs.1 glocate.1 gupdatedb.1
MAN5=		glocatedb.5

LOCALSTATEDIR?=	/var/db

.include <bsd.port.mk>
