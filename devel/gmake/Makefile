# $MidnightBSD$

PORTNAME=	gmake
PORTVERSION=	4.1
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	GNU/make
DISTNAME=	make-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU version of 'make' utility

LICENSE=	gpl3

USES=		makeinfo tar:bzip2
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--program-prefix=g \
		--without-guile

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes

.include <bsd.mport.options.mk>

.if defined(WITH_NLS)
USES+=	gettext iconv
CONFIGURE_ARGS+=	${ICONV_CONFIGURE_ARG} \
			--with-libintl-prefix=${LOCALBASE}
#NLS_CONFIGURE_ENABLE=	nls
.endif

CONFIGURE_ENV+=	MAKEINFO="makeinfo --no-split"

INFO=		make

post-patch:
	@${REINPLACE_CMD} -e '/no-print-dir/s/@itemx/@item/' \
		${WRKSRC}/doc/make.texi
	@${RM} ${WRKSRC}/doc/make.info*

post-install:
	@${CHMOD} g-s ${PREFIX}/bin/gmake
	@chgrp ${BINGRP} ${PREFIX}/bin/gmake

.include <bsd.port.mk>
