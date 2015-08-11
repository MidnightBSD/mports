# $MidnightBSD$

PORTNAME=	recode
PORTVERSION=	3.6
DISTVERSIONPREFIX=	v
PORTREVISION=	12
CATEGORIES=	converters

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Converts files between character sets and usages

LICENSE=	gpl2

USE_GITHUB=	yes
GH_ACCOUNT=	pinard
GH_PROJECT=	Recode

WRKSRC=		${WRKDIR}/${GH_PROJECT}-${PORTVERSION}

GNU_CONFIGURE=	yes
USES=		gettext iconv libtool perl5
USE_PERL5=	run build
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--without-included-gettext
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib ${ICONV_LIB}

INFO=		recode

post-extract:
	@${CP} ${FILESDIR}/ru.po ${WRKSRC}/i18n
	@${RM} -f ${WRKSRC}/doc/${PORTNAME}.info*

post-patch:
	@${REINPLACE_CMD} -E \
		'/Project-Id-Version/ { \
			s/3\.[45](r|\.[0-9])?/3.6/; \
			s/: (Free )?recode/: GNU recode/; }' \
		${WRKSRC}/i18n/*.po
	@${REINPLACE_CMD} 's,"iconv\.h","${ICONV_PREFIX}/include/iconv.h",' \
		${WRKSRC}/src/libiconv.c
	@${CP} ${WRKSRC}/lib/error.c ${WRKSRC}/src

.include <bsd.port.mk>
