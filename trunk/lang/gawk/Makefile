# $FreeBSD: ports/lang/gawk/Makefile,v 1.19 2004/07/11 10:30:37 krion Exp $
# $MidnightBSD: mports/lang/gawk/Makefile,v 1.4 2008/10/02 20:38:02 laffer1 Exp $

PORTNAME=	gawk
PORTVERSION=	4.0.0
CATEGORIES=	lang
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	gawk

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The GNU version of Awk
LICENSE=	gpl3

LIB_DEPENDS=	sigsegv:${PORTSDIR}/devel/libsigsegv

INFO=		gawk gawkinet

USE_XZ=		true
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-libiconv-prefix=${LOCALBASE} \
		--with-libintl-prefix=${LOCALBASE} \
		AWK=${AWK}

MAN1=		gawk.1 igawk.1 pgawk.1

PLIST_SUB=	VERSION=${PORTVERSION}

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

post-extract:
	@${RM} -f ${WRKSRC}/doc/*.info

.include <bsd.port.mk>
