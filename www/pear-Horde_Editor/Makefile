PORTNAME=	Horde_Editor
PORTVERSION=	2.0.5
CATEGORIES=	www pear

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Horde Editor API
WWW=		https://pear.horde.org

LICENSE=	lgpl2.1

CONFLICTS=	horde-3*

USES=	horde cpe
USE_HORDE_BUILD=	Horde_Role
USE_HORDE_RUN=	Horde_Role \
		Horde_Browser \
		Horde_Exception \
		Horde_Serialize

post-extract:
	${REINPLACE_CMD} -e '/<max>8\.0\.0alpha1<\/max>/d' \
		-e '/<exclude>8\.0\.0alpha1<\/exclude>/d' \
		-e '/js\/ckeditor\/plugins\/dialog\/dialogDefinition\.js/d' \
		${WRKDIR}/package.xml

.include <bsd.port.mk>
