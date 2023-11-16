PORTNAME=	diffutils
PORTVERSION=	3.8
CATEGORIES=	textproc
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU diff utilities
WWW=		https://www.gnu.org/software/diffutils/diffutils.html

LICENSE=	gpl3+

LIB_DEPENDS=	libsigsegv.so:devel/libsigsegv

USES=		charsetfix cpe tar:xz
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--program-prefix=g
CPE_VENDOR=	gnu

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes
NLS_USES=	gettext iconv
NLS_CONFIGURE_ENABLE=nls

INFO=		diffutils

post-patch:
	@${REINPLACE_CMD} -e '/^mkdir/s:@mkdir_p@:${MKDIR}:' \
		${WRKSRC}/po/Makefile.in.in

.include <bsd.port.mk>
