# $MidnightBSD$

PORTNAME=	recode
PORTVERSION=	3.6
PORTREVISION=	10
CATEGORIES=	converters

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Converts files between character sets and usages

LICENSE=	gpl2

USES=		gettext iconv
USE_AUTOTOOLS=	libtool
USE_PERL5=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--without-included-gettext
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib ${ICONV_LIB}
CFLAGS+=	-fPIC

INFO=		recode

post-extract: copy-po-files remove-info-files

copy-po-files:
	@${CP} ${FILESDIR}/ru.po ${WRKSRC}/i18n

remove-info-files:
	@${RM} -f ${WRKSRC}/doc/${PORTNAME}.info*

post-patch:
	@${PERL} -pi -e '\
		if (/Project-Id-Version/) { \
			s/3\.[45](r|\.[0-9])?/3.6/; \
			s/: (Free )?recode/: GNU recode/; \
		} \
	' ${WRKSRC}/i18n/*.po

.include <bsd.port.mk>
