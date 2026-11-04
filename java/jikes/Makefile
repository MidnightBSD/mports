PORTNAME=	jikes
PORTVERSION=	1.22
PORTREVISION=	3
CATEGORIES=	java
MASTER_SITES=	SF/${PORTNAME}/Jikes/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Java source to byte-code compiler made available by IBM
WWW=		http://jikes.sf.net/

LICENSE=	other

PLIST_SUB=	PORTVERSION=${PORTVERSION}
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	ac_cv_search_iconv=${ICONV_LIB} \
		ac_cv_search_libiconv_open=no
USES=		autoreconf iconv gmake localbase tar:bzip2
USE_CXXSTD=	c++14

.include <bsd.port.mk>
