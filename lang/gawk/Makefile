# $MidnightBSD: mports/lang/gawk/Makefile,v 1.5 2011/09/22 22:48:51 laffer1 Exp $

PORTNAME=	gawk
PORTVERSION=	4.0.2
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

MAN1=		gawk.1 dgawk.1 igawk.1 pgawk.1

PLIST_SUB=	VERSION=${PORTVERSION}

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNLS}
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

post-patch:
	@${RM} -f ${WRKSRC}/doc/*.info
	@${REINPLACE_CMD} -e 's/ -export-dynamic/ -Wl,--export-dynamic/' \
		${WRKSRC}/configure

.include <bsd.port.mk>
