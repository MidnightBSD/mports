# $MidnightBSD: mports/archivers/gtar/Makefile,v 1.12 2011/02/02 20:03:21 laffer1 Exp $

PORTNAME=	gtar
PORTVERSION=	1.25
PORTREVISION=	0
CATEGORIES=	archivers sysutils
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}
DISTFILES=	tar-${PORTVERSION}.tar.xz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU version of the traditional tape archiver
LICENSE=	gpl3

RUN_DEPENDS=	lzop:${PORTSDIR}/archivers/lzop

INFO=		tar

USE_AUTOTOOLS=	autoconf:env	# autom4te
USE_XZ=		yes
USE_ICONV=	yes
GNU_CONFIGURE=	yes
MAKE_JOBS_SAFE=	yes
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

.include <bsd.port.pre.mk>

.if (${OSVERSION} < 4003)
RUN_DEPENDS+= xz:${PORTSDIR}/archivers/xz
.endif

regression-test: build
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE} check

.include <bsd.port.post.mk>
