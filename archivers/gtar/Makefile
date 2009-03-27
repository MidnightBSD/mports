# $MidnightBSD: mports/archivers/gtar/Makefile,v 1.8 2008/09/30 23:46:13 laffer1 Exp $

PORTNAME=	tar
PORTVERSION=	1.22
CATEGORIES=	archivers sysutils
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}
PKGNAMEPREFIX=	g

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU version of the traditional tar archiver
LICENSE=	gpl3

INFO=		tar

USE_BZIP2=	yes
USE_ICONV=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--program-prefix=g --infodir=${PREFIX}/${INFO_PATH}
CONFIGURE_ENV=	CPPFLAGS='-I${LOCALBASE}/include' \
		LDFLAGS='-L${LOCALBASE}/lib ${LDSTATIC}' \
		DEFAULT_ARCHIVE=/dev/sa0 \
		DEFAULT_RMT_COMMAND=/etc/rmt

.if defined(WANT_STATIC)
LDSTATIC=	-static
.else
LDSTATIC=
.endif

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

# avoid auto framework rebuilds
#post-patch:
#	@${TOUCH} -r ${WRKSRC}/configure.orig ${WRKSRC}/configure

test: build
	@cd ${WRKSRC} && ${MAKE} check

.include <bsd.port.mk>
