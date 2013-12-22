# $MidnightBSD$

PORTNAME=	gdbm
PORTVERSION=	1.10
CATEGORIES=	databases
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU database manager

LICENSE=        gpl3

FAKE_OPTS+=	prefixhack

GNU_CONFIGURE=	yes
USE_AUTOTOOLS=	libtool
USE_GMAKE=	yes
USE_LDCONFIG=	yes
DESTDIRNAME=	INSTALL_ROOT

MAKE_JOBS_UNSAFE=	yes

INFO=		gdbm
MAN3=		gdbm.3

OPTIONS_DEFINE=	COMPAT NLS
COMPAT_DESC=	Enable dbm/ndbm compatibility

NO_STAGE=	yes
.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MCOMPAT}
CONFIGURE_ARGS=	--enable-libgdbm-compat
PLIST_SUB+=	GDBM_COMPAT=""
.else
PLIST_SUB+=	GDBM_COMPAT="@comment "
.endif

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} "s|prefix = @prefix@|prefix = ${TARGETDIR}|" \
			${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e "s|LIBS = @LIBS@ -lc|LIBS = @LIBS@|" \
		-e "s|BINOWN = bin|BINOWN = root|" -e "s|BINGRP = bin|BINGRP = wheel|" \
		-e "s|libgdbm.la libgdbm_compat.la|libgdbm.la libgdbm_compat.la gdbm.info|" \
			${WRKSRC}/Makefile.in

.include <bsd.port.mk>
