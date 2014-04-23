# $MidnightBSD$

PORTNAME=	gmake
PORTVERSION=	3.82
PORTREVISION=	5
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	make
DISTNAME=	make-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU version of 'make' utility

LICENSE=	gpl3

USES=		tar:bzip2
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--program-prefix=g

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes

NLS_USES=	gettext iconv
NLS_CONFIGURE_ON=	${ICONV_CONFIGURE_ARG} \
			--with-libintl-prefix=${LOCALBASE}
NLS_CONFIGURE_ENABLE=	nls

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
