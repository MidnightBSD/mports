PORTNAME=	oto
PORTVERSION=	0.5
PORTREVISION=	1
CATEGORIES=	chinese print
MASTER_SITES=	SF

MAINTAINER=	ports@FMidnightBSD.org
COMMENT=	Show you font info and add new 'name' and 'cmap' tables
WWW=		https://sourceforge.net/projects/oto/

LICENSE=	NONE

USES=		gmake iconv
GNU_CONFIGURE=	YES
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib ${ICONV_LIB}

post-patch:
	@${FIND} ${WRKSRC}/src/ -type f -print0 | \
	    ${XARGS} -0 ${REINPLACE_CMD} -e 's,stdint.h,inttypes.h,'

.include <bsd.port.mk>
