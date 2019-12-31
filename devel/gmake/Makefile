PORTNAME=	gmake
PORTVERSION=	4.2.1
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	GNU/make
DISTNAME=	make-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU version of 'make' utility

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--program-prefix=g \
		--without-guile

USES=		cpe tar:bzip2
CPE_VENDOR=	gnu

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes

NLS_USES=	gettext-runtime
#NLS_CONFIGURE_ON=	${ICONV_CONFIGURE_ARG} \
#		--with-libintl-prefix=${LOCALBASE}
NLS_CONFIGURE_ENABLE=	nls

INFO=		make

.include <bsd.port.mk>
