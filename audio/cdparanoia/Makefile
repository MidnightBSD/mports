PORTNAME=	cdparanoia
PORTVERSION=	3.9.8
PORTREVISION=	13
CATEGORIES=	audio sysutils
MASTER_SITES=	http://www.xiph.org/paranoia/download/
DISTNAME=	${PORTNAME}-${PORTVERSION:C/^3\./III-alpha/}
EXTRACT_SUFX=	.src.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CDDA extraction tool (also known as ripper)

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/GPL

USES=		gmake
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

post-patch:
	@${REINPLACE_CMD} -e 's/\(^ *default:\)/\1break;/' ${WRKSRC}/interface/utils.h

post-install:
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libcdda_*.so

.include <bsd.port.mk>
