PORTNAME=	gettext
PORTREVISION=	0
DISTFILES=

COMMENT=	GNU gettext meta package

LICENSE=	gpl3

.include "${.CURDIR}/../gettext/Makefile.common"

USES=		gettext-runtime:run gettext-tools:run

NO_BUILD=	yes
#NO_INSTALL=	yes

do-install:
	mkdir ${WRKSRC}

.include <bsd.port.mk>
