PORTNAME=	Horde_Css_Parser
PORTVERSION=	1.0.11
CATEGORIES=	www pear

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Horde CSS Parser
WWW=		https://pear.horde.org

LICENSE=	lgpl2.1

NO_ARCH=	yes

USES=	horde cpe

post-extract:
	${REINPLACE_CMD} -e '/<max>8\.0\.0alpha1<\/max>/d' \
		-e '/<exclude>8\.0\.0alpha1<\/exclude>/d' \
		${WRKDIR}/package.xml

.include <bsd.port.mk>
