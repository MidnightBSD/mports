PORTNAME=	faac
PORTVERSION=	1.29.9.2
CATEGORIES=	audio
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}-src/${PORTNAME}-${PORTVERSION:R:R}

MAINTAINER=	ports@MidnightBSD>org
COMMENT=	MPEG-2 and MPEG-4 AAC audio encoder

LICENSE=	gpl2 lgpl2.1 ISO
LICENSE_COMB=	multi
LICENSE_NAME_ISO=	ISO/IEC14496
LICENSE_FILE=	${WRKSRC}/COPYING
LICENSE_FILE_ISO=	${WRKSRC}/README
LICENSE_PERMS_ISO=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES=		compiler:c11 gmake libtool
INSTALL_TARGET=	install-strip
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

.include <bsd.port.mk>
