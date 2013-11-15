# $MidnightBSD$

PORTNAME=	gtar
PORTVERSION=	1.26
PORTREVISION=	2
CATEGORIES=	archivers sysutils
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}
DISTFILES=	tar-${PORTVERSION}.tar.xz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU version of the traditional tape archiver

LICENSE=	gpl3

WRKSRC=		${WRKDIR}/tar-${PORTVERSION}

# only force dependencies for compressors that have a single-letter option
#RUN_DEPENDS=	# see below

INFO=		tar

USE_AUTOTOOLS=	autoconf:env	# autom4te
USE_XZ=		yes
USES=		iconv
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--program-prefix=g \
		--disable-silent-rules
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib ${LDSTATIC}
CONFIGURE_ENV=	DEFAULT_ARCHIVE=/dev/sa0 \
		DEFAULT_RMT_COMMAND=/etc/rmt

OPTIONS_DEFINE=	STATIC

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MSTATIC}
LDSTATIC=	-static
MAKE_ARGS+=	LIBINTL='$$(LTLIBINTL)' LIBICONV='$$(LTLIBICONV)'
.else
LDSTATIC=
.endif

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

regression-test: build
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE} check

.include <bsd.port.pre.mk>

# supply result to skip a test that will abort configure if run as root
.if ${OSVERSION} < 4016
CONFIGURE_ENV+=	gl_cv_func_mknod_works=no
.else
CONFIGURE_ENV+=	gl_cv_func_mknod_works=yes
.endif

.include <bsd.port.post.mk>
