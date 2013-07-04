# $MidnightBSD: mports/converters/recode/Makefile,v 1.7 2011/02/02 20:09:16 laffer1 Exp $

PORTNAME=	recode
PORTVERSION=	3.6
PORTREVISION=	8
CATEGORIES=	converters
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	recode

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Converts files between character sets and usages
LICENSE=	gpl2

USE_GETTEXT=	yes
USE_ICONV=	yes
USE_AUTOTOOLS=	libtool
USE_PERL5=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--without-included-gettext
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CFLAGS+=	-fPIC

MAN1=		recode.1
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
